package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import com.amanda.project.DTO.VisitDTO;
//최근 5일 방문자수 select
public class SelVisitDAO  {
		private Connection connect() throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user="kh";
			String pw="kh";

			Connection con = DriverManager.getConnection(url, user, pw);
			return con;
		}
	
	
	public List<VisitDTO> allvisit(){
		String sql="select * from (select * from visit order by today desc) where rownum<6 order by today";
		try (	Connection con=this.connect();
				PreparedStatement pstat=con.prepareStatement(sql);
				){		
			ResultSet rs=pstat.executeQuery();
			List<VisitDTO> arr=new ArrayList(); 
		while(rs.next()) {
				
			Timestamp today=rs.getTimestamp(1);
			int vcount=rs.getInt(2);					
			VisitDTO dto = new VisitDTO(today,vcount);
			arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
