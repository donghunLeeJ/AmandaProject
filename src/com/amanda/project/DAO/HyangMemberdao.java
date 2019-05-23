package com.amanda.project.DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.amanda.project.DTO.MemberDTO;
import com.amanda.project.DTO.MemberDTO2;

public class HyangMemberdao {
	private Connection getConnection()throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@192.168.60.33:1521:xe";
		String user="kh";
		String pw="kh";
		return DriverManager.getConnection(url,user,pw);
	}
	
	
public int updateMember(MemberDTO2 dto) throws Exception {
	String sql="update Members set pw=?,name=?,phone=?,email=?,zipcode=?,address1=?,address2=?  where id=? ";
	Connection con=this.getConnection();
	PreparedStatement pstat=con.prepareStatement(sql);
	pstat.setString(1,dto.getPw());
	pstat.setString(2,dto.getName());
	pstat.setString(3, dto.getBirth());
	pstat.setString(4, dto.getEmail());
	pstat.setString(5, dto.getPhone());
	pstat.setString(6, dto.getPhone());
	pstat.setString(7, dto.getId());	
	int result=pstat.executeUpdate();
	con.commit();
	con.close();
	return result;
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

}
