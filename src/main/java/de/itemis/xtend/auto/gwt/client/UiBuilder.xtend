/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtend.auto.gwt.client

import com.google.gwt.user.client.ui.HasWidgets
import com.google.gwt.user.client.ui.Anchor
import com.google.gwt.user.client.ui.Button
import com.google.gwt.user.client.ui.CheckBox
import com.google.gwt.user.client.ui.PushButton
import com.google.gwt.user.client.ui.ToggleButton
import com.google.gwt.canvas.client.Canvas
import com.google.gwt.user.client.ui.FileUpload
import com.google.gwt.user.client.ui.ListBox
import com.google.gwt.media.client.Audio
import com.google.gwt.media.client.Video
import com.google.gwt.user.client.ui.RichTextArea
import com.google.gwt.user.client.ui.SimpleCheckBox
import com.google.gwt.user.client.ui.SimpleRadioButton
import com.google.gwt.user.client.ui.TextArea
import com.google.gwt.user.client.ui.TextBox
import com.google.gwt.user.client.ui.PasswordTextBox
import com.google.gwt.user.client.ui.DoubleBox
import com.google.gwt.user.client.ui.IntegerBox
import com.google.gwt.user.client.ui.LongBox
import com.google.gwt.user.client.ui.AbsolutePanel
import com.google.gwt.user.client.ui.DockPanel
import com.google.gwt.user.client.ui.HorizontalPanel
import com.google.gwt.user.client.ui.VerticalPanel
import com.google.gwt.user.client.ui.DeckLayoutPanel
import com.google.gwt.user.client.ui.DeckPanel
import com.google.gwt.user.client.ui.DockLayoutPanel
import com.google.gwt.user.client.ui.SplitLayoutPanel
import com.google.gwt.user.client.ui.FlowPanel
import com.google.gwt.user.client.ui.HTMLPanel
import com.google.gwt.user.client.ui.LayoutPanel
import com.google.gwt.user.client.ui.RenderablePanel
import com.google.gwt.user.client.ui.StackPanel
import com.google.gwt.user.client.ui.DecoratedStackPanel
import com.google.gwt.user.client.ui.HeaderPanel
import com.google.gwt.user.client.ui.FlexTable
import com.google.gwt.user.client.ui.Grid
import com.google.gwt.user.client.ui.SimplePanel
import com.google.gwt.user.client.ui.DecoratorPanel
import com.google.gwt.user.client.ui.FocusPanel
import com.google.gwt.user.client.ui.FormPanel
import com.google.gwt.user.client.ui.PopupPanel
import com.google.gwt.user.client.ui.DecoratedPopupPanel
import com.google.gwt.user.client.ui.DialogBox
import com.google.gwt.user.client.ui.ResizeLayoutPanel
import com.google.gwt.user.client.ui.ScrollPanel
import com.google.gwt.user.client.ui.CustomScrollPanel
import com.google.gwt.user.client.ui.SimpleLayoutPanel
import com.google.gwt.user.client.ui.Tree
import com.google.gwt.user.client.ui.MenuBar
import com.google.gwt.user.client.ui.Label
import com.google.gwt.user.client.ui.HTML
import com.google.gwt.user.client.ui.DialogBox$CaptionImpl
import com.google.gwt.user.client.ui.InlineHTML
import com.google.gwt.user.client.ui.InlineLabel
import com.google.gwt.user.client.ui.ValueLabel
import com.google.gwt.user.client.ui.DateLabel
import com.google.gwt.user.client.ui.NumberLabel
import com.google.gwt.user.client.ui.Image
import com.google.gwt.user.client.ui.Hyperlink
import com.google.gwt.user.client.ui.InlineHyperlink
import com.google.gwt.user.client.ui.Hidden
import com.google.gwt.user.client.ui.Frame
import com.google.gwt.user.client.ui.NamedFrame
import com.google.gwt.user.cellview.client.CellTree
import com.google.gwt.user.cellview.client.CellTable
import com.google.gwt.user.cellview.client.DataGrid
import com.google.gwt.user.cellview.client.CellList
import com.google.gwt.user.cellview.client.PageSizePager
import com.google.gwt.user.cellview.client.SimplePager
import com.google.gwt.user.client.ui.CaptionPanel
import com.google.gwt.user.datepicker.client.DateBox
import com.google.gwt.user.datepicker.client.DatePicker
import com.google.gwt.user.datepicker.client.DefaultCalendarView
import com.google.gwt.user.datepicker.client.DefaultMonthSelector
import com.google.gwt.user.client.ui.DisclosurePanel
import com.google.gwt.user.client.ui.NotificationMole
import com.google.gwt.user.client.ui.StackLayoutPanel
import com.google.gwt.user.client.ui.TabLayoutPanel
import com.google.gwt.user.client.ui.SuggestBox
import com.google.gwt.user.client.ui.TabBar
import com.google.gwt.user.client.ui.DecoratedTabBar
import com.google.gwt.user.client.ui.TabPanel
import com.google.gwt.user.client.ui.DecoratedTabPanel
import com.google.gwt.editor.ui.client.ValueBoxEditorDecorator
import com.google.gwt.user.client.ui.ValueListBox
import com.google.gwt.user.client.ui.ValuePicker
import com.google.gwt.user.cellview.client.CellWidget
import com.google.gwt.user.client.ui.NativeHorizontalScrollbar
import com.google.gwt.user.client.ui.NativeVerticalScrollbar

class UiBuilder {

	def static anchor(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, boolean arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, com.google.gwt.safehtml.shared.SafeUri arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, com.google.gwt.safehtml.shared.SafeUri arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, boolean arg1, java.lang.String arg2, java.lang.String arg3, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2, arg3)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.safehtml.shared.SafeUri arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, java.lang.String arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (Anchor)=>void initializer) {
		val result = new Anchor(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, (Anchor)=>void initializer) {
		val result = new Anchor(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, boolean arg0, (Anchor)=>void initializer) {
		val result = new Anchor(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, (Anchor)=>void initializer) {
		val result = new Anchor
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, java.lang.String arg2, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.safehtml.shared.SafeUri arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, java.lang.String arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, boolean arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static anchor(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (Anchor)=>void initializer) {
		val result = new Anchor(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static button(HasWidgets parent, java.lang.String arg0, (Button)=>void initializer) {
		val result = new Button(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static button(HasWidgets parent, java.lang.String arg0, com.google.gwt.event.dom.client.ClickHandler arg1, (Button)=>void initializer) {
		val result = new Button(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static button(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (Button)=>void initializer) {
		val result = new Button(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static button(HasWidgets parent, (Button)=>void initializer) {
		val result = new Button
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static button(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.event.dom.client.ClickHandler arg1, (Button)=>void initializer) {
		val result = new Button(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, java.lang.String arg0, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, java.lang.String arg0, boolean arg1, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, (CheckBox)=>void initializer) {
		val result = new CheckBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static checkBox(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (CheckBox)=>void initializer) {
		val result = new CheckBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, java.lang.String arg0, com.google.gwt.event.dom.client.ClickHandler arg1, (PushButton)=>void initializer) {
		val result = new PushButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, java.lang.String arg0, (PushButton)=>void initializer) {
		val result = new PushButton(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (PushButton)=>void initializer) {
		val result = new PushButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, com.google.gwt.event.dom.client.ClickHandler arg2, (PushButton)=>void initializer) {
		val result = new PushButton(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, (PushButton)=>void initializer) {
		val result = new PushButton
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, (PushButton)=>void initializer) {
		val result = new PushButton(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, com.google.gwt.event.dom.client.ClickHandler arg1, (PushButton)=>void initializer) {
		val result = new PushButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, com.google.gwt.user.client.ui.Image arg1, com.google.gwt.event.dom.client.ClickHandler arg2, (PushButton)=>void initializer) {
		val result = new PushButton(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pushButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, com.google.gwt.user.client.ui.Image arg1, (PushButton)=>void initializer) {
		val result = new PushButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, java.lang.String arg0, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, java.lang.String arg0, com.google.gwt.event.dom.client.ClickHandler arg1, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, com.google.gwt.event.dom.client.ClickHandler arg2, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, (ToggleButton)=>void initializer) {
		val result = new ToggleButton
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, com.google.gwt.event.dom.client.ClickHandler arg1, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, com.google.gwt.user.client.ui.Image arg1, com.google.gwt.event.dom.client.ClickHandler arg2, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static toggleButton(HasWidgets parent, com.google.gwt.user.client.ui.Image arg0, com.google.gwt.user.client.ui.Image arg1, (ToggleButton)=>void initializer) {
		val result = new ToggleButton(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static canvas(HasWidgets parent, (Canvas)=>void initializer) {
		val result = Canvas.createIfSupported
		if (result == null)
			return null
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static fileUpload(HasWidgets parent, (FileUpload)=>void initializer) {
		val result = new FileUpload
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static listBox(HasWidgets parent, (ListBox)=>void initializer) {
		val result = new ListBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static audio(HasWidgets parent, (Audio)=>void initializer) {
		val result = Audio.createIfSupported
		if (result == null)
			return null
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static video(HasWidgets parent, (Video)=>void initializer) {
		val result = Video.createIfSupported
		if (result == null)
			return null
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static richTextArea(HasWidgets parent, (RichTextArea)=>void initializer) {
		val result = new RichTextArea
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simpleCheckBox(HasWidgets parent, (SimpleCheckBox)=>void initializer) {
		val result = new SimpleCheckBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simpleRadioButton(HasWidgets parent, java.lang.String arg0, (SimpleRadioButton)=>void initializer) {
		val result = new SimpleRadioButton(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static textArea(HasWidgets parent, (TextArea)=>void initializer) {
		val result = new TextArea
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static textBox(HasWidgets parent, (TextBox)=>void initializer) {
		val result = new TextBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static passwordTextBox(HasWidgets parent, (PasswordTextBox)=>void initializer) {
		val result = new PasswordTextBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static doubleBox(HasWidgets parent, (DoubleBox)=>void initializer) {
		val result = new DoubleBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static integerBox(HasWidgets parent, (IntegerBox)=>void initializer) {
		val result = new IntegerBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static longBox(HasWidgets parent, (LongBox)=>void initializer) {
		val result = new LongBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static absolutePanel(HasWidgets parent, (AbsolutePanel)=>void initializer) {
		val result = new AbsolutePanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dockPanel(HasWidgets parent, (DockPanel)=>void initializer) {
		val result = new DockPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static horizontalPanel(HasWidgets parent, (HorizontalPanel)=>void initializer) {
		val result = new HorizontalPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static verticalPanel(HasWidgets parent, (VerticalPanel)=>void initializer) {
		val result = new VerticalPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static deckLayoutPanel(HasWidgets parent, (DeckLayoutPanel)=>void initializer) {
		val result = new DeckLayoutPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static deckPanel(HasWidgets parent, (DeckPanel)=>void initializer) {
		val result = new DeckPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dockLayoutPanel(HasWidgets parent, com.google.gwt.dom.client.Style$Unit arg0, (DockLayoutPanel)=>void initializer) {
		val result = new DockLayoutPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static splitLayoutPanel(HasWidgets parent, (SplitLayoutPanel)=>void initializer) {
		val result = new SplitLayoutPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static splitLayoutPanel(HasWidgets parent, int arg0, (SplitLayoutPanel)=>void initializer) {
		val result = new SplitLayoutPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static flowPanel(HasWidgets parent, (FlowPanel)=>void initializer) {
		val result = new FlowPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static flowPanel(HasWidgets parent, java.lang.String arg0, (FlowPanel)=>void initializer) {
		val result = new FlowPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static htmlPanel(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (HTMLPanel)=>void initializer) {
		val result = new HTMLPanel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static htmlPanel(HasWidgets parent, java.lang.String arg0, (HTMLPanel)=>void initializer) {
		val result = new HTMLPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static htmlPanel(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (HTMLPanel)=>void initializer) {
		val result = new HTMLPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static layoutPanel(HasWidgets parent, (LayoutPanel)=>void initializer) {
		val result = new LayoutPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static renderablePanel(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (RenderablePanel)=>void initializer) {
		val result = new RenderablePanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static renderablePanel(HasWidgets parent, java.lang.String arg0, (RenderablePanel)=>void initializer) {
		val result = new RenderablePanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static stackPanel(HasWidgets parent, (StackPanel)=>void initializer) {
		val result = new StackPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratedStackPanel(HasWidgets parent, (DecoratedStackPanel)=>void initializer) {
		val result = new DecoratedStackPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static headerPanel(HasWidgets parent, (HeaderPanel)=>void initializer) {
		val result = new HeaderPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static flexTable(HasWidgets parent, (FlexTable)=>void initializer) {
		val result = new FlexTable
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static grid(HasWidgets parent, int arg0, int arg1, (Grid)=>void initializer) {
		val result = new Grid(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static grid(HasWidgets parent, (Grid)=>void initializer) {
		val result = new Grid
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePanel(HasWidgets parent, com.google.gwt.user.client.ui.Widget arg0, (SimplePanel)=>void initializer) {
		val result = new SimplePanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePanel(HasWidgets parent, (SimplePanel)=>void initializer) {
		val result = new SimplePanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratorPanel(HasWidgets parent, (DecoratorPanel)=>void initializer) {
		val result = new DecoratorPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static focusPanel(HasWidgets parent, (FocusPanel)=>void initializer) {
		val result = new FocusPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static focusPanel(HasWidgets parent, com.google.gwt.user.client.ui.Widget arg0, (FocusPanel)=>void initializer) {
		val result = new FocusPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static formPanel(HasWidgets parent, java.lang.String arg0, (FormPanel)=>void initializer) {
		val result = new FormPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static formPanel(HasWidgets parent, com.google.gwt.user.client.ui.NamedFrame arg0, (FormPanel)=>void initializer) {
		val result = new FormPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static formPanel(HasWidgets parent, (FormPanel)=>void initializer) {
		val result = new FormPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static popupPanel(HasWidgets parent, boolean arg0, boolean arg1, (PopupPanel)=>void initializer) {
		val result = new PopupPanel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static popupPanel(HasWidgets parent, boolean arg0, (PopupPanel)=>void initializer) {
		val result = new PopupPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static popupPanel(HasWidgets parent, (PopupPanel)=>void initializer) {
		val result = new PopupPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratedPopupPanel(HasWidgets parent, boolean arg0, boolean arg1, (DecoratedPopupPanel)=>void initializer) {
		val result = new DecoratedPopupPanel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratedPopupPanel(HasWidgets parent, boolean arg0, (DecoratedPopupPanel)=>void initializer) {
		val result = new DecoratedPopupPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratedPopupPanel(HasWidgets parent, (DecoratedPopupPanel)=>void initializer) {
		val result = new DecoratedPopupPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dialogBox(HasWidgets parent, boolean arg0, boolean arg1, com.google.gwt.user.client.ui.DialogBox$Caption arg2, (DialogBox)=>void initializer) {
		val result = new DialogBox(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dialogBox(HasWidgets parent, boolean arg0, boolean arg1, (DialogBox)=>void initializer) {
		val result = new DialogBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dialogBox(HasWidgets parent, com.google.gwt.user.client.ui.DialogBox$Caption arg0, (DialogBox)=>void initializer) {
		val result = new DialogBox(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dialogBox(HasWidgets parent, boolean arg0, (DialogBox)=>void initializer) {
		val result = new DialogBox(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dialogBox(HasWidgets parent, (DialogBox)=>void initializer) {
		val result = new DialogBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static resizeLayoutPanel(HasWidgets parent, (ResizeLayoutPanel)=>void initializer) {
		val result = new ResizeLayoutPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static scrollPanel(HasWidgets parent, com.google.gwt.user.client.ui.Widget arg0, (ScrollPanel)=>void initializer) {
		val result = new ScrollPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static scrollPanel(HasWidgets parent, (ScrollPanel)=>void initializer) {
		val result = new ScrollPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static customScrollPanel(HasWidgets parent, com.google.gwt.user.client.ui.CustomScrollPanel$Resources arg0, (CustomScrollPanel)=>void initializer) {
		val result = new CustomScrollPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static customScrollPanel(HasWidgets parent, (CustomScrollPanel)=>void initializer) {
		val result = new CustomScrollPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static customScrollPanel(HasWidgets parent, com.google.gwt.user.client.ui.Widget arg0, (CustomScrollPanel)=>void initializer) {
		val result = new CustomScrollPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simpleLayoutPanel(HasWidgets parent, (SimpleLayoutPanel)=>void initializer) {
		val result = new SimpleLayoutPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static tree(HasWidgets parent, com.google.gwt.user.client.ui.Tree$Resources arg0, boolean arg1, (Tree)=>void initializer) {
		val result = new Tree(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static tree(HasWidgets parent, com.google.gwt.user.client.ui.Tree$Resources arg0, (Tree)=>void initializer) {
		val result = new Tree(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static tree(HasWidgets parent, (Tree)=>void initializer) {
		val result = new Tree
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static menuBar(HasWidgets parent, com.google.gwt.user.client.ui.MenuBar$Resources arg0, (MenuBar)=>void initializer) {
		val result = new MenuBar(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static menuBar(HasWidgets parent, boolean arg0, com.google.gwt.user.client.ui.MenuBar$Resources arg1, (MenuBar)=>void initializer) {
		val result = new MenuBar(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static menuBar(HasWidgets parent, (MenuBar)=>void initializer) {
		val result = new MenuBar
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static menuBar(HasWidgets parent, boolean arg0, (MenuBar)=>void initializer) {
		val result = new MenuBar(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static label(HasWidgets parent, java.lang.String arg0, boolean arg1, (Label)=>void initializer) {
		val result = new Label(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static label(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (Label)=>void initializer) {
		val result = new Label(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static label(HasWidgets parent, java.lang.String arg0, (Label)=>void initializer) {
		val result = new Label(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static label(HasWidgets parent, (Label)=>void initializer) {
		val result = new Label
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static label(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (Label)=>void initializer) {
		val result = new Label(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (HTML)=>void initializer) {
		val result = new HTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, java.lang.String arg0, (HTML)=>void initializer) {
		val result = new HTML(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (HTML)=>void initializer) {
		val result = new HTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, java.lang.String arg0, boolean arg1, (HTML)=>void initializer) {
		val result = new HTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, (HTML)=>void initializer) {
		val result = new HTML
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (HTML)=>void initializer) {
		val result = new HTML(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static html(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (HTML)=>void initializer) {
		val result = new HTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static captionImpl(HasWidgets parent, (CaptionImpl)=>void initializer) {
		val result = new CaptionImpl
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHTML(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (InlineHTML)=>void initializer) {
		val result = new InlineHTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHTML(HasWidgets parent, java.lang.String arg0, (InlineHTML)=>void initializer) {
		val result = new InlineHTML(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHTML(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (InlineHTML)=>void initializer) {
		val result = new InlineHTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHTML(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (InlineHTML)=>void initializer) {
		val result = new InlineHTML(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHTML(HasWidgets parent, (InlineHTML)=>void initializer) {
		val result = new InlineHTML
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHTML(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (InlineHTML)=>void initializer) {
		val result = new InlineHTML(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineLabel(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, (InlineLabel)=>void initializer) {
		val result = new InlineLabel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineLabel(HasWidgets parent, java.lang.String arg0, (InlineLabel)=>void initializer) {
		val result = new InlineLabel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineLabel(HasWidgets parent, (InlineLabel)=>void initializer) {
		val result = new InlineLabel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineLabel(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, (InlineLabel)=>void initializer) {
		val result = new InlineLabel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueLabel(HasWidgets parent, (ValueLabel<T>)=>void initializer) {
		val result = new ValueLabel<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueLabel(HasWidgets parent, com.google.gwt.text.shared.Renderer<java.lang.Object> arg0, (ValueLabel<T>)=>void initializer) {
		val result = new ValueLabel<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dateLabel(HasWidgets parent, (DateLabel)=>void initializer) {
		val result = new DateLabel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dateLabel(HasWidgets parent, com.google.gwt.i18n.shared.DateTimeFormat arg0, (DateLabel)=>void initializer) {
		val result = new DateLabel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dateLabel(HasWidgets parent, com.google.gwt.i18n.shared.DateTimeFormat arg0, com.google.gwt.i18n.shared.TimeZone arg1, (DateLabel)=>void initializer) {
		val result = new DateLabel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T extends java.lang.Number> numberLabel(HasWidgets parent, (NumberLabel<T>)=>void initializer) {
		val result = new NumberLabel<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T extends java.lang.Number> numberLabel(HasWidgets parent, com.google.gwt.i18n.client.NumberFormat arg0, (NumberLabel<T>)=>void initializer) {
		val result = new NumberLabel<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static image(HasWidgets parent, com.google.gwt.resources.client.ImageResource arg0, (Image)=>void initializer) {
		val result = new Image(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static image(HasWidgets parent, java.lang.String arg0, (Image)=>void initializer) {
		val result = new Image(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static image(HasWidgets parent, com.google.gwt.safehtml.shared.SafeUri arg0, (Image)=>void initializer) {
		val result = new Image(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static image(HasWidgets parent, java.lang.String arg0, int arg1, int arg2, int arg3, int arg4, (Image)=>void initializer) {
		val result = new Image(arg0, arg1, arg2, arg3, arg4)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static image(HasWidgets parent, com.google.gwt.safehtml.shared.SafeUri arg0, int arg1, int arg2, int arg3, int arg4, (Image)=>void initializer) {
		val result = new Image(arg0, arg1, arg2, arg3, arg4)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static image(HasWidgets parent, (Image)=>void initializer) {
		val result = new Image
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, java.lang.String arg2, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, java.lang.String arg2, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, java.lang.String arg0, boolean arg1, java.lang.String arg2, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, (Hyperlink)=>void initializer) {
		val result = new Hyperlink
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, java.lang.String arg1, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, java.lang.String arg2, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, java.lang.String arg2, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hyperlink(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (Hyperlink)=>void initializer) {
		val result = new Hyperlink(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, java.lang.String arg2, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, java.lang.String arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, java.lang.String arg2, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, java.lang.String arg0, boolean arg1, java.lang.String arg2, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, java.lang.String arg1, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.client.HasDirection$Direction arg1, java.lang.String arg2, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, com.google.gwt.i18n.shared.DirectionEstimator arg1, java.lang.String arg2, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static inlineHyperlink(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (InlineHyperlink)=>void initializer) {
		val result = new InlineHyperlink(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hidden(HasWidgets parent, java.lang.String arg0, java.lang.String arg1, (Hidden)=>void initializer) {
		val result = new Hidden(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hidden(HasWidgets parent, java.lang.String arg0, (Hidden)=>void initializer) {
		val result = new Hidden(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static hidden(HasWidgets parent, (Hidden)=>void initializer) {
		val result = new Hidden
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static frame(HasWidgets parent, java.lang.String arg0, (Frame)=>void initializer) {
		val result = new Frame(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static frame(HasWidgets parent, (Frame)=>void initializer) {
		val result = new Frame
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static namedFrame(HasWidgets parent, java.lang.String arg0, (NamedFrame)=>void initializer) {
		val result = new NamedFrame(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTree(HasWidgets parent, com.google.gwt.view.client.TreeViewModel arg0, T arg1, com.google.gwt.user.cellview.client.CellTree$Resources arg2, com.google.gwt.user.cellview.client.CellTree$CellTreeMessages arg3, (CellTree)=>void initializer) {
		val result = new CellTree<T>(arg0, arg1, arg2, arg3)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTree(HasWidgets parent, com.google.gwt.view.client.TreeViewModel arg0, T arg1, com.google.gwt.user.cellview.client.CellTree$Resources arg2, (CellTree)=>void initializer) {
		val result = new CellTree<T>(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTree(HasWidgets parent, com.google.gwt.view.client.TreeViewModel arg0, T arg1, (CellTree)=>void initializer) {
		val result = new CellTree<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTree(HasWidgets parent, com.google.gwt.view.client.TreeViewModel arg0, T arg1, com.google.gwt.user.cellview.client.CellTree$Resources arg2, com.google.gwt.user.cellview.client.CellTree$CellTreeMessages arg3, int arg4, (CellTree)=>void initializer) {
		val result = new CellTree<T>(arg0, arg1, arg2, arg3, arg4)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, com.google.gwt.view.client.ProvidesKey<T> arg0, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.CellTable$Resources arg1, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, int arg0, com.google.gwt.view.client.ProvidesKey<T> arg1, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.CellTable$Resources arg1, com.google.gwt.view.client.ProvidesKey<T> arg2, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.CellTable$Resources arg1, com.google.gwt.view.client.ProvidesKey<T> arg2, com.google.gwt.user.client.ui.Widget arg3, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0, arg1, arg2, arg3)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.CellTable$Resources arg1, com.google.gwt.view.client.ProvidesKey<T> arg2, com.google.gwt.user.client.ui.Widget arg3, boolean arg4, boolean arg5, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0, arg1, arg2, arg3, arg4, arg5)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellTable(HasWidgets parent, int arg0, (CellTable<T>)=>void initializer) {
		val result = new CellTable<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, int arg0, com.google.gwt.view.client.ProvidesKey<T> arg1, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.DataGrid$Resources arg1, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.DataGrid$Resources arg1, com.google.gwt.view.client.ProvidesKey<T> arg2, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, com.google.gwt.view.client.ProvidesKey<T> arg0, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, int arg0, com.google.gwt.user.cellview.client.DataGrid$Resources arg1, com.google.gwt.view.client.ProvidesKey<T> arg2, com.google.gwt.user.client.ui.Widget arg3, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>(arg0, arg1, arg2, arg3)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> dataGrid(HasWidgets parent, int arg0, (DataGrid<T>)=>void initializer) {
		val result = new DataGrid<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellList(HasWidgets parent, com.google.gwt.cell.client.Cell<T> arg0, com.google.gwt.user.cellview.client.CellList$Resources arg1, com.google.gwt.view.client.ProvidesKey<T> arg2, (CellList<T>)=>void initializer) {
		val result = new CellList<T>(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellList(HasWidgets parent, com.google.gwt.cell.client.Cell<T> arg0, com.google.gwt.user.cellview.client.CellList$Resources arg1, (CellList<T>)=>void initializer) {
		val result = new CellList<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellList(HasWidgets parent, com.google.gwt.cell.client.Cell<T> arg0, (CellList<T>)=>void initializer) {
		val result = new CellList<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> cellList(HasWidgets parent, com.google.gwt.cell.client.Cell<T> arg0, com.google.gwt.view.client.ProvidesKey<T> arg1, (CellList<T>)=>void initializer) {
		val result = new CellList<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static pageSizePager(HasWidgets parent, int arg0, (PageSizePager)=>void initializer) {
		val result = new PageSizePager(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, com.google.gwt.user.cellview.client.SimplePager$TextLocation arg0, boolean arg1, boolean arg2, (SimplePager)=>void initializer) {
		val result = new SimplePager(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, com.google.gwt.user.cellview.client.SimplePager$TextLocation arg0, boolean arg1, int arg2, boolean arg3, (SimplePager)=>void initializer) {
		val result = new SimplePager(arg0, arg1, arg2, arg3)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, com.google.gwt.user.cellview.client.SimplePager$TextLocation arg0, com.google.gwt.user.cellview.client.SimplePager$Resources arg1, boolean arg2, int arg3, boolean arg4, (SimplePager)=>void initializer) {
		val result = new SimplePager(arg0, arg1, arg2, arg3, arg4)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, com.google.gwt.user.cellview.client.SimplePager$TextLocation arg0, com.google.gwt.user.cellview.client.SimplePager$Resources arg1, boolean arg2, int arg3, boolean arg4, boolean arg5, com.google.gwt.user.cellview.client.SimplePager$ImageButtonsConstants arg6, (SimplePager)=>void initializer) {
		val result = new SimplePager(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, com.google.gwt.user.cellview.client.SimplePager$TextLocation arg0, (SimplePager)=>void initializer) {
		val result = new SimplePager(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, (SimplePager)=>void initializer) {
		val result = new SimplePager
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static simplePager(HasWidgets parent, com.google.gwt.user.cellview.client.SimplePager$TextLocation arg0, com.google.gwt.user.cellview.client.SimplePager$Resources arg1, boolean arg2, int arg3, boolean arg4, com.google.gwt.user.cellview.client.SimplePager$ImageButtonsConstants arg5, (SimplePager)=>void initializer) {
		val result = new SimplePager(arg0, arg1, arg2, arg3, arg4, arg5)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static captionPanel(HasWidgets parent, java.lang.String arg0, boolean arg1, (CaptionPanel)=>void initializer) {
		val result = new CaptionPanel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static captionPanel(HasWidgets parent, java.lang.String arg0, (CaptionPanel)=>void initializer) {
		val result = new CaptionPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static captionPanel(HasWidgets parent, com.google.gwt.safehtml.shared.SafeHtml arg0, (CaptionPanel)=>void initializer) {
		val result = new CaptionPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static captionPanel(HasWidgets parent, (CaptionPanel)=>void initializer) {
		val result = new CaptionPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dateBox(HasWidgets parent, (DateBox)=>void initializer) {
		val result = new DateBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static dateBox(HasWidgets parent, com.google.gwt.user.datepicker.client.DatePicker arg0, java.util.Date arg1, com.google.gwt.user.datepicker.client.DateBox$Format arg2, (DateBox)=>void initializer) {
		val result = new DateBox(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static datePicker(HasWidgets parent, (DatePicker)=>void initializer) {
		val result = new DatePicker
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static defaultCalendarView(HasWidgets parent, (DefaultCalendarView)=>void initializer) {
		val result = new DefaultCalendarView
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static defaultMonthSelector(HasWidgets parent, (DefaultMonthSelector)=>void initializer) {
		val result = new DefaultMonthSelector
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static disclosurePanel(HasWidgets parent, java.lang.String arg0, (DisclosurePanel)=>void initializer) {
		val result = new DisclosurePanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static disclosurePanel(HasWidgets parent, (DisclosurePanel)=>void initializer) {
		val result = new DisclosurePanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static disclosurePanel(HasWidgets parent, com.google.gwt.resources.client.ImageResource arg0, com.google.gwt.resources.client.ImageResource arg1, java.lang.String arg2, (DisclosurePanel)=>void initializer) {
		val result = new DisclosurePanel(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static notificationMole(HasWidgets parent, (NotificationMole)=>void initializer) {
		val result = new NotificationMole
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static stackLayoutPanel(HasWidgets parent, com.google.gwt.dom.client.Style$Unit arg0, (StackLayoutPanel)=>void initializer) {
		val result = new StackLayoutPanel(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static tabLayoutPanel(HasWidgets parent, double arg0, com.google.gwt.dom.client.Style$Unit arg1, (TabLayoutPanel)=>void initializer) {
		val result = new TabLayoutPanel(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static suggestBox(HasWidgets parent, com.google.gwt.user.client.ui.SuggestOracle arg0, com.google.gwt.user.client.ui.ValueBoxBase<java.lang.String> arg1, com.google.gwt.user.client.ui.SuggestBox$SuggestionDisplay arg2, (SuggestBox)=>void initializer) {
		val result = new SuggestBox(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static suggestBox(HasWidgets parent, com.google.gwt.user.client.ui.SuggestOracle arg0, (SuggestBox)=>void initializer) {
		val result = new SuggestBox(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static suggestBox(HasWidgets parent, (SuggestBox)=>void initializer) {
		val result = new SuggestBox
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static suggestBox(HasWidgets parent, com.google.gwt.user.client.ui.SuggestOracle arg0, com.google.gwt.user.client.ui.ValueBoxBase<java.lang.String> arg1, (SuggestBox)=>void initializer) {
		val result = new SuggestBox(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static tabBar(HasWidgets parent, (TabBar)=>void initializer) {
		val result = new TabBar
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratedTabBar(HasWidgets parent, (DecoratedTabBar)=>void initializer) {
		val result = new DecoratedTabBar
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static tabPanel(HasWidgets parent, (TabPanel)=>void initializer) {
		val result = new TabPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static decoratedTabPanel(HasWidgets parent, (DecoratedTabPanel)=>void initializer) {
		val result = new DecoratedTabPanel
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueBoxEditorDecorator(HasWidgets parent, (ValueBoxEditorDecorator<T>)=>void initializer) {
		val result = new ValueBoxEditorDecorator<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueBoxEditorDecorator(HasWidgets parent, com.google.gwt.user.client.ui.ValueBoxBase<T> arg0, com.google.gwt.editor.ui.client.adapters.ValueBoxEditor<T> arg1, (ValueBoxEditorDecorator<T>)=>void initializer) {
		val result = new ValueBoxEditorDecorator<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueListBox(HasWidgets parent, com.google.gwt.text.shared.Renderer<java.lang.Object> arg0, com.google.gwt.view.client.ProvidesKey<T> arg1, (ValueListBox<T>)=>void initializer) {
		val result = new ValueListBox<T>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueListBox(HasWidgets parent, com.google.gwt.text.shared.Renderer<java.lang.Object> arg0, (ValueListBox<T>)=>void initializer) {
		val result = new ValueListBox<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valueListBox(HasWidgets parent, (ValueListBox<T>)=>void initializer) {
		val result = new ValueListBox<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valuePicker(HasWidgets parent, (ValuePicker<T>)=>void initializer) {
		val result = new ValuePicker<T>
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valuePicker(HasWidgets parent, com.google.gwt.text.shared.Renderer<java.lang.Object> arg0, (ValuePicker<T>)=>void initializer) {
		val result = new ValuePicker<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <T> valuePicker(HasWidgets parent, com.google.gwt.user.cellview.client.CellList<T> arg0, (ValuePicker<T>)=>void initializer) {
		val result = new ValuePicker<T>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <C> cellWidget(HasWidgets parent, com.google.gwt.cell.client.Cell<C> arg0, C arg1, com.google.gwt.view.client.ProvidesKey<C> arg2, (CellWidget<C>)=>void initializer) {
		val result = new CellWidget<C>(arg0, arg1, arg2)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <C> cellWidget(HasWidgets parent, com.google.gwt.cell.client.Cell<C> arg0, C arg1, (CellWidget<C>)=>void initializer) {
		val result = new CellWidget<C>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <C> cellWidget(HasWidgets parent, com.google.gwt.cell.client.Cell<C> arg0, com.google.gwt.view.client.ProvidesKey<C> arg1, (CellWidget<C>)=>void initializer) {
		val result = new CellWidget<C>(arg0, arg1)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static <C> cellWidget(HasWidgets parent, com.google.gwt.cell.client.Cell<C> arg0, (CellWidget<C>)=>void initializer) {
		val result = new CellWidget<C>(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static nativeHorizontalScrollbar(HasWidgets parent, com.google.gwt.user.client.ui.NativeHorizontalScrollbar$Resources arg0, (NativeHorizontalScrollbar)=>void initializer) {
		val result = new NativeHorizontalScrollbar(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static nativeHorizontalScrollbar(HasWidgets parent, (NativeHorizontalScrollbar)=>void initializer) {
		val result = new NativeHorizontalScrollbar
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static nativeVerticalScrollbar(HasWidgets parent, com.google.gwt.user.client.ui.NativeVerticalScrollbar$Resources arg0, (NativeVerticalScrollbar)=>void initializer) {
		val result = new NativeVerticalScrollbar(arg0)
		parent.add(result)
		initializer.apply(result)
		return result
	}

	def static nativeVerticalScrollbar(HasWidgets parent, (NativeVerticalScrollbar)=>void initializer) {
		val result = new NativeVerticalScrollbar
		parent.add(result)
		initializer.apply(result)
		return result
	}

}
