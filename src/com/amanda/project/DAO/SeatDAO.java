package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.amanda.project.DTO.SeatDTO;

public class SeatDAO {

	DataSource ds;
	public SeatDAO() {
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
	
	
	
	//상황에 따라 comUseCheck(값은 0,1만 들어갈 수 있음)의 값을 바꾸는 메소드
	//결제가 끝나서 자리를 잡는순간 comUseCheck의 값을 1로 바꾼다.
	//사용자가 컴퓨터를 끄거나 로그아웃을 하는 순간 comUseCheck의 값을 다시 0으로 바꾼다.
	//(일단 우리반 컴퓨터의 ip주소를 모두 알고 있으므로 받아온 ip주소를 토대로 comUseCheck값만 변경시키면 됨)
	//아직은 그 값이 무엇인지 확정짓지 않았으므로 일단은 결제가 끝나는 순간 해당 컴퓨터의 ip주소를 받았다고 가정하자
	public int SeatUpdate(String ipaddr) throws Exception{
		
		String selectSql = "select comUseCheck from pcComputer where comIp=?";
		String UpdateSql = "update pcComputer set comUseCheck=? where comIp=?";
		
		try(		
			Connection con = ds.getConnection();
			PreparedStatement spstat = con.prepareStatement(selectSql);	
			PreparedStatement upstat = con.prepareStatement(UpdateSql);){
			
			spstat.setString(1, ipaddr);
			
			try(ResultSet rs = spstat.executeQuery();){
				
				String comUseCheck = null;
				if(rs.next()){comUseCheck = rs.getString("comUseCheck");}
		        System.out.println(comUseCheck);
				
				if(comUseCheck.equals("0")){//만일 사용자가 컴퓨터를 켰을 경우(또는 결제?) 값을 1로 바꾼다.
					
					System.out.println("만일 사용자가 컴퓨터를 켰을 경우 값을 1로 바꾼다.");
					upstat.setString(1, "1");                
					upstat.setString(2, ipaddr);
						
					int result = upstat.executeUpdate();
					
					con.commit();
					return result;	
								
				}else{//만일 사용자가 컴퓨터를 껏거나 (또는 로그아웃?) 값을 다시 0으로 바꾼다.
					
					System.out.println("만일 사용자가 컴퓨터를 껏다면 값을 다시 0으로 바꾼다.");
					upstat.setString(1, "0");                
					upstat.setString(2, ipaddr);
							
					int result = upstat.executeUpdate();
					
					con.commit();
					return result;		
					
				}						
			}	
		}			
	}
	
	

	//데이터베이스 테이블에서 현재 자리번호랑 컴퓨터가 사용중인지 아닌지를 골라내는 메소드
	public List<SeatDTO> SeatSelectAll() throws Exception{
			
	String sql = "select * from pcComputer";	
	
		try(
				
			Connection con = ds.getConnection();	
			PreparedStatement pstat = con.prepareStatement(sql);	
			ResultSet rs = pstat.executeQuery();	
				
				){
			
			List<SeatDTO> SeatList = new ArrayList<>();
			
			while(rs.next()){
				
				int seatNumber = rs.getInt("seatnumber");
				String comIp = rs.getString("comip");	
				String comUseCheck = rs.getString("comusecheck");			
				SeatList.add(new SeatDTO(seatNumber, comIp, comUseCheck));			
			}
				
			return SeatList;			
		}			
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

