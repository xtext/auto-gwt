package de.itemis.xtend.auto.gwt.client

import com.google.gwt.canvas.client.Canvas
import com.google.gwt.editor.ui.client.ValueBoxEditorDecorator
import com.google.gwt.media.client.Audio
import com.google.gwt.media.client.Video
import com.google.gwt.user.cellview.client.CellBrowser
import com.google.gwt.user.cellview.client.CellList
import com.google.gwt.user.cellview.client.CellTable
import com.google.gwt.user.cellview.client.CellTree
import com.google.gwt.user.cellview.client.CellWidget
import com.google.gwt.user.cellview.client.DataGrid
import com.google.gwt.user.cellview.client.PageSizePager
import com.google.gwt.user.cellview.client.SimplePager
import com.google.gwt.user.client.ui.AbsolutePanel
import com.google.gwt.user.client.ui.Anchor
import com.google.gwt.user.client.ui.Button
import com.google.gwt.user.client.ui.CaptionPanel
import com.google.gwt.user.client.ui.CheckBox
import com.google.gwt.user.client.ui.CustomScrollPanel
import com.google.gwt.user.client.ui.DateLabel
import com.google.gwt.user.client.ui.DeckLayoutPanel
import com.google.gwt.user.client.ui.DeckPanel
import com.google.gwt.user.client.ui.DecoratedPopupPanel
import com.google.gwt.user.client.ui.DecoratedStackPanel
import com.google.gwt.user.client.ui.DecoratedTabBar
import com.google.gwt.user.client.ui.DecoratedTabPanel
import com.google.gwt.user.client.ui.DecoratorPanel
import com.google.gwt.user.client.ui.DialogBox
import com.google.gwt.user.client.ui.DialogBox.CaptionImpl
import com.google.gwt.user.client.ui.DisclosurePanel
import com.google.gwt.user.client.ui.DockLayoutPanel
import com.google.gwt.user.client.ui.DockPanel
import com.google.gwt.user.client.ui.DoubleBox
import com.google.gwt.user.client.ui.FileUpload
import com.google.gwt.user.client.ui.FlexTable
import com.google.gwt.user.client.ui.FlowPanel
import com.google.gwt.user.client.ui.FocusPanel
import com.google.gwt.user.client.ui.FormPanel
import com.google.gwt.user.client.ui.Frame
import com.google.gwt.user.client.ui.Grid
import com.google.gwt.user.client.ui.HTML
import com.google.gwt.user.client.ui.HTMLPanel
import com.google.gwt.user.client.ui.HasWidgets
import com.google.gwt.user.client.ui.HeaderPanel
import com.google.gwt.user.client.ui.Hidden
import com.google.gwt.user.client.ui.HorizontalPanel
import com.google.gwt.user.client.ui.Hyperlink
import com.google.gwt.user.client.ui.Image
import com.google.gwt.user.client.ui.InlineHTML
import com.google.gwt.user.client.ui.InlineHyperlink
import com.google.gwt.user.client.ui.InlineLabel
import com.google.gwt.user.client.ui.IntegerBox
import com.google.gwt.user.client.ui.Label
import com.google.gwt.user.client.ui.LabelBase
import com.google.gwt.user.client.ui.LayoutPanel
import com.google.gwt.user.client.ui.ListBox
import com.google.gwt.user.client.ui.LongBox
import com.google.gwt.user.client.ui.MenuBar
import com.google.gwt.user.client.ui.NamedFrame
import com.google.gwt.user.client.ui.NativeHorizontalScrollbar
import com.google.gwt.user.client.ui.NativeVerticalScrollbar
import com.google.gwt.user.client.ui.NotificationMole
import com.google.gwt.user.client.ui.NumberLabel
import com.google.gwt.user.client.ui.PasswordTextBox
import com.google.gwt.user.client.ui.PopupPanel
import com.google.gwt.user.client.ui.PushButton
import com.google.gwt.user.client.ui.RenderablePanel
import com.google.gwt.user.client.ui.ResizeLayoutPanel
import com.google.gwt.user.client.ui.RichTextArea
import com.google.gwt.user.client.ui.RootLayoutPanel
import com.google.gwt.user.client.ui.ScrollPanel
import com.google.gwt.user.client.ui.SimpleCheckBox
import com.google.gwt.user.client.ui.SimpleLayoutPanel
import com.google.gwt.user.client.ui.SimplePanel
import com.google.gwt.user.client.ui.SimpleRadioButton
import com.google.gwt.user.client.ui.SplitLayoutPanel
import com.google.gwt.user.client.ui.StackLayoutPanel
import com.google.gwt.user.client.ui.StackPanel
import com.google.gwt.user.client.ui.SuggestBox
import com.google.gwt.user.client.ui.TabBar
import com.google.gwt.user.client.ui.TabLayoutPanel
import com.google.gwt.user.client.ui.TabPanel
import com.google.gwt.user.client.ui.TextArea
import com.google.gwt.user.client.ui.TextBox
import com.google.gwt.user.client.ui.TextBoxBase
import com.google.gwt.user.client.ui.ToggleButton
import com.google.gwt.user.client.ui.Tree
import com.google.gwt.user.client.ui.ValueBox
import com.google.gwt.user.client.ui.ValueBoxBase
import com.google.gwt.user.client.ui.ValueLabel
import com.google.gwt.user.client.ui.ValueListBox
import com.google.gwt.user.client.ui.ValuePicker
import com.google.gwt.user.client.ui.VerticalPanel
import com.google.gwt.user.client.ui.Widget
import com.google.gwt.user.datepicker.client.DateBox
import com.google.gwt.user.datepicker.client.DatePicker
import com.google.gwt.user.datepicker.client.DefaultCalendarView
import com.google.gwt.user.datepicker.client.DefaultMonthSelector
import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.PrintStream
import java.lang.reflect.Constructor
import java.lang.reflect.ParameterizedType
import java.lang.reflect.Type
import java.lang.reflect.TypeVariable
import java.lang.reflect.WildcardType
import java.util.List

import static extension java.lang.reflect.Modifier.*

class UiBuilderGenerator {

	def static void main(String[] args) {
		val generator = new UiBuilderGenerator()
		val content = generator.generate
		val printStream = new PrintStream(new BufferedOutputStream(new FileOutputStream(new File(uiBuilderPath))))
		printStream.print(content)
		printStream.close
	}
	
	protected static def getUiBuilderPath() {
		'src/main/java/de/itemis/xtend/auto/gwt/client/UiBuilder.xtend'
	}

	protected def generate() '''
		package de.itemis.xtend.auto.gwt.client
		
		import «HasWidgets.name»
		«FOR widgetType : widgetTypes.filterNotInitializable»
		import «widgetType.name»
		«ENDFOR»
		
		class UiBuilder {
			«FOR widgetType : widgetTypes.filterNotInitializable»
			«IF widgetType.hasCreateIfSupported»

			def static «widgetType.methodName»(«HasWidgets.simpleName» parent, («widgetType.parametrizedName»)=>void initializer) {
				val result = «widgetType.simpleName».createIfSupported
				if (result == null)
					return null
				parent.add(result)
				initializer.apply(result)
				return result
			}
			«ELSE»
			«FOR constructor : widgetType.validConstructors»

			def static «constructor.methodName»(«HasWidgets.simpleName» parent, «constructor.methodArguments»(«widgetType.parametrizedName»)=>void initializer) {
				val result = new «constructor.parametrizedName»«constructor.constructorCall»
				parent.add(result)
				initializer.apply(result)
				return result
			}
			«ENDFOR»
			«ENDIF»
			«ENDFOR»
		
		}
	'''
	
	protected def getMethodName(Class<? extends Widget> widgetType) {
		val classTypeParameters = widgetType.typeParameters
		val methodName = if (widgetType.simpleName.startsWith('HTML')) 'html' + widgetType.simpleName.substring(4).toFirstUpper else widgetType.simpleName.toFirstLower
		'''«FOR typeParameter:classTypeParameters.map[typeArgument] BEFORE '<' SEPARATOR ', ' AFTER '> '»«typeParameter.key»«IF typeParameter.value != Object» extends «typeParameter.value.name»«ENDIF»«ENDFOR»«methodName»'''
	}
	
	protected def getMethodName(Constructor<?> constructor) {
		val widgetType = constructor.declaringClass as Class<Object>
		val methodName = if (widgetType.simpleName.startsWith('HTML')) 'html' + widgetType.simpleName.substring(4).toFirstUpper else widgetType.simpleName.toFirstLower
		
		val classTypeParameters = widgetType.typeParameters
		if (!classTypeParameters.empty) {
			'''«FOR typeParameter:classTypeParameters.map[typeArgument] BEFORE '<' SEPARATOR ', ' AFTER '> '»«typeParameter.key»«IF typeParameter.value != Object» extends «typeParameter.value.name»«ENDIF»«ENDFOR»«methodName»'''
		} else {
			val constructorTypeParameters = (constructor as Constructor<Object>).typeParameters
			'''«FOR typeParameter:constructorTypeParameters.map[typeArgument] BEFORE '<' SEPARATOR ', ' AFTER '> '»«typeParameter.key»«IF typeParameter.value != Object» extends «typeParameter.value.name»«ENDIF»«ENDFOR»«methodName»'''
		}
	}
	
	protected def getMethodArguments(Constructor<?> it) {
		'''«FOR parameterType : genericParameterTypes.indexed SEPARATOR ', ' AFTER ', '»«parameterType.value.methodArgument» arg«parameterType.key»«ENDFOR»'''
	}
	
	protected def String getMethodArgument(Type type) {
		switch type {
			Class<?>: type.name
			ParameterizedType:
				'''«type.rawType.methodArgument»<«FOR typeArgument:type.actualTypeArguments»«typeArgument.methodArgument»«ENDFOR»>'''
			WildcardType:
				type.upperBounds.head.methodArgument
			TypeVariable<?>: type.name
			default:
				throw new IllegalStateException('Unexpected type: ' + type + ' (' + type.class + ')')
		}
	}
	
	protected def getConstructorCall(Constructor<?> it) {
		if (parameterTypes.empty) {
			return ''
		}
		'''(«FOR parameterType : parameterTypes.indexed SEPARATOR ', '»arg«parameterType.key»«ENDFOR»)'''
	}  
	
	protected def getParametrizedName(Constructor<?> constructor) {
		val classTypeParameters = (constructor.declaringClass as Class<Object>).typeParameters
		if (!classTypeParameters.empty) {
			'''«constructor.declaringClass.simpleName»«FOR typeParameter:classTypeParameters BEFORE '<' SEPARATOR ', ' AFTER '>'»«typeParameter.name»«ENDFOR»'''
		} else {
			val constructorTypeParameters = (constructor as Constructor<Object>).typeParameters
			'''«constructor.declaringClass.simpleName»«FOR typeParameter:constructorTypeParameters BEFORE '<' SEPARATOR ', ' AFTER '>'»«typeParameter.name»«ENDFOR»'''
		}
	}
	
	protected def getParametrizedName(Class<? extends Widget> it) {
		'''«simpleName»«FOR typeParameter:typeParameters.map[typeArgument] BEFORE '<' SEPARATOR ', ' AFTER '>'»«typeParameter.key»«ENDFOR»'''
	}
	
	protected def getTypeArgument(TypeVariable<?> typeVariable) {
		val upperBound = typeVariable.bounds.head
		if (upperBound instanceof Class<?>) {
			typeVariable.name -> upperBound	
		}
	}
	
	protected def filterNotInitializable(List<? extends Class<? extends Widget>> widgetTypes) {
		widgetTypes.filter[
			hasCreateIfSupported || !validConstructors.empty
		]
	}
	
	protected def getValidConstructors(Class<? extends Widget> it) {
		declaredConstructors.filter[modifiers.public && !annotations.exists[annotationType == Deprecated]]
	}
	
	protected def hasCreateIfSupported(Class<? extends Widget> it) {
		declaredMethods.exists[name == 'createIfSupported']
	}
	
	protected def getWidgetTypes() {
		#[
			Anchor,
			Button,
			CheckBox,
			PushButton,
			ToggleButton,
			Canvas,
			FileUpload,
			ListBox,
			Audio,
			Video,
			RichTextArea,
			SimpleCheckBox,
			SimpleRadioButton,
			ValueBoxBase,
			TextBoxBase,
			TextArea,
			TextBox,
			PasswordTextBox,
			ValueBox,
			DoubleBox,
			IntegerBox,
			LongBox,
			AbsolutePanel,
			DockPanel,
			HorizontalPanel,
			VerticalPanel,
			DeckLayoutPanel,
			DeckPanel,
			DockLayoutPanel,
			SplitLayoutPanel,
			FlowPanel,
			HTMLPanel,
			LayoutPanel,
			RootLayoutPanel,
			RenderablePanel,
			StackPanel,
			DecoratedStackPanel,
			HeaderPanel,
			FlexTable,
			Grid,
			SimplePanel,
			DecoratorPanel,
			FocusPanel,
			FormPanel,
			PopupPanel,
			DecoratedPopupPanel,
			DialogBox,
			ResizeLayoutPanel,
			ScrollPanel,
			CustomScrollPanel,
			SimpleLayoutPanel,
			Tree,
			MenuBar,
			LabelBase,
			Label,
			HTML,
			CaptionImpl,
			InlineHTML,
			InlineLabel,
			ValueLabel,
			DateLabel,
			NumberLabel,
			Image,
			Hyperlink,
			InlineHyperlink,
			Hidden,
			Frame,
			NamedFrame,
			CellBrowser,
			CellTree,
			CellTable,
			DataGrid,
			CellList,
			PageSizePager,
			SimplePager,
			CaptionPanel,
			DateBox,
			DatePicker,
			DefaultCalendarView,
			DefaultMonthSelector,
			DisclosurePanel,
			NotificationMole,
			StackLayoutPanel,
			TabLayoutPanel,
			SuggestBox,
			TabBar,
			DecoratedTabBar,
			TabPanel,
			DecoratedTabPanel,
			ValueBoxEditorDecorator,
			ValueListBox,
			ValuePicker,
			CellWidget,
			NativeHorizontalScrollbar,
			NativeVerticalScrollbar
		]
	}

}