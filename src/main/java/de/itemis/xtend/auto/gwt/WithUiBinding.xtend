package de.itemis.xtend.auto.gwt

import com.google.gwt.uibinder.client.UiBinder
import com.google.gwt.uibinder.client.UiField
import com.google.gwt.user.client.ui.Widget
import java.io.ByteArrayOutputStream
import java.io.PrintStream
import java.lang.annotation.ElementType
import java.lang.annotation.Target
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.RegisterGlobalsContext
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.ClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.Visibility

@Target(ElementType.TYPE)
@Active(WithUiBindingProcessor)
annotation WithUiBinding {
}

class WithUiBindingProcessor extends AbstractClassProcessor {

	override doRegisterGlobals(ClassDeclaration it, extension RegisterGlobalsContext context) {
		registerInterface(uiBinderInterface(it))
	}

	override doTransform(MutableClassDeclaration it, extension TransformationContext context) {
		val uiBinderInterfaceType = findInterface(uiBinderInterface)
		uiBinderInterfaceType.extendedInterfaces = uiBinderInterfaceType.extendedInterfaces +
			#[UiBinder.newTypeReference(Widget.newTypeReference, it.newTypeReference)]

		addField('UI_BINDER') [
			static = true
			final = true
			type = uiBinderInterfaceType.newTypeReference
			initializer = [
				'''com.google.gwt.core.client.GWT.create(«uiBinderInterfaceType.simpleName».class)'''
			]
		]
		val parser = createUiBinderParser(context)
		if (parser == null) {
			return
		}
		val fields = parser.parse.fields
		for (entry : fields.entrySet) {
			addField(entry.key) [
				type = entry.value.newTypeReference
				visibility = Visibility::PROTECTED
				addAnnotation(UiField.newAnnotationReference)
			]
		}
	}

	protected def createUiBinderParser(MutableClassDeclaration it, extension TransformationContext context) {
		try {
			new UiBinderParser(uiXmlPath.contentsAsStream, context)
		} catch (Exception io) {
			addError('''Error loading file '«uiXmlPath»' : [«io.message»]''')
			val byteArrayOutputStream = new ByteArrayOutputStream
			io.printStackTrace(new PrintStream(byteArrayOutputStream))
			addError(byteArrayOutputStream.toString)
			null as UiBinderParser
		}
	}

	protected def uiBinderInterface(ClassDeclaration it) {
		qualifiedName + '.' + simpleName + 'UiBinder'
	}

	protected def uiXmlPath(MutableClassDeclaration it) {
		compilationUnit.filePath.parent.append('''«simpleName».ui.xml''')
	}

}
