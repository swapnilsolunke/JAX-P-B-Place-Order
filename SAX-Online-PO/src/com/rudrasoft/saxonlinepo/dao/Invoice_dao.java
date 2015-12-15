/**
 * 
 */
package com.rudrasoft.saxonlinepo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.rudrasoft.saxonlinepo.bo.Invoice_BO;
import com.rudrasoft.saxonlinepo.handler.SAX_XMLPOReader;
import com.rudrasoft.saxonlinepo.util.DBconnection;
import com.rudrasoft.saxonlinepo.util.NumberToLetters;

/**
 * @author Rudra
 *
 */
public class Invoice_dao {

	private static Connection cz_con;
	private static PreparedStatement cz_pre_stmt;
	
	static{
		cz_con =DBconnection.connect();
	}
	public static boolean save(String userID) {
		String sql = "INSERT INTO tbl_invoice (fk_user_id) values(?)";
		try {
			cz_pre_stmt = cz_con.prepareStatement(sql);
			cz_pre_stmt.setString(1, userID);
			
			cz_pre_stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public static int getInvoiceId(){
		String sql = "SELECT max(pk_invoice_id) as invoice_id FROM tbl_invoice";
		try {
			cz_pre_stmt = cz_con.prepareStatement(sql);
			ResultSet rs = cz_pre_stmt.executeQuery();
			while(rs.next()){
				int invoice_id = rs.getInt("invoice_id");
				return invoice_id;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	
	public static HashMap<String, Object> getItemInfo(SAX_XMLPOReader handler){
		String sql = "SELECT fld_item_name, fld_item_rate FROM tbl_item_stock_info WHERE pk_item_id = ?";
		HashMap<String, Object> invoiceMap = new HashMap<String, Object>();
		ArrayList<String> icList = handler.getIcList();
		ArrayList<String> qList = handler.getqList();
		invoiceMap.put("invoice_id", getInvoiceId());
		
		long subTotal = 0;
		int shippingPrice = 100;
		for(int i = 0; i<icList.size(); i++){
			try {
				cz_pre_stmt = cz_con.prepareStatement(sql);
				cz_pre_stmt.setInt(1, Integer.parseInt(icList.get(i)));
				ResultSet rs = cz_pre_stmt.executeQuery();
				while(rs.next()){
					double iRate = rs.getDouble("fld_item_rate");
					String iName = rs.getString("fld_item_name");
					
					Invoice_BO bo = new Invoice_BO();
					bo.setItemCode(icList.get(i));
					bo.setItemName(iName);
					bo.setItemRate(iRate);
					double amount = iRate * Integer.parseInt(qList.get(i));
					subTotal += amount;
					bo.setAmount(amount);
					bo.setQuantity(qList.get(i));
					invoiceMap.put("item"+(i+1), bo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		invoiceMap.put("subTotal", subTotal);
		invoiceMap.put("shippingPrice", shippingPrice);
		long total = subTotal + shippingPrice;
		invoiceMap.put("total", total);
		try {
			String amnt = NumberToLetters.getNumberInWord((int)total);
			invoiceMap.put("amtInWord", amnt.toUpperCase());
		} catch (Exception e) {
			invoiceMap.put("amtInWord", "");
			e.printStackTrace();
		}
		invoiceMap.put("address", handler.getAddLine1()+" "+handler.getAddLine2());
		invoiceMap.put("city", handler.getCity());
		invoiceMap.put("state", handler.getState());
		invoiceMap.put("country", handler.getCountry());
		invoiceMap.put("pin", handler.getZipCode());
		invoiceMap.put("count", qList.size());
		System.out.println(" invoiceMap() in = "+invoiceMap);
		
		return invoiceMap;
	}
	
}
