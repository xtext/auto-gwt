Auto-GWT
========

Auto-GWT is a library for GWT that eleminates all superfluous boilerplate from typical GWT idioms and boosts the tool integration to a new level. It's a library for Xtend (http://www.xtendlang.org), which is a dense, thin but powerful language over Java. It translates to readable Java source code.

What Auto-GWT does specifically
===============================

Here are some example of what GWT does for you.

Basic things first
==================

Xtend in general removes the boilerplate from your Java code base just by using it. Here's just one example of how your typical GWT code could be improved by using Xtend.

Adding a ClickHandler that removes any completed todos.

Java:
```Java
clearCompletedButton.addClickHandler(new ClickHandler() {
  @Override
  public void onClick(ClickEvent event) {
    List<Todo> result = new ArrayList<Todo>();
    for (Todo t : getTodos()) {
      if (!t.isDone()) {
        result.add(t);
      }
    }
    setTodos(result);
  }
});
```

The same in Xtend:
```Xtend
clearCompletedButton.addClickHandler [
  todos = todos.filter[!done].toList
]
```

Not only much shorter but also much more readable. You glimpse at the code and it is clear what it does.
And this was only pure Xtend without Auto-GWT. Let's see what Auto-GWT can do.

Automated UIBinder
==================

UiBinder in GWT are a way to bind elements from an XML (html) file to Java code. You give certain elements in the XML a name using the _ui::field_ attribute and then need to redeclare the with the same name and the correct type in your Java class in order to access the programmatically, e.g. to add handlers.

The Auto-GWT _@WithUiBinding_ active annotation does that plumbing for you. You simply annotate your class with the annotation and it will during compilation look up the XML, declare the respective fields automatically and does the rest of the boilerplate for you. 

Here's the XML from the [example TodoApp](https://github.com/DJCordhose/todomvc-xtend-gwt).

```XML
<!DOCTYPE ui:UiBinder SYSTEM "http://dl.google.com/gwt/DTD/xhtml.ent">
<ui:UiBinder xmlns:ui="urn:ui:com.google.gwt.uibinder"
	xmlns:g="urn:import:com.google.gwt.user.client.ui" xmlns:cv="urn:import:com.google.gwt.user.cellview.client">
	<g:HTMLPanel>
		<section id="todoapp">
			<header id="header">
				<h1>todos</h1>
				<g:TextBox ui:field="todoText"/>
			</header>

			<section ui:field="mainSection">
				<input ui:field="toggleAll" type="checkbox"></input>
				<label for="toggle-all">Mark all as complete</label>
				<ul id="todo-list">
				    <g:FlowPanel ui:field="todoPanel"></g:FlowPanel>
				</ul>
			</section>

			<footer ui:field="todoStatsContainer">
				<span id="todo-count">
					<strong class="number" ui:field="remainingTodosCount"></strong>
					<span class="word" ui:field="remainingTodosLabel"></span>
					left.
				</span>
				<g:Button ui:field="clearCompleted">
					Clear completed (<span class="number-done" ui:field="clearTodosCount"></span>)
				</g:Button>
			</footer>
		</section>
	</g:HTMLPanel>
</ui:UiBinder>
```

And here's an excerpt from the class that adds the handlers

```Xtend
@WithUiBinding class TodoView {
   ...
  def void clearTodoText() {
    // accesses the automatically added todoText field.
		todoText.text = ''
	}
   ...
}
```

Programmatic UIs
================

An alternative to UI definition via XML is to program them in Java. Here's an example of how that usually looks like:

Java:
```Java
FlowPanel view = new FlowPanel();
view.setStyleName("view");
...
Label label = new Label();
label.setText(todo.getText());
view.add(label);
Button button = new Button();
button.setStyleName("destroy");
view.add(button);
button.addClickHandler(new ClickHandler() {
    @Override
    public void onClick(ClickEvent event) {
         deleteTodo(todo);	
    }
});
```

Not very readable, as the imperative code doesn't reflect the UI structure a tiny bit. 
With Auto-GWT you can do much better:

Xtend:
```Xtend
flowPanel [
  styleName = 'view'
  ...
  label [
    text = todo.text
  ]
  button [
    styleName = 'destroy'
    onClick [
      deleteTodo(todo)
    ]
  ]
]
```

This is really the same thing but written in Xtend and using Auto-GWT's _UiBuilder_ API. And note that this is fully statically-typed and the IDE gives you all the things you have in Java.

Automated GWT RPC
=================

GWT comes with easy to use support for calling server side services from the browser (see [GWT documentation](http://www.gwtproject.org/doc/latest/tutorial/RPC.html)). You basically need to declare a service interface for the server side, the corresponding implementation and an asynchronous client side variant of the interface. Auto-GWT can imporve on this with the _@GWTService_ active annotation. You only need to define the implementation, like so:

```Xtend
@GwtService class TodoServiceImpl {

	override List<Todo> load(String name) {
		memcacheService.get(name) as List<Todo>
	}

	override void save(List<Todo> todos, String name) {
		memcacheService.put(name, todos)
	}

}
```

and Auto-GWT will derive the whole pattern needed by GWT from that. Again the big benefit is not only less code to type, read and maintain, but that the IDE and the compiler are fully aware of the expansion. Just try doing a CallHierarchy in Eclipse on a client side call of an async service method. It will go seemlessly to the server side code.

OverlayTypes - Working with JSON
================================

Imagine you want to call some arbitrary REST service that responses with JSON data. Usually there is a decsription on that website, sporting an example of the JSON data. But how do you access it from within client side GWT? OverlayTypes are a good solution as they are just thin facades over the real javascript objects. But writing them by hand and for a given example JSON tree is tedious and error prone. With Auto-GWT you can use _@OverlayTypeByExample_ and just past the JSON data as an annotation value. The compiler will create proper GWT OverlayTypes from that. It will even create nested types for nested data structures.

Here's an example:

```Xtend
@OverlayTypeByExample('
  {
    "name" : "GWT",
    "license" : "Apache License 2.0",
    "committers" : [
      {
        "firstName" : "Ray",
        "name" : "Cromwell",
        "company" : "Google"
      }
      //one example per array is enough ;-)
    ]
  }
')
class OpenSourceProject {}
```

The _@OverlayTypeByExample_ will create teh following Java code from that:

Generated Java:
```Java
public class OpenSourceProject extends JavaScriptObject {
  public static class Committer extends JavaScriptObject {
    protected Committer() {}
    public final native String getFirstName() /*-{ return this.FirstName; }-*/;
    public final native String getName() /*-{ return this.Name; }-*/;
    public final native String getCompany() /*-{ return this.Company; }-*/;
  }
  
  protected OpenSourceProject() {}
  public final native String getName() /*-{ return this.Name; }-*/;
  public final native String getLicense() /*-{ return this.License; }-*/;
  public final native JsArray<OpenSourceProject.Committer> getCommitters() /*-{ return this.Committers; }-*/;
}
```



