package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.amanda.project.DTO.MenuDTO;

public class MenuDAO {
	DataSource ds;
	public MenuDAO() {
		Context ctx;
		try {
			ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			this.ds = (DataSource)env.lookup("jdbc");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public Connection db_connect() throws Exception {
		return ds.getConnection();
	}
	
	public int insertMenu(String id,String name, int price) {
		String sql = "insert into menu values(menu_seq.nextval,?,?,?,default)";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,id);
			pstat.setString(2, name );
			pstat.setInt(3, price );
			int result = pstat.executeUpdate();
			
			MenuDTO menuDTO = new MenuDTO();
			pstat.setString(1, menuDTO.getId());
			pstat.setString(2, menuDTO.getName());
			pstat.setString(3, menuDTO.getPrice());
			con.commit();
			return result;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
		
	}
}
