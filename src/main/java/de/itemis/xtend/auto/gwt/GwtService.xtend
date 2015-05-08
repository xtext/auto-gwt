/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtend.auto.gwt

import com.google.gwt.user.client.rpc.AsyncCallback
import com.google.gwt.user.client.rpc.RemoteService
import com.google.gwt.user.client.rpc.RemoteServiceRelativePath
import com.google.gwt.user.server.rpc.RemoteServiceServlet
import java.lang.annotation.ElementType
import java.lang.annotation.Retention
import java.lang.annotation.Target
import org.eclipse.xtend.lib.macro.AbstractClassProcessor
import org.eclipse.xtend.lib.macro.Active
import org.eclipse.xtend.lib.macro.RegisterGlobalsContext
import org.eclipse.xtend.lib.macro.TransformationContext
import org.eclipse.xtend.lib.macro.declaration.ClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.MutableClassDeclaration
import org.eclipse.xtend.lib.macro.declaration.Visibility

/**
 * Derives the server side and client side interfaces needed for GWT RPC.
 * Implements the server side interface.
 */
@Target(ElementType.TYPE)
@Active(GwtServiceProcessor)
@Retention(SOURCE)
annotation GwtService {
	String remoteServiceRelativePath = ''
}

class GwtServiceProcessor extends AbstractClassProcessor {

	private static final String IMPL = "Impl"

	private static final String SERVER = ".server"

	private static final String SHARED = ".shared"

	override doRegisterGlobals(ClassDeclaration it, RegisterGlobalsContext context) {
		context.registerInterface(interfaceName)
		context.registerInterface(interfaceAsyncName)
	}

	override doTransform(MutableClassDeclaration it, extension TransformationContext context) {
		if (!simpleName.endsWith(IMPL)) {
			addError('''The name must end with '«IMPL»'.''')
		}

		if (!packageName.contains(SERVER)) {
			addError("A service must reside under the 'server' package.")
		}

		if (extendedClass != Object.newTypeReference) {
			addError("A service must not extend another class.")
		}
		
		val interfaceType = findInterface(interfaceName)
		interfaceType.primarySourceElement = primarySourceElement
		val interfaceAsyncType = findInterface(interfaceAsyncName)
		interfaceAsyncType.primarySourceElement = primarySourceElement

		interfaceType.extendedInterfaces = interfaceType.extendedInterfaces + #[RemoteService.newTypeReference]

		val name = getRemoteServiceRelativePath(it, context)
		interfaceType.addAnnotation(
			RemoteServiceRelativePath.newAnnotationReference [
				set('value', name)
			]
		)
		
		for (method : declaredMethods.filter[visibility == Visibility::PUBLIC]) {
			interfaceType.addMethod(method.simpleName) [
				returnType = method.returnType
				method.parameters.forEach(p|addParameter(p.simpleName, p.type))
				primarySourceElement = method.primarySourceElement
			]
			interfaceAsyncType.addMethod(method.simpleName) [
				method.parameters.forEach(p|addParameter(p.simpleName, p.type))
				addParameter(
					'result',
					AsyncCallback.newTypeReference(method.returnType.wrapperIfPrimitive)
				)
				primarySourceElement = method.primarySourceElement
			]
		}

		extendedClass = RemoteServiceServlet.newTypeReference
		implementedInterfaces = implementedInterfaces + #[interfaceType.newTypeReference]
	}
	
	def getRemoteServiceRelativePath(MutableClassDeclaration it, extension TransformationContext context) {
		val gwtServiceAnnotation = findAnnotation(GwtService.findTypeGlobally)
		val remoteServiceRelativePath = gwtServiceAnnotation.getValue('remoteServiceRelativePath') as String
		if (remoteServiceRelativePath.nullOrEmpty) {
		 	return interfaceSimpleName.toFirstLower
		}
		return remoteServiceRelativePath
	}

	def static interfaceAsyncName(ClassDeclaration it) {
		interfaceName + 'Async'
	}

	def static interfaceName(ClassDeclaration it) {
		packageName.replace(SERVER, SHARED) + "." + interfaceSimpleName
	}

	def static interfaceSimpleName(ClassDeclaration it) {
		simpleName.substring(0, simpleName.length - IMPL.length)
	}

	def static String packageName(ClassDeclaration it) {
		qualifiedName.substring(0, qualifiedName.length - simpleName.length - 1)
	}

}
