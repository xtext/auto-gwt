/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package de.itemis.xtend.auto.gwt

import com.google.gwt.dom.client.AnchorElement
import com.google.gwt.dom.client.AreaElement
import com.google.gwt.dom.client.AudioElement
import com.google.gwt.dom.client.BRElement
import com.google.gwt.dom.client.BaseElement
import com.google.gwt.dom.client.BodyElement
import com.google.gwt.dom.client.ButtonElement
import com.google.gwt.dom.client.CanvasElement
import com.google.gwt.dom.client.DListElement
import com.google.gwt.dom.client.DivElement
import com.google.gwt.dom.client.FieldSetElement
import com.google.gwt.dom.client.FormElement
import com.google.gwt.dom.client.FrameElement
import com.google.gwt.dom.client.FrameSetElement
import com.google.gwt.dom.client.HRElement
import com.google.gwt.dom.client.HeadElement
import com.google.gwt.dom.client.HeadingElement
import com.google.gwt.dom.client.IFrameElement
import com.google.gwt.dom.client.ImageElement
import com.google.gwt.dom.client.InputElement
import com.google.gwt.dom.client.LIElement
import com.google.gwt.dom.client.LabelElement
import com.google.gwt.dom.client.LegendElement
import com.google.gwt.dom.client.LinkElement
import com.google.gwt.dom.client.MapElement
import com.google.gwt.dom.client.MetaElement
import com.google.gwt.dom.client.ModElement
import com.google.gwt.dom.client.OListElement
import com.google.gwt.dom.client.ObjectElement
import com.google.gwt.dom.client.OptGroupElement
import com.google.gwt.dom.client.OptionElement
import com.google.gwt.dom.client.ParagraphElement
import com.google.gwt.dom.client.ParamElement
import com.google.gwt.dom.client.PreElement
import com.google.gwt.dom.client.QuoteElement
import com.google.gwt.dom.client.ScriptElement
import com.google.gwt.dom.client.SelectElement
import com.google.gwt.dom.client.SourceElement
import com.google.gwt.dom.client.SpanElement
import com.google.gwt.dom.client.StyleElement
import com.google.gwt.dom.client.TableCaptionElement
import com.google.gwt.dom.client.TableCellElement
import com.google.gwt.dom.client.TableColElement
import com.google.gwt.dom.client.TableElement
import com.google.gwt.dom.client.TableRowElement
import com.google.gwt.dom.client.TableSectionElement
import com.google.gwt.dom.client.TagName
import com.google.gwt.dom.client.TextAreaElement
import com.google.gwt.dom.client.TitleElement
import com.google.gwt.dom.client.UListElement
import com.google.gwt.dom.client.VideoElement
import java.io.InputStream
import java.util.Map
import javax.xml.parsers.DocumentBuilderFactory
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.macro.declaration.Type
import org.eclipse.xtend.lib.macro.declaration.TypeDeclaration
import org.eclipse.xtend.lib.macro.services.TypeLookup
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

class UiBinderParser {

	static val PACKAGE_URI_SCHEME = 'urn:import:'

	static val BINDER_URI = 'urn:ui:com.google.gwt.uibinder'

	@Accessors(PUBLIC_GETTER)
	String gwtPrefix

	@Accessors(PUBLIC_GETTER)
	Map<String, Type> fields = newHashMap

	val Document document

	val extension TypeLookup typeLookup

	new(InputStream input, TypeLookup typeLookup) throws Exception {
		this.typeLookup = typeLookup
		val factory = DocumentBuilderFactory.newInstance
		factory.namespaceAware = true
		this.document = factory.newDocumentBuilder.parse(input)
	}

	def parse() {
		parse(document)
		this
	}

	protected def void parse(Document doc) {
		val documentElement = doc.documentElement
		gwtPrefix = documentElement.lookupPrefix(BINDER_URI)
		documentElement.parse
	}

	protected def void parse(Node it) {
		if (it instanceof Element) {
			collectData
		}
		var max = childNodes.length
		for (var i = 0; i < max; i++) {
			childNodes.item(i).parse
		}
	}

	protected def void collectData(Element it) {
		val fieldName = fieldName
		if (fieldName != null) {
			fields.put(fieldName, fieldType)
		}
	}

	protected def String getFieldName(extension Element it) {
		if (!uiFieldAttributeName.hasAttribute) {
			return null
		}
		uiFieldAttributeName.attribute.trim
	}

	protected def Type getFieldType(Element it) {
		val tagName = localName
		if (!importedElement) {
			return findDomElementTypeForTag(tagName)
		}
		val ns = namespaceURI
		val qualifiedName = ns.substring(PACKAGE_URI_SCHEME.length) + '.' + tagName
		qualifiedName.findTypeGlobally
	}

	protected def findDomElementTypeForTag(String tagName) {
		val tagNameType = TagName.findTypeGlobally
		for (elementSubType : elementSubTypes) {
			val annotation = elementSubType.findAnnotation(tagNameType)
			if (annotation != null && annotation.getStringArrayValue('value').contains(tagName)) {
				return elementSubType
			}
		}
		com.google.gwt.dom.client.Element.findTypeGlobally
	}

	protected def create {
		#[
			AnchorElement,
			AreaElement,
			BaseElement,
			BodyElement,
			BRElement,
			ButtonElement,
			CanvasElement,
			DivElement,
			DListElement,
			FieldSetElement,
			FormElement,
			FrameElement,
			FrameSetElement,
			HeadElement,
			HeadingElement,
			HRElement,
			IFrameElement,
			ImageElement,
			InputElement,
			LabelElement,
			LegendElement,
			LIElement,
			LinkElement,
			MapElement,
			AudioElement,
			VideoElement,
			MetaElement,
			ModElement,
			ObjectElement,
			OListElement,
			OptGroupElement,
			OptionElement,
			ParagraphElement,
			ParamElement,
			PreElement,
			QuoteElement,
			ScriptElement,
			SelectElement,
			SourceElement,
			SpanElement,
			StyleElement,
			TableCaptionElement,
			TableCellElement,
			TableColElement,
			TableElement,
			TableRowElement,
			TableSectionElement,
			TextAreaElement,
			TitleElement,
			UListElement
		].map [
			findTypeGlobally
		].filter(TypeDeclaration)
	} getElementSubTypes() {}

	protected def isImportedElement(Element it) {
		val uri = namespaceURI
		uri != null && uri.startsWith(PACKAGE_URI_SCHEME)
	}

	protected def String create '''«gwtPrefix»:field''' getUiFieldAttributeName() {}

}
