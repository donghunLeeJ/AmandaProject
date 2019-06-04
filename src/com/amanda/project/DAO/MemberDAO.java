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

import com.amanda.project.DTO.MemberDTO;


public class MemberDAO {
	DataSource ds;
	public MemberDAO() {
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
	/** 디비 값을 확인하고 로그인을 진행하는 메서드*/
	public int checklogin(String id,String pw)throws Exception{
		String sql="select * from Member where id= ? and pw= ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, id );
			pstat.setString(2, pw);
			ResultSet rs=pstat.executeQuery();
			if(rs.next()) {
				return 1;
			}else {
				return -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	/** session에 값을 저장하기 위한 메서드*/
	public MemberDTO select_user(String id){
		String sql="select * from Member where id= ?";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				){		
			pstat.setString(1, id );
			ResultSet rs=pstat.executeQuery();
			rs.next();
			MemberDTO dto = new MemberDTO();
			dto.setMem_seq(rs.getInt(1));
			dto.setId(rs.getString(2));
			dto.setPw(rs.getString(3));
			dto.setName(rs.getString(4));
			dto.setBirth(rs.getString(5));
			dto.setEmail(rs.getString(6));
			dto.setPhone(rs.getString(7));
			dto.setPoint(rs.getInt(8));
			dto.setPostcode(rs.getString(9));
			dto.setAddress1(rs.getString(10));
			dto.setAddress2(rs.getString(11));
			
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}



	/** 회원정보수정 메서드*/
	public int updateMember(MemberDTO dto) throws Exception {

		String sql="update Member set pw=?,email=?,phone=?  where id=? ";
		Connection con=ds.getConnection();
		PreparedStatement pstat=con.prepareStatement(sql);
		pstat.setString(1,this.testSHA256(dto.getPw()));
		pstat.setString(2,dto.getEmail());
		pstat.setString(3, dto.getPhone());
		pstat.setString(4, dto.getId());

		int result=pstat.executeUpdate();
		con.commit();
		con.close();
		return result;
	}


	

	/** 회원가입 메서드*/

	public int joinmember(MemberDTO dto) throws Exception{
		String sql = "insert into member values(mem_seq.nextval,?,?,?,?,?,?,default,?,?,?)";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getBirth());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getPostcode());
			pstat.setString(8, dto.getAddress1());
			pstat.setString(9, dto.getAddress2());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	/** 회원탈퇴 메서드*/
	public int delete(String id, String pw) {
		String sql = "delete from member where id = ? and pw = ?";

		try(
				Connection con = this.db_connect();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, id);
			pstat.setString(2, this.testSHA256(pw));
			
			int result = pstat.executeUpdate();
			System.out.println(result);
			
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	
	/** 아이디,이메일값으로 회원가입여부 확인*/
	public int existMember(String id, String email) {
		String sql = "select * from member where id=? and email=?";
		
		try(
				Connection con = this.db_connect();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			MemberDTO dto = new MemberDTO(id,email);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getEmail());
			
			ResultSet rs=pstat.executeQuery();
			System.out.println(rs.next());
			if(rs.next()) {
				return 1;
			}else {
				return 0;
			}
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
	}
	
	
	
	
	public int findid(String name,String birth, String email) {
		String sql = "select id from member where name=? and birth=? and email=?";
		
		try(
				Connection con = this.db_connect();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
			pstat.setString(1,name);
			pstat.setString(2, birth);
			pstat.setString(3, email);
			
			ResultSet rs=pstat.executeQuery();
			
			
			if(rs.next()) {
				return 1;
			}else {
				return 0;
			}
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
	}
	
	

	public int PointUpdate(int point , String id) throws Exception{
		String sql = "update member set point=? where id=?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				
				){
			
			pstat.setInt(1, point);
			pstat.setString(2, id);
		
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	

}


