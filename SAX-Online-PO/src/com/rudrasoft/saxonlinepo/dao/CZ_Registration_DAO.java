/**
 * 
 */
package com.rudrasoft.saxonlinepo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rudrasoft.saxonlinepo.bo.CZ_Registration_BO;

import com.rudrasoft.saxonlinepo.util.DBconnection;

/**
 * @author Rudra
 *
 */
public class CZ_Registration_DAO {

	private static Connection cz_con;
	private static PreparedStatement cz_pre_stmt;
	
	static{
		cz_con =DBconnection.connect();
	}
	public static boolean save(CZ_Registration_BO bo) {
		String sql = "INSERT INTO tbl_users (fld_fname, fld_lname, fld_email, fld_password) values(?,?,?,?)";
		try {
			cz_pre_stmt = cz_con.prepareStatement(sql);
			cz_pre_stmt.setString(1, bo.getFname());
			cz_pre_stmt.setString(2, bo.getLname());
			cz_pre_stmt.setString(3, bo.getEmail());
			cz_pre_stmt.setString(4, bo.getPwd());
			cz_pre_stmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}

}
