package de.itemis.xtend.auto.gwt

import com.google.gwt.core.client.GWT
import com.google.gwt.dev.util.log.PrintWriterTreeLogger
import com.google.gwt.resources.client.ClientBundle.Source
import com.google.gwt.resources.client.CssResource.ClassName
import com.google.gwt.resources.client.ImageResource
import com.google.gwt.resources.css.DefsCollector
import com.google.gwt.resources.css.ExtractClassNamesVisitor
import com.google.gwt.resources.css.GenerateCssAst
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
import org.eclipse.xtend.lib.macro.declaration.MutableInterfaceDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableMethodDeclaration
import org.eclipse.xtend.lib.macro.file.Path

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

	private static final String[] EXTENSIONS = #["jpeg", "png", "bmp", "wbmp", "gif"]

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
		val sourceFolder = compilationUnit.filePath.sourceFolder

		val cssResources = cssResources
		for (cssResource : cssResources) {
			val cssResourceType = findInterface(getCssResourceTypeName(cssResource))
			cssResourceType.doTransform(clientBundle, cssResource, context)

			addMethod(cssResource.value) [
				returnType = cssResourceType.newTypeReference
				addAnnotation(
					Source.newAnnotationReference [
						setStringValue("value", cssResource.csses)
					]
				)
			]
		}

		val imageResource = findAnnotation(ImageResources.newTypeReference.type)
		if (imageResource != null) {
			val imageResourceValue = imageResource.value
			for (imagePath : sourceFolder.append(imageResourceValue).children.filter[image]) {
				addMethod(imagePath.lastSegment.methodName) [
					returnType = ImageResource.newTypeReference
					addAnnotation(
						Source.newAnnotationReference [
							setStringValue("value", sourceFolder.relativize(imagePath).toString)
						]
					)
				]
			}
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
		if (imageResource != null) {
			removeAnnotation(imageResource)
		}
		for (cssResource : cssResources) {
			removeAnnotation(cssResource)
		}
	}

	protected def isImage(Path path) {
		EXTENSIONS.exists[format|path.fileExtension == format]
	}

	protected def doTransform(MutableInterfaceDeclaration it, AnnotationReference clientBundle, AnnotationReference cssResouce,
		extension TransformationContext context) {
		extendedInterfaces = extendedInterfaces + #[com.google.gwt.resources.client.CssResource.newTypeReference]
		val sourceFolder = compilationUnit.filePath.sourceFolder
		val cssStylesheet = GenerateCssAst.exec(
			new PrintWriterTreeLogger,
			cssResouce.csses.map [
				sourceFolder.append(it)
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
