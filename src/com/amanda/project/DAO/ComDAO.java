package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.amanda.project.DTO.ComDTO;

public class ComDAO {
	DataSource ds;
	public ComDAO() {
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

	public ComDTO seatNum_get(String id){
		String sql="select * from pcComputer where comip = ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, id );
			ResultSet rs=pstat.executeQuery();
			rs.next();
			
			ComDTO dto = new ComDTO(rs.getString(1),rs.getString(2),rs.getString(3));
			
			
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<ComDTO> selectSeat_all(){
		String sql="select * from pcComputer ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			
			List<ComDTO> arr = new ArrayList();
			ResultSet rs=pstat.executeQuery();
			while(rs.next()) {
				ComDTO dto = new ComDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int selectSeat(){
		String sql="select count(*) from pcComputer where comUseCheck = 1 ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			
			List<ComDTO> arr = new ArrayList();
			ResultSet rs=pstat.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public int seatOn(String ip){
		String sql="update pcComputer set comUseCheck = 1 where comIp = ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, ip );
			int rs=pstat.executeUpdate();
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int seatOff(String ip){
		String sql="update pcComputer set comUseCheck = 0 where comIp = ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, ip );
			int rs=pstat.executeUpdate();
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int setId(String id , String ip){
		String sql="update pcComputer set user_id = ? where comIp = ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, id );
			pstat.setString(2, ip );
			int rs=pstat.executeUpdate();
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int resetId(String ip){
		String sql="update pcComputer set user_id = '' where comIp = ? ";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setString(1, ip );
			int rs=pstat.executeUpdate();
			return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}public int usedSeat(){
		String sql="select count(comusecheck) from pccomputer where COMUSECHECK = '1'";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			ResultSet rs = pstat.executeQuery();
			rs.next();
			int result =  rs.getInt(1);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//만일 사용자가 pc방 컴퓨터가 아닌 다른 기기로 로그인을 했는지 아닌지를 체크하는 메소드임
		public int UserSeatIpCheck(String loginIp){

			String sql = "select comip from pccomputer";

			try(
					Connection con=ds.getConnection();
					PreparedStatement pstat=con.prepareStatement(sql);
					ResultSet rs = pstat.executeQuery();
					
					){

				while(rs.next()){
					
					//만일 pc방컴퓨터로 로그인했을 경우 리턴값 0을 반환시킨다.
					if(loginIp.equals(rs.getString("comip"))){return 0;}	
					
				}
								
			}catch (Exception e){e.printStackTrace();}
			
		  //pc방컴퓨터가 아닌 다른 기기로 로그인했을 경우 리턴값 1을 반환시킨다.
			return 1;			
		}
		
}
