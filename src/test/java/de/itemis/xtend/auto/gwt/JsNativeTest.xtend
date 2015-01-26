package de.itemis.xtend.auto.gwt

import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

class JsNativeTest {
	
	extension XtendCompilerTester compiler = XtendCompilerTester.newXtendCompilerTester(JsNativeTest)
	
	@Test def void testSimple() {
//		'''
//		package foo
//		
//		import «JsNative.name»
//		
//		class MyJsNativeCode {
//			@JsNative def String doStuff(String param1) ''«»'
//				// some javascript code here
//			''«»'
//		}
//		
//		'''.assertCompilesTo('''
//		
//		''')		
	}	
}
