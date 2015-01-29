/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtend.auto.gwt

import com.google.gson.JsonArray
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import com.google.gson.JsonPrimitive
import com.google.gwt.core.client.JavaScriptObject
import com.google.gwt.core.client.JsArray
import java.util.Map.Entry
import java.util.regex.Pattern
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.CodeGenerationContext
import org.eclipse.xtend.lib.macro.RegisterGlobalsContext
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.ClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.TypeReference
import org.eclipse.xtend.lib.macro.declaration.Visibility

import static extension de.itemis.xtend.auto.gwt.StaticUtils.*

/**
 * Allows to implement a GWT OverlayType using a JSON example.
 * 
 * <pre>
 *  @OverlayTypeByExample('
 * 		// paste in example JSON data
 * 		{
 * 			"name" : "Hans"
 *      }
 *  ')
 *  class Person {}
 * </pre>
 */
@Active(OverlayTypeByExampleProcessor)
annotation OverlayTypeByExample {
	String value
}

class OverlayTypeByExampleProcessor extends AbstractClassProcessor {
	
	override doRegisterGlobals(ClassDeclaration annotatedClass, extension RegisterGlobalsContext context) {
		val activeAnnotation = annotatedClass.annotations.findFirst[annotationTypeDeclaration == context.findUpstreamType(OverlayTypeByExample)]
		val pa = new JsonParser()
		val root = pa.parse(activeAnnotation.getStringValue('value'))
		if (!(root instanceof JsonObject)) {
			return;
		}
		for (prop : root.asJsonObject.entrySet) {
			registerTypesRecursively(prop.key, prop.value, annotatedClass.qualifiedName, context)
		}
	}
	
	def void registerTypesRecursively(String propertyName, JsonElement object, String qualifiedContainerName, RegisterGlobalsContext context) {
		processObject(propertyName, object, qualifiedContainerName) [ String typeName, JsonObject jsObject|
			context.registerClass(typeName)
			for (prop : jsObject.entrySet) {
				registerTypesRecursively(prop.key, prop.value,typeName, context)
			}
			return null
		]
	}
	
	override doTransform(MutableClassDeclaration annotatedClass, extension TransformationContext context) {
		val extension Util util = new Util(context)
		
		val activeAnnotation = annotatedClass.annotations.findFirst[annotationTypeDeclaration == OverlayTypeByExample.newTypeReference.type]
		val pa = new JsonParser()
		val root = pa.parse(activeAnnotation.getStringValue('value'))
		if (!(root instanceof JsonObject)) {
			activeAnnotation.addError("The example json data must have a single root object.")
			return;
		}
		util.doTransform(annotatedClass, root.asJsonObject)
		annotatedClass.removeAnnotation(activeAnnotation)
	}
	
	
	val PATTERN = Pattern.compile("public final native (.+) get(\\w+)\\(\\);")
	
	/**
	 * we add the Java comment containing the javascript code during code generation, since there is no way to add it using the Java model.
	 */
	override doGenerateCode(ClassDeclaration annotatedClass, extension CodeGenerationContext context) {
		val targetFolder = annotatedClass.compilationUnit.filePath.targetFolder
		val targetFile = targetFolder.append(annotatedClass.qualifiedName.replace('.','/')+".java")
		val contents = targetFile.contents
		val matcher = PATTERN.matcher(contents)
		targetFile.contents = matcher.replaceAll("public final native $1 get$2() /*-{ return this.$2; }-*/;")
	}


	static class Util {
		extension TransformationContext ctx
		
		new(TransformationContext ctx) {
			this.ctx = ctx
		}
		
		def void doTransform(MutableClassDeclaration classDeclaration, JsonObject rootObject) {
			
			classDeclaration.extendedClass = JavaScriptObject.newTypeReference
			classDeclaration.addConstructor [
				visibility = Visibility.PROTECTED
				body = ''''''
			]
			
			for (property : rootObject.entrySet) {
				val getterMethodName = "get"+property.key.toFirstUpper
				if (classDeclaration.findDeclaredMethod(getterMethodName) == null) {
					classDeclaration.addMethod("get"+property.key.toFirstUpper) [
						visibility = Visibility.PUBLIC
						native = true
						final = true
						returnType = getJavaType(property, classDeclaration)
					]
				}
				
				processObject(property.key, property.value, classDeclaration.qualifiedName) [ String qn, JsonObject obj |
					val MutableClassDeclaration nestedType = classDeclaration.declaredClasses.findFirst[qualifiedName == qn]
					// call doTransform recursively
					doTransform(nestedType, obj)
					return nestedType
				]
			}
		}
		
		def TypeReference getJavaType(Entry<String,JsonElement> property, MutableClassDeclaration currentContainer) {
			val isArray = property.value.isJsonArray
			val element = if (isArray) property.value.asJsonArray.get(0) else property.value
			val type = switch element {
				JsonObject : {
					val simpleTypeName = (if (isArray) {
							property.key.toSingular
						} else {
							property.key	
						}).toFirstUpper
					val type = currentContainer.declaredClasses.findFirst[simpleName == simpleTypeName]
					type.newTypeReference
				}
				JsonPrimitive case element.isString: {
					String.newTypeReference
				}
				JsonPrimitive case element.isBoolean: {
					boolean.newTypeReference
				}
				JsonPrimitive case element.isNumber: {
					if (element.asString.indexOf('.') == -1) {
						int.newTypeReference
					} else {
						double.newTypeReference
					}
				}
				default : {
	 				currentContainer.addError("unknown element "+element)
					throw new IllegalStateException
				}
			}
			return if (isArray) {
					JsArray.newTypeReference(type)
				} else {
					type
				}
		}
	}
}

class StaticUtils {
	
	def static String toSingular(String plural) {
		if (plural.endsWith('s')) {
			return plural.substring(0, plural.length-1)
		} else {
			return plural
		}
	}
	
	def static <T> T processObject(String propertyName, JsonElement object, String qualifiedContainerName, (String,JsonObject)=>T onJSObjectFound) {
		switch object {
			JsonArray : {
				processObject(propertyName.toSingular, object.get(0), qualifiedContainerName, onJSObjectFound)
			}
			JsonObject : {
				val containerTypeName = qualifiedContainerName+"."+(propertyName.toFirstUpper)
				onJSObjectFound.apply(containerTypeName, object)
			}
		}
	}
}