package de.itemis.xtend.auto.gwt

import org.eclipse.xtend.core.compiler.batch.XtendCompilerTester
import org.junit.Test

class GwtServiceTest {
	
	extension XtendCompilerTester compiler = XtendCompilerTester.newXtendCompilerTester(GwtServiceTest)
	
	@Test def void testSimple() {
		'''
			package mypackage
			
			import de.itemis.xtend.auto.gwt.GwtService
			import java.util.List
			
			@GwtService class TodoServiceImpl {
			
				override List<Todo> load(String name) {
					return null
				}
			
				override void save(List<String> todos, String name) {
					// do nothing
				}
				
			}
		'''.assertCompilesTo('''
			MULTIPLE FILES WERE GENERATED
			
			File 1 : /myProject/xtend-gen/mypackage/TodoService.java
			
			package mypackage;
			
			import com.google.gwt.user.client.rpc.RemoteService;
			import com.google.gwt.user.client.rpc.RemoteServiceRelativePath;
			import java.util.List;
			
			@RemoteServiceRelativePath(value = "todoService")
			@SuppressWarnings("all")
			public interface TodoService extends RemoteService {
			  public abstract /* List<Todo> */Object load(final String name);
			  
			  public abstract void save(final List<String> todos, final String name);
			}
			
			File 2 : /myProject/xtend-gen/mypackage/TodoServiceAsync.java
			
			package mypackage;
			
			import com.google.gwt.user.client.rpc.AsyncCallback;
			import java.util.List;
			
			@SuppressWarnings("all")
			public interface TodoServiceAsync {
			  public abstract void load(final String name, final /* AsyncCallback<List<Todo>> */Object result);
			  
			  public abstract void save(final List<String> todos, final String name, final AsyncCallback<Void> result);
			}
			
			File 3 : /myProject/xtend-gen/mypackage/TodoServiceImpl.java
			
			package mypackage;
			
			import com.google.gwt.user.server.rpc.RemoteServiceServlet;
			import de.itemis.xtend.auto.gwt.GwtService;
			import java.util.List;
			import mypackage.TodoService;
			
			@GwtService
			@SuppressWarnings("all")
			public class TodoServiceImpl extends RemoteServiceServlet implements TodoService {
			  public /* List<Todo> */Object load(final String name) {
			    return null;
			  }
			  
			  public void save(final List<String> todos, final String name) {
			  }
			}
			
		''')
	}
}