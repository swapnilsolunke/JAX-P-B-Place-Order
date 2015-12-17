<%@page import="com.rudrasoft.saxonlinepo.bo.Invoice_BO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	HashMap<String, Object> invoiceMap = (HashMap<String, Object>) request.getAttribute("invoiceMap");
    	System.out.println(invoiceMap.get("city"));
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<table class="table table-bordered" style="background-color: rgba(107, 104, 107, 0.68);">
										<tr style="font-family: sans-serif;font-size: 18;font-weight: bold;color: white;background-color: rgb(117, 165, 114);;text-align: center;text-shadow: black;">
											<td colspan="3">RETAIL INVOICE</td>
										</tr>
										<tr>
											<td>INVOICE NO :: <%=invoiceMap.get("invoice_id") %></td>
											<td>INVOICE DATE :: <span id="invoiceDate"><%= new Date().toLocaleString() %></span></td>
										</tr>
										<tr>
											<td style="width: 50%;">
												<table class="table" style="background-color: rgba(255, 7, 7, 0.0)">
													<tr style="font-family: sans-serif;font-size: 18;font-weight: bold;color: white;background-color: rgb(117, 165, 114);">
														<td>SELLER</td>
													</tr>
													<tr>
														<td style="font-weight: bold;">AGGRAWAL SALES</td>
													</tr>
													<tr>
														<td>B-77 Ganesh Nagar, Tilak Nagar New Delhi 110018.</td>
													</tr>
													<tr>
														<td><label>CITY :</label>&nbsp;<span id="sCity">New Delhi</span></td>
													</tr>
													<tr>
														<td><label>STATE :</label>&nbsp;<span id="sState">Delhi</span></td>
													</tr>
													<tr>
														<td><label>PIN :</label>&nbsp;<span id="sPin">110018</span></td>
													</tr>
													<tr>
														<td><label>PHONE :</label>&nbsp;<span id="sPhone">0120-3062244</span></td>
													</tr>
													
													<tr>
														<td><label>COMPANY'S VAT TIN :</label>&nbsp;<span id="sVatTin">07580323163</span></td>
													</tr>
													<tr>
														<td><label>COMPANY'S PAN No :</label>&nbsp;<span id="sPanNo">AANFA4335R</span></td>
													</tr>
												</table>
											</td>
											<td>
												<table class="table" style="background-color: rgba(255, 7, 7, 0.0)">
													<tr style="font-family: sans-serif;font-size: 16;font-weight: bold;color:white;background-color: rgb(117, 165, 114);">
														<td>BUYER (SHIPPING ADDRESS)</td>
													</tr>
													<tr>
														<td style="font-weight: bold;"><span id="bName"><%=invoiceMap.get("name") %></span></td>
													</tr>
													<tr>
														<td><span id="bAddress"><%=invoiceMap.get("address") %></span></td>
													</tr>
													<tr>
														<td><label>CITY :</label>&nbsp;<span id="bCity"><%=invoiceMap.get("city") %></span></td>
													</tr>
													<tr>
														<td><label>STATE :</label>&nbsp;<span id="bState"><%=invoiceMap.get("state") %></span></td>
													</tr>
													<tr>
														<td><label>COUNTRY :</label>&nbsp;<span id="bPin"><%=invoiceMap.get("country") %></span></td>
													</tr>
													<tr>
														<td><label>PIN :</label>&nbsp;<span id="bPin"><%=invoiceMap.get("pin") %></span></td>
													</tr>
													<tr>
														<td><label>MOBILE :</label>&nbsp;<span id="sPhone">8801226663</span></td>
													</tr>
												</table>
											</td>
											</tr>
										<tr>
											
										</tr>
									</table>       
								  <table class="table table-bordered">
								    <thead>
								      <tr style="background-color: rgb(117, 165, 114); color: white;">
								        <th style="width: 15%;">Sr. No.</th>
								        <th style="width: 15%;">Item Code</th>
								        <th style="width: 25%;">Item Name</th>
								        <th style="width: 15%;">Quantity</th>
								        <th style="width: 15%;">Rate</th>
								        <th style="width: 15%;">Amount</th>
								      </tr>
								    </thead>
								    <tbody>
								    <%
								    	for(int i=1; i <= (int)invoiceMap.get("count"); i++){
								    		Invoice_BO bo = (Invoice_BO)invoiceMap.get("item"+i);
								    		%>
								    			<tr>
								        			<td><%=i %></td>
								        			<td><%=bo.getItemCode() %></td>
								        			<td><%=bo.getItemName() %></td>
								        			<td><%=bo.getQuantity() %></td>
								        			<td><%=bo.getItemRate() %></td>
								        			<td style="text-align: right;"><%=bo.getAmount() %></td>
								      			</tr>
								    		<%
								    	}
								    %>
								    	<tr>
								    		<td style="text-align: right;" colspan="5">SUB-TOTAL &nbsp;&nbsp; <br> SHIPPING PRICE &nbsp;&nbsp;</td>
								    		<td style="text-align: right;"><%=invoiceMap.get("subTotal") %> <br> <%=invoiceMap.get("shippingPrice") %></td>
								    	</tr>
								    	<tr style="background-color: rgba(255, 7, 7, 0.05);">
								    		<td style="text-align: right;" colspan="5">TOTAL PAID FOR PRODUCTS MENTIONED ABOVE &nbsp;&nbsp;</td>
								    		<td style="text-align:right;"><%=invoiceMap.get("total") %></td>
								    	</tr>
								    	<tr style="background-color: rgba(255, 7, 7, 0.15);">
								    		<td style="text-align: right;" colspan="2">TOTAL AMOUNT IN WORD : &nbsp;&nbsp;</td>
								    		<td style="text-align:left;" colspan="4"><%=invoiceMap.get("amtInWord") %></td>
								    	</tr>
								    	<tr>
								    		<td style="background-color: rgba(255, 7, 7, 0.45); text-align: center;" colspan="6">THIS IS A COMPUTERD GENERATED INVOICE AND DOES NOT REQUIERE SIGNATURE</td>
								    	</tr>
								    </tbody>
								  </table>

</body>
</html>