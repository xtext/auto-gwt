/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
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


/**
 * Automatically generates local fields declared in XML view files.
 * The class name has to match the XML file name.
 */
@Target(ElementType.TYPE)
@Active(WithUiBindingProcessor)
annotation WithUiBinding {
}

class WithUiBindingProcessor extends AbstractClassProcessor {

	override doRegisterGlobals(ClassDeclaration it, extension RegisterGlobalsContext context) {
		registerInterface(uiBinderInterface)
	}

	override doTransform(MutableClassDeclaration it, extension TransformationContext context) {
		val uiBinderInterfaceType = findInterface(uiBinderInterface)
		uiBinderInterfaceType.extendedInterfaces = uiBinderInterfaceType.extendedInterfaces +
			#[UiBinder.newTypeReference(Widget.newTypeReference, it.newTypeReference)]

		addField('UI_BINDER') [
			static = true
			final = true
			type = uiBinderInterfaceType.newTypeReference
			initializer = '''com.google.gwt.core.client.GWT.create(«uiBinderInterfaceType.simpleName».class)'''
		]
		val parser = createUiBinderParser(context)
		if (parser == null) {
			return
		}
		val fields = parser.parse.fields
		for (entry : fields.entrySet) {
			addField(entry.key) [
				type = entry.value.newTypeReference
				visibility = Visibility.PROTECTED
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
			null
		}
	}

	protected def uiBinderInterface(ClassDeclaration it) {
		qualifiedName + '.' + simpleName + 'UiBinder'
	}

	protected def uiXmlPath(MutableClassDeclaration it) {
		compilationUnit.filePath.parent.append('''«simpleName».ui.xml''')
	}

}
