package de.itemis.xtend.auto.gwt

import org.eclipse.xtend.lib.macro.CodeGenerationContext
import org.eclipse.xtend.lib.macro.declaration.TypeDeclaration
import org.eclipse.xtend.lib.macro.file.Path

class ActiveAnnotationProcessorHelper {
	private static def TypeDeclaration topLevelType(TypeDeclaration type) {
		return if (type.declaringType == null) type else type.declaringType.topLevelType
	}
	
	static def Path getTargetPath(TypeDeclaration type, extension CodeGenerationContext ctx) {		
		val topLevelType = type.topLevelType
		val unit = type.compilationUnit
		val targetFolder = unit.filePath.targetFolder
		return targetFolder.append(unit.sourceTypeDeclarations.findFirst[sourceType|sourceType==topLevelType].qualifiedName.replace('.','/')+".java")
	}
}