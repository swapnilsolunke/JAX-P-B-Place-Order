/**
 * 
 */
package com.rudrasoft.saxonlinepo.handler;

import java.util.ArrayList;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * @author Rudra
 *
 */
public class SAX_XMLPOReader extends DefaultHandler {
	private ArrayList<String> icList = null;
	private ArrayList<String> qList = null;
	private String addLine1;
	private String addLine2;
	private String city;
	private String state;
	private String country;
	private String zipCode;
   
	private String chkFlag = "";
	
	
	public ArrayList<String> getIcList() {
		return icList;
	}

	public ArrayList<String> getqList() {
		return qList;
	}

	public String getAddLine1() {
		return addLine1;
	}

	public String getAddLine2() {
		return addLine2;
	}

	public String getCity() {
		return city;
	}

	public String getState() {
		return state;
	}

	public String getCountry() {
		return country;
	}

	public String getZipCode() {
		return zipCode;
	}

	@Override
	public void startDocument() throws SAXException {
		System.out.println("START DOCUMENT");
		icList = new ArrayList<String>();
		qList = new ArrayList<String>();
	}

	@Override
	public void endDocument() throws SAXException {
		System.out.println("END DOCUMENT");
	}

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		System.out.print("<"+qName+">");
		chkFlag = qName;
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		System.out.println("</"+qName+">");
	}

	@Override
	public void characters(char[] ch, int offset, int length) throws SAXException {
		String data = new String(ch, offset, length);
		System.out.print(data);
		if(chkFlag.equals("itemCode")){
			icList.add(data);
			chkFlag = "";
		}else if(chkFlag.equals("itemQuantity")){
			qList.add(data);
			chkFlag = "";
		}else if(chkFlag.equals("addressLine1")){
			addLine1 = data;
			chkFlag = "";
		}else if(chkFlag.equals("addressLine2")){
			addLine2 = data;
			chkFlag = "";
		}else if(chkFlag.equals("city")){
			city = data;
			chkFlag = "";
		}else if(chkFlag.equals("state")){
			state = data;
			chkFlag = "";
		}else if(chkFlag.equals("country")){
			country = data;
			chkFlag = "";
		}else if(chkFlag.equals("zip")){
			zipCode = data;
			chkFlag = "";
		}
	}

}
