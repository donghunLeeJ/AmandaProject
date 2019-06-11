package com.amanda.project.DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	public String checklogin(String id)throws Exception{
		String sql="select pw from Member where id= ?";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, id );
			ResultSet rs=pstat.executeQuery();
			rs.next();
			String result = rs.getString(1);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return "아이디 없음";
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

		String sql="update Member set pw=?,email=?,phone=?,postcode=?,address1=?,address2=?  where id=? ";
		Connection con=ds.getConnection();
		PreparedStatement pstat=con.prepareStatement(sql);
		pstat.setString(1,this.testSHA256(dto.getPw()));
		pstat.setString(2,dto.getEmail());
		pstat.setString(3, dto.getPhone());
		pstat.setString(4, dto.getPostcode());
		pstat.setString(5, dto.getAddress1());
		pstat.setString(6, dto.getAddress2());
		pstat.setString(7, dto.getId());
		
		int result=pstat.executeUpdate();
		con.commit();
		con.close();
		return result;
	}


	

	/** 회원가입 메서드*/

	public int joinmember(MemberDTO dto){
		String sql = "insert into member values(mem_seq.nextval,?,?,?,?,?,?,default,?,?,?,default,default,default)";
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
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
	public int usehourUpdate(int point , String id) throws Exception{
		String sql = "update member set usehour=usehour+? where id=?";
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
	
	public List<MemberDTO> show_member() {
		List<MemberDTO> list = new ArrayList<>();
		String sql = "select mem_seq,id,name,birth,email,phone,point,address1,address2,usehour from member where blackcheck='n' and id not in('admin')";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				int num = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String birth = rs.getString(4);
				String email = rs.getString(5);
				String phone = rs.getString(6);
				int point = rs.getInt(7);
				String address1 = rs.getString(8);
				String address2 = rs.getString(9);
				int usehour = rs.getInt(10);
				
				MemberDTO dto = new MemberDTO(num,id,name,birth,email,phone,point,address1,address2,usehour);
				list.add(dto);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public MemberDTO show_memberInfo(int paramNum) {
		String sql = "select mem_seq,id,name,birth,email,phone,point,address1,address2,usehour from member where mem_seq=?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				
				){
			pstat.setInt(1, paramNum);
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {
				int num = rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String birth = rs.getString(4);
				String email = rs.getString(5);
				String phone = rs.getString(6);
				int point = rs.getInt(7);
				String address1 = rs.getString(8);
				String address2 = rs.getString(9);
				int usehour = rs.getInt(10);				
				MemberDTO dto = new MemberDTO(num,id,name,birth,email,phone,point,address1,address2,usehour);
				return dto;
			}
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int addblacklist(String reason,int num) {
		String sql = "update member set blackcheck='y', blackreason=? where mem_seq=?";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, reason);
				pstat.setInt(2, num);
				
				int result = pstat.executeUpdate();
				con.commit();
				return result;
				
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public List<MemberDTO> show_blacklist() {
		List<MemberDTO> list = new ArrayList<>();
		String sql = "select mem_seq,name,id,blackreason from member where blackcheck='y'";
		try(
				Connection con = ds.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				int num = rs.getInt(1);
				String name = rs.getString(2);
				String id = rs.getString(3);
				String reason = rs.getString(4);
				MemberDTO dto = new MemberDTO(num,name,id,reason);
				list.add(dto);
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int deleteblacklist(int num) {
	      String sql = "update member set blackcheck='n', blackreason=('no reason') where mem_seq=?";
	      try(
	            Connection con = ds.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ){
	            pstat.setInt(1, num);
	            
	            int result = pstat.executeUpdate();
	            con.commit();
	            return result;
	            
	      }catch(Exception e) {
	         e.printStackTrace();
	         return 0;
	      }
	   }
	public int checkCode(String id) {
	      String sql = "select * from subinfo where id = ? ";
	      try(
	            Connection con = ds.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ){
	          pstat.setString(1, id); 
	    	  ResultSet rs = pstat.executeQuery();
	           
	            if(rs.next()) {
	            	return 1;
	            }else {
	            	return 0;
	            }
	      }catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }
	   }
	public String checkBlack(String id) {
	      String sql = "select blackcheck from member where id = ? ";
	      try(
	            Connection con = ds.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);
	            ){
	          pstat.setString(1, id); 
	    	  ResultSet rs = pstat.executeQuery();
	           rs.next();
	           return rs.getString(1);
	          
	      }catch(Exception e) {
	         e.printStackTrace();
	         return null;
	      }
	   }

}


