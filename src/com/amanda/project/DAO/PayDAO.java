package com.amanda.project.DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PayDAO {
	DataSource ds;
	public PayDAO() {
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


	public static String testSHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}

	public int update_point(String id,int point){
		String sql="update member set point = point + ? where id = ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setInt(1, point);
			pstat.setString(2, id);
			
			int result = pstat.executeUpdate();

			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int pay_table_insert (String id,int point){
		String sql="insert into point_charge values(point_seq.nextval ,'결제권', ? , sysdate , ?) ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setInt(1, point);
			pstat.setString(2, id);
			
			int result = pstat.executeUpdate();

			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int menu_pay_table_insert (String id,int point,String menu){

	      String sql="insert into point_charge values(point_seq.nextval,?,?,sysdate,?) ";
	      try (   Connection con=ds.getConnection();
	            PreparedStatement pstat=con.prepareStatement(sql);

	            )
	      {
	         pstat.setString(1, menu);
	         pstat.setInt(2, point);
	         pstat.setString(3, id);
	         
	         int result = pstat.executeUpdate();

	         return result;
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
	   }

}
