package com.rudrasoft.saxonlinepo.srv;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.xml.sax.SAXException;

import com.javabuddy.ws.jaxb.AddressType;
import com.javabuddy.ws.jaxb.ItemType;
import com.javabuddy.ws.jaxb.ProductType;
import com.javabuddy.ws.jaxb.PurchaseOrderType;
import com.rudrasoft.saxonlinepo.dao.Invoice_dao;
import com.rudrasoft.saxonlinepo.handler.SAX_XMLPOReader;;

/**
 * Servlet implementation class SAXOnlinePO_SRV
 */
@WebServlet({ "/SAXOnlinePO_SRV", "/plcaepo.htm", "/plcaepo/uploadXML", "/plcaepo/frmSubmit" })
public class SAXOnlinePO_SRV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SAXOnlinePO_SRV() {
        super();
        // TODO Auto-generated constructor stub
    }
    //private final String UPLOAD_DIRECTORY = "E:/";
    /**
	 * @throws IOException 
	 * @throws ServletException 
     * @throws SAXException 
     * @throws ParserConfigurationException 
     * @throws JAXBException 
	 * @see CZ_SubjectVisit_Srv#mapRequest(HttpServletRequest request, HttpServletResponse response)
	 * this method will map the Servlet request
	 */
	private void mapRequest(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException, ParserConfigurationException, SAXException, JAXBException {

		session = request.getSession();
		
		System.out.println("Servlet uRL request = "+request.getServletPath());

		/** mapping servlet request */
		switch (request.getServletPath()) {
			case "/plcaepo.htm":
				home(request, response);
				break;
			case "/plcaepo/uploadXML":
				uploadXML(request, response);
				break;
			case "/plcaepo/frmSubmit":
				frmSubmit(request, response);
				break;
			default:
				home(request, response);
				break;
		}
	}
	
	private void frmSubmit(HttpServletRequest request, HttpServletResponse response) throws JAXBException, ParserConfigurationException, SAXException, IOException, ServletException {
		System.out.println("frmSubmit(): called");
		System.out.println("Address Line1" +request.getParameter("addressLine1"));
		System.out.println("Address Line2" +request.getParameter("addressLine2"));
		System.out.println("city = " +request.getParameter("city"));
		System.out.println("state = " +request.getParameter("state"));
		System.out.println("country = " +request.getParameter("country"));
		System.out.println("zip = " +request.getParameter("zip"));
		
		System.out.println("itemCode = "+request.getParameterValues("itemCode[]"));
		
		PurchaseOrderType poType = setPO(request, response);
		
		@SuppressWarnings("deprecation")
		String filePath = request.getRealPath("/");
		
		String uID = (String)session.getAttribute("userID");
		System.out.println("File Uploaded Path = "+filePath+File.separator+"purchaseOrder_u"+uID+".xml");
		poMarshaller(poType, filePath+File.separator+"purchaseOrder_u"+uID);
		invoiceGenrator(new File(filePath+File.separator+"purchaseOrder_u"+uID), request, response);
		
	}
	private void poMarshaller(PurchaseOrderType poType, String filePath) throws JAXBException {
		JAXBContext jContext = JAXBContext.newInstance("com.javabuddy.ws.jaxb");
		Marshaller marshal = jContext.createMarshaller();
		marshal.setProperty( Marshaller.JAXB_FORMATTED_OUTPUT, true );
		marshal.marshal(poType, System.out);
		marshal.marshal(poType, new File(filePath));
		
	}
	private PurchaseOrderType setPO(HttpServletRequest request, HttpServletResponse response) {
		AddressType addressType = null;
		ItemType itemType = null;
		ProductType pType = null;
		PurchaseOrderType poType = null;
		
		//Setting values to the Address Type Object
		addressType = new AddressType();
		addressType.setAddressLine1(request.getParameter("addressLine1"));
		addressType.setAddressLine2(request.getParameter("addressLine2"));
		addressType.setCity(request.getParameter("city"));
		addressType.setState(request.getParameter("state"));
		addressType.setCountry(request.getParameter("country"));
		addressType.setZip(Integer.parseInt(request.getParameter("zip")));
		
		String[] itemCode = request.getParameterValues("itemCode[]");
		String[] quantity = request.getParameterValues("quantity[]");
		
		//Setting values to ItemType object and ProductType object
		pType = new ProductType();
		for (int i = 0; i < itemCode.length;i++) {
			itemType = new ItemType();
			itemType.setItemCode(itemCode[i]);
			itemType.setItemQuantity(Integer.parseInt(quantity[i]));
			pType.getItem().add(itemType);
		}
		
		//Setting Values to the PurchaseOrderType object
		poType = new PurchaseOrderType();
		poType.setProduct(pType);
		poType.setAddress(addressType);
		return poType;
	}
	@SuppressWarnings("deprecation")
	private void uploadXML(HttpServletRequest request, HttpServletResponse response) throws ParserConfigurationException, SAXException, IOException, ServletException {
		System.out.println("uploadXML called");
		
		if(session.getAttribute("fname") == null){
			System.out.println("session is empty........");
			response.sendRedirect("login.htm");
		}
		String uploadDir = null;
		File file = null;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		// process only if its multipart content
		if (isMultipart) {
			uploadDir = request.getRealPath("/");
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				// Parse the request
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = upload.parseRequest(request);

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						
						String name = new File(item.getName()).getName();
						file = new File(uploadDir + File.separator + name);
						item.write(new File(uploadDir + File.separator + name));
						System.out.println("Upload url = "+uploadDir + File.separator + name);
						invoiceGenrator(file, request, response);
					}
				}
			} 
			catch (Exception e) 
			{
			  e.printStackTrace();
			} 
		}
		
		
		
		/*Gson gson = new Gson();
    	response.setContentType("application/json");
    	response.getWriter().write(gson.toJson(invoiceMap));
    	System.out.println("Json = "+gson.toJson(invoiceMap));*/
	}

	private void invoiceGenrator(File file, HttpServletRequest request, HttpServletResponse response) throws ParserConfigurationException, SAXException, IOException, ServletException {
		SAXParserFactory factory = null;
		SAXParser parser = null;
		SAX_XMLPOReader handler = null;
		
		factory = SAXParserFactory.newInstance();
		parser = factory.newSAXParser();
		handler = new SAX_XMLPOReader();
		parser.parse(file, handler);
		
		Invoice_dao.save((String)session.getAttribute("userID"));
		
		HashMap<String, Object> invoiceMap= Invoice_dao.getItemInfo(handler);
		invoiceMap.put("name", (String)session.getAttribute("fname")+" "+(String)session.getAttribute("lname"));
		
		request.setAttribute("invoiceMap", invoiceMap);
		
		request.getRequestDispatcher("../invoice.jsp").forward(request, response);
		
	}
	private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(session.getAttribute("fname") == null){
			System.out.println("session is empty........");
			response.sendRedirect("login.htm");
		}else{
			request.getRequestDispatcher("frm_placePO.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			mapRequest(request, response);
		} catch (ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		} catch (JAXBException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
