package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.TimerTask;

import com.amanda.project.DTO.MemberDTO;
import com.amanda.project.DTO.VisitDTO;
import com.amanda.start.Start;
//최근 5일 방문자 수 insert하기 
public class VisitDAO extends TimerTask{
	public void run() {
		try {
			int result=Vtime(new VisitDTO(Start.count));
		System.out.println("ok");
		Start.count=0;
		System.out.println("dao실행"+result);
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

		public int Vtime(VisitDTO dto) throws Exception{				
			String sql = "insert into Visit values(default,?)";
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
