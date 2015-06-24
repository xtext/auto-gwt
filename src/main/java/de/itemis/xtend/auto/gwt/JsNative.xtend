/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtend.auto.gwt

import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.macro.AbstractMethodProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.CodeGenerationContext
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.MethodDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableMethodDeclaration
import org.eclipse.xtend.lib.macro.declaration.TypeDeclaration
import org.eclipse.xtend.lib.macro.file.Path

/**
 * JSNI requires comments containing Java script code, which is not translated by the Xtend compiler.
 * Instead use JsNative:
 * Example usage
 * <pre>
 *   @JsNative def String getFoo(String bar) '''
 * 		//javascript code goes here
 *      return bar;
 *   '''
 * </pre>
 */
@Active(JsNativeProcessor)
annotation JsNative {
}

class JsNativeProcessor extends AbstractMethodProcessor {
	
	override doTransform(MutableMethodDeclaration annotatedMethod, extension TransformationContext context) {
		annotatedMethod.native = true
		annotatedMethod.final = true
		val sourceMethod = annotatedMethod.primarySourceElement as MethodDeclaration 
		if (sourceMethod.returnType == null) {
			annotatedMethod.addError("A JsNative method needs to explicitly specify a return type.")
			return;
		}
		// generate marker code
		annotatedMethod.body = '''
			«getUniqueMarkerCode(annotatedMethod.primarySourceElement as MethodDeclaration)»
		'''
	}
	
	private def String getUniqueMarkerCode(MethodDeclaration method) {
		return method.declaringType.simpleName+"#"+method.simpleName+"("+method.parameters.map[type].join(',')+")"
	}
		
	override doGenerateCode(List<? extends MethodDeclaration> annotatedMethods, extension CodeGenerationContext context) {
		// When the annotation is used multiple times within a single source xtend compilation 
		// unit, the methods can end up in several different java compilation units due to 
		// multiple toplevel types in one xtend file. Furthermore, there can be multiple
		// annotated methods per java compilation unit.
		// We load change all contents first and later save all compilation units only once.
		val javaUnits = new HashMap<Path, String>;
		for(annotatedMethod: annotatedMethods) {
			val path = annotatedMethod.declaringType.getTargetPath(context)
			if (javaUnits.get(path) == null) {
				javaUnits.put(path, path.contents.toString)	
			}
			var contents = javaUnits.get(path)
			
			val markerStart = contents.indexOf(getUniqueMarkerCode(annotatedMethod))
			if (markerStart > 0) {
				val startIndex = contents.substring(0, markerStart).lastIndexOf('{')
				val endIndex = contents.substring(markerStart).indexOf('}') + markerStart
				val jsCode = annotatedMethod.body.toString.trimTripleQuotes
				val newContents = contents.substring(0, startIndex)+"/*-{"+jsCode+"}-*/;"+contents.substring(endIndex+1)
				
				javaUnits.put(path, newContents)
			}
		}
		for (path: javaUnits.keySet) {
			path.contents = javaUnits.get(path)
		}
	}
	
	private def String trimTripleQuotes(String s) {
		s.substring(3, s.length-3)
	}
	
	private def TypeDeclaration topLevelType(TypeDeclaration type) {
		return if (type.declaringType == null) type else type.declaringType.topLevelType
	}
	
	private def Path getTargetPath(TypeDeclaration type, extension CodeGenerationContext ctx) {		
		val topLevelType = type.topLevelType
		val unit = type.compilationUnit
		val targetFolder = unit.filePath.targetFolder
		return targetFolder.append(unit.sourceTypeDeclarations.findFirst[sourceType|sourceType==topLevelType].qualifiedName.replace('.','/')+".java")
	}
}
