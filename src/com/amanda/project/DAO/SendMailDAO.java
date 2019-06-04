package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.amanda.project.DTO.MemberDTO;
import com.amanda.project.DTO.SendMailDTO;

public class SendMailDAO extends Authenticator{
	
	DataSource ds;
	public SendMailDAO() {
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
	
	SendMailDTO dto = new SendMailDTO();
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("acesang","109247poooo");
	}
	
	public int randomnumber() {
		
		int rannum = (int)(Math.random()*899999)+100000;
		return rannum;
		
	}
	
	public String MemberId(String name,String birth,String email ) {
		MemberDAO dao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		String sql = "select id from member where name=? and birth=? and email=?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, name);
			pstat.setString(2, birth);
			pstat.setString(3, email);
			
			ResultSet result = pstat.executeQuery();
			
			if(result.next()) {
				String id = result.getString("id");
				
				return id;
			}else {
				return null;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	
	
	
	
	public int pwcheck_insert(SendMailDTO dto) {
		String sql = "insert into subinfo values(?,?,?,default)";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getPwcode());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int pwcheck_delete(String id,String email) {
		String sql = "delete from subinfo where id = ? and email = ?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, id);
				pstat.setString(2, email);
				
				int result = pstat.executeUpdate();
				con.commit();
				return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int renew_pw(String id,String pw) {
		System.out.println(id + " : " + pw);
		String sql = "update member set pw=? where id=?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, pw);
				pstat.setString(2, id);
				
				int result=pstat.executeUpdate();
				con.commit();
				return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public String show_pwcode(String id) {
		String sql = "select pwcode from subinfo where id=?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {
				String pwcode = rs.getString("PWCODE");
				return pwcode;
			}else {
				return "";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

