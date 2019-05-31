package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.amanda.project.DTO.ComDTO;

public class ChartDAO {
	DataSource ds;
	public ChartDAO() {
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

	public int daily_sell(int day){
		String sql="select sum(pay_ammount) from point_charge where time between trunc(sysdate-?) and sysdate-?";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setInt(1, day );
			pstat.setInt(2, day );
			ResultSet rs=pstat.executeQuery();
			rs.next();
			
			int result = rs.getInt(1);			
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
