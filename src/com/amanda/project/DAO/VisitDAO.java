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
public class VisitDAO {
		private Connection connect() throws Exception{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user="kh";
			String pw="kh";

			Connection con = DriverManager.getConnection(url, user, pw);
			return con;
		}

		public int insertVisit(){				
			String sql = "insert into Visit values(default,1)";
			try( Connection con = this.connect();	
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				int result = pstat.executeUpdate();
				con.commit();
				return result;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
		public int totalVisit(){				
			String sql = "select count(vcount) from visit";
			try( Connection con = this.connect();	
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				ResultSet rs = pstat.executeQuery();
				rs.next();
				int result = rs.getInt(1);
				return result;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
		public int weeklyVisit(int num){				
			String sql = "select sum(vcount) from visit where today between trunc(sysdate-?) and sysdate-?";
			try( Connection con = this.connect();	
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setInt(1, num);
				pstat.setInt(2, num);
				ResultSet rs = pstat.executeQuery();
				
				rs.next();
				int result = rs.getInt(1);
				
				return result;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
		public int timelyVisit(int num){				
			String sql = "select sum(vcount) from visit where today between sysdate-(-?-1)/24 and sysdate-?/24";
			try( Connection con = this.connect();	
					PreparedStatement pstat = con.prepareStatement(sql);
					){
				pstat.setInt(1, num);
				pstat.setInt(2, num);
				ResultSet rs = pstat.executeQuery();
				
				rs.next();
				int result = rs.getInt(1);
				return result;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
	
}
