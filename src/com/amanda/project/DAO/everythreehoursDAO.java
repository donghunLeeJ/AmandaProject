package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.TimerTask;

import com.amanda.project.DTO.ThreevisitDTO;
import com.amanda.project.DTO.VisitDTO;
import com.amanda.start.Start;
//3시간마다 thread실행됨
public class everythreehoursDAO extends TimerTask {
	public void run() {
		try {
			int result=Vtime(new ThreevisitDTO(Start.count));
		System.out.println("ok");
		System.out.println("세시간마다dao실행"+result);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
		private Connection connect() throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user="kh";
			String pw="kh";

			Connection con = DriverManager.getConnection(url, user, pw);
			return con;
		}

		public int Vtime(ThreevisitDTO  dto) throws Exception{				
			String sql = "insert into todayVisit values(default,?)";
			try( Connection con = this.connect();	
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setInt(1, dto.getVcount());
					int result = pstat.executeUpdate();
				con.commit();
				return result;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
}
