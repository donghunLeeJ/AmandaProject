package com.amanda.project.DAO;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import com.amanda.project.DTO.ThreevisitDTO;
import com.amanda.project.DTO.VisitDTO;
//3시간마다 방문자수 select하기 
public class SeltodayvisitDAO  {
		private Connection connect() throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user="kh";
			String pw="kh";

			Connection con = DriverManager.getConnection(url, user, pw);
			return con;
		}
	
	
	public List<ThreevisitDTO> allvisit(){
		String sql="select * from (select * from todayvisit order by hour desc) where rownum<4 order by hour  ";
		try (	Connection con=this.connect();
				PreparedStatement pstat=con.prepareStatement(sql);
				){		
			ResultSet rs=pstat.executeQuery();
			List<ThreevisitDTO> arr=new ArrayList(); 
		while(rs.next()) {
				
			Timestamp hour=rs.getTimestamp(1);
			int vcount=rs.getInt(2);					
			ThreevisitDTO dto = new ThreevisitDTO(hour,vcount);
			arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
