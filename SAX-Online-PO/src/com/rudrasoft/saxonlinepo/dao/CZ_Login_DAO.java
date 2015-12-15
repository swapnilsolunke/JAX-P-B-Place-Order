/**
 * 
 */
package com.rudrasoft.saxonlinepo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rudrasoft.saxonlinepo.bo.CZ_Registration_BO;
import com.rudrasoft.saxonlinepo.util.DBconnection;

/**
 * @author Rudra
 *
 */
public class CZ_Login_DAO {
	private static Connection cz_con;
	private static PreparedStatement cz_pre_stmt;
	
	static{
		cz_con =DBconnection.connect();
	}
	public static CZ_Registration_BO validate(String email, String pwd) {
		CZ_Registration_BO bo = new CZ_Registration_BO();
		bo.setSuccess(false);
		String sql = "SELECT count(*) as count, pk_user_id, fld_fname, fld_lname, fld_email  FROM tbl_users WHERE fld_email = ? AND fld_password = ?";
		try {
			cz_pre_stmt = cz_con.prepareStatement(sql);
			cz_pre_stmt.setString(1, email);
			cz_pre_stmt.setString(2, pwd);
			ResultSet rs = cz_pre_stmt.executeQuery();
			while(rs.next()){
				int count = rs.getInt("count");
				System.out.println("User Count is = "+count);
				if(count > 0){
					bo.setFname(rs.getString("fld_fname"));
					bo.setLname(rs.getString("fld_lname"));
					bo.setEmail(rs.getString("fld_email"));
					bo.setUserId(rs.getString("pk_user_id"));
					bo.setSuccess(true);
				}
			}
			//return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return bo;
		}
		return bo;
	}
	
}
