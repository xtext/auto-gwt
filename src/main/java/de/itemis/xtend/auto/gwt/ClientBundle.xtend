/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtend.auto.gwt

import com.google.gwt.core.client.GWT
import com.google.gwt.dev.util.log.PrintWriterTreeLogger
import com.google.gwt.resources.client.ClientBundle.Source
import com.google.gwt.resources.client.CssResource.ClassName
import com.google.gwt.resources.client.ImageResource
import com.google.gwt.resources.css.DefsCollector
import com.google.gwt.resources.css.ExtractClassNamesVisitor
import com.google.gwt.resources.css.GenerateCssAst
import com.google.gwt.resources.ext.DefaultExtensions
import java.lang.annotation.ElementType
import java.lang.annotation.Target
import java.util.List
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.RegisterGlobalsContext
import org.eclipse.xtend.lib.macro.RegisterGlobalsParticipant
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.TransformationParticipant
import org.eclipse.xtend.lib.macro.declaration.AnnotationReference
import org.eclipse.xtend.lib.macro.declaration.InterfaceDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableAnnotationTarget
import org.eclipse.xtend.lib.macro.declaration.MutableInterfaceDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableMethodDeclaration
import org.eclipse.xtend.lib.macro.declaration.TypeDeclaration

@Target(ElementType.TYPE)
annotation CssResource {
	String value
	String[] csses
}

@Target(ElementType.TYPE)
annotation ImageResources {
	String value
}

@Target(ElementType.TYPE)
@Active(CliendBundleProcessor)
annotation ClientBundle {
}

class CliendBundleProcessor implements RegisterGlobalsParticipant<InterfaceDeclaration>, TransformationParticipant<MutableInterfaceDeclaration> {

	private static final String INSTANCE = 'INSTANCE'

	override doRegisterGlobals(List<? extends InterfaceDeclaration> annotatedSourceElements,
		RegisterGlobalsContext context) {
		for (InterfaceDeclaration it : annotatedSourceElements) {
			doRegisterGlobals(context)
		}
	}

	protected def doRegisterGlobals(InterfaceDeclaration it, extension RegisterGlobalsContext context) {
		registerClass(utilTypeName)
		for (cssResource : cssResources) {
			registerInterface(getCssResourceTypeName(cssResource))
		}
	}

	protected def String getCssResourceTypeName(InterfaceDeclaration it, AnnotationReference cssResource) '''«packageName».«cssResource.
		value.toFirstUpper»CssResource'''

	protected def getPackageName(InterfaceDeclaration it) {
		qualifiedName.substring(0, qualifiedName.length - simpleName.length - 1)
	}

	protected def String getUtilTypeName(InterfaceDeclaration it) '''«qualifiedName».Util'''

	override doTransform(List<? extends MutableInterfaceDeclaration> annotatedTargetElements,
		extension TransformationContext context) {
		annotatedTargetElements.forEach[doTransform(context)]
	}

	protected def doTransform(MutableInterfaceDeclaration it, extension TransformationContext context) {
		extendedInterfaces = extendedInterfaces + #[com.google.gwt.resources.client.ClientBundle.newTypeReference]
		val utilType = findClass(utilTypeName)
		val clientBundleType = newTypeReference
		utilType.addField(INSTANCE) [
			static = true
			type = clientBundleType
		]

		val clientBundle = findAnnotation(ClientBundle.newTypeReference.type)

		val cssResources = cssResources
		for (cssResource : cssResources) {
			val cssResourceType = findInterface(getCssResourceTypeName(cssResource))
			cssResourceType.doTransform(clientBundle, cssResource, context)
			addMethod(cssResource.value) [
				returnType = cssResourceType.newTypeReference
				addSourceAnnotation(context, cssResource.csses)
			]
			removeAnnotation(cssResource)
		}

		val imageResourcesAnnotation = findAnnotation(ImageResources.newTypeReference.type)
		if (imageResourcesAnnotation != null) {
			addResources(imageResourcesAnnotation, ImageResource.findTypeGlobally as TypeDeclaration, context)
			removeAnnotation(imageResourcesAnnotation)
		}

		utilType.addMethod('get') [
			static = true
			body = [
				'''
				if («INSTANCE» == null) {
					«INSTANCE» = «GWT.name».create(«clientBundleType.simpleName».class);
					«FOR cssResource : cssResources»
						«INSTANCE».«cssResource.value»().ensureInjected();
					«ENDFOR»
				}
				return «INSTANCE»;'''
			]
			returnType = clientBundleType
		]

		removeAnnotation(clientBundle)
	}

	protected def void addResources(MutableInterfaceDeclaration it, AnnotationReference resourcesAnnotation,
		TypeDeclaration resourceType, extension TransformationContext context) {
		val resourcesPath = resourcesAnnotation.value
		val sourceFolder = compilationUnit.filePath.sourceFolder
		val fileExtensions = resourceType.getDefaultFileExtensions(context)
		val resources = sourceFolder.append(resourcesPath).children.filter [
			fileExtensions.exists[fileExtension|lastSegment.endsWith(fileExtension)]
		]
		for (resource : resources) {
			addMethod(resource.lastSegment.methodName) [
				returnType = resourceType.newTypeReference
				addSourceAnnotation(context, sourceFolder.relativize(resource).toString)
			]
		}
	}

	protected def getDefaultFileExtensions(TypeDeclaration resourceType, extension TransformationContext context) {
		resourceType.findAnnotation(DefaultExtensions.newTypeReference.type).getStringArrayValue('value')
	}

	protected def void addSourceAnnotation(MutableAnnotationTarget it, extension TransformationContext context,
		String ... locations) {
		addAnnotation(
			Source.newAnnotationReference [
				setStringValue("value", locations)
			]
		)
	}

	protected def doTransform(MutableInterfaceDeclaration it, AnnotationReference clientBundle,
		AnnotationReference cssResouce, extension TransformationContext context) {
		extendedInterfaces = extendedInterfaces + #[com.google.gwt.resources.client.CssResource.newTypeReference]
		val sourceFolder = compilationUnit.filePath.sourceFolder
		val cssStylesheet = GenerateCssAst.exec(
			new PrintWriterTreeLogger,
			cssResouce.csses.map [ css |
				sourceFolder.append(css)
			].filter [
				if (!exists) {
					cssResouce.addError("File does not exist: " + it)
					return false
				}
				true
			].map [
				toURI.toURL
			]
		)

		val defsCollector = new DefsCollector
		defsCollector.accept(cssStylesheet)
		for (def : defsCollector.defs) {
			addMethod(def) [
				returnType = String.newTypeReference
			]
		}

		for (className : ExtractClassNamesVisitor.exec(cssStylesheet)) {
			val methodName = className.methodName
			addMethod(methodName, className, context)
		}
	}

	protected def MutableMethodDeclaration addMethod(MutableInterfaceDeclaration it, String methodName, String className,
		extension TransformationContext context) {
		if (findDeclaredMethod(methodName) == null) {
			return addMethod(methodName) [
				returnType = String.newTypeReference
				addAnnotation(
					ClassName.newAnnotationReference [
						setStringValue('value', className)
					]
				)
			]
		}
		addMethod('''«methodName»Class''', className, context)
	}

	protected def getMethodName(String className) {
		val sb = new StringBuilder()
		var c = className.charAt(0)
		if (Character.isJavaIdentifierStart(c)) {
			sb.append(Character.toLowerCase(c))
		}

		var i = 0
		val j = className.length
		var nextUpCase = false
		while (i + 1 < j) {
			i = i + 1
			c = className.charAt(i)
			if (!Character.isJavaIdentifierPart(c)) {
				nextUpCase = true
			} else {
				if (nextUpCase) {
					nextUpCase = false
					c = Character.toUpperCase(c)
				}
				sb.append(c)
			}
		}
		return sb.toString();
	}

	protected def List<String> getCsses(AnnotationReference it) {
		switch value : getValue('csses') {
			String: #[value]
			String[]: value
		}
	}

	protected def getValue(AnnotationReference it) {
		getStringValue('value')
	}

	protected def getCssResources(InterfaceDeclaration it) {
		annotations.filter[annotationTypeDeclaration.qualifiedName == CssResource.name]
	}

	protected def getCssResources(MutableInterfaceDeclaration it) {
		annotations.filter[annotationTypeDeclaration.qualifiedName == CssResource.name]
	}

}
