package com.amanda.start;



import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DAO.VisitDAO;
import com.amanda.project.DAO.everythreehoursDAO;
import com.amanda.project.DTO.ComDTO;
@WebServlet("/Start")
public class Start extends HttpServlet {
	public static int count;
	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//--------------방문자 수 chart thread-----------------------------------------
		++count;
		request.getServletContext().setAttribute("count", count);
		if(count<2) {
			//하루 총 방문자 수 나타내기 
			Timer timer = new Timer();
			Calendar date = Calendar.getInstance();
			date.set(Calendar.HOUR_OF_DAY, 0);
			date.set(Calendar.MINUTE, 0);
			date.set(Calendar.SECOND, 0);
			date.set(Calendar.MILLISECOND, 0);
			timer.schedule(	new VisitDAO(), date.getTime(), 1000*60*60*24);
			}	
		
		 if(count<2) {
			//세시간 마다 방문자 수 나타내기 
		Timer timer1 = new Timer();
		Calendar date = Calendar.getInstance();
		date.set(Calendar.HOUR_OF_DAY, 0); //24시
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		date.set(Calendar.MILLISECOND, 0);
		timer1.schedule(new everythreehoursDAO(), date.getTime(), 1000*60*60*3); 
		}
		
		
		//--------------좌석dao----------------------------------------	
//		ComDAO dao = new ComDAO();
//		List<ComDTO> arr = dao.selectSeat_all();
			//System.out.println(arr.get(1).getIp());
		//request.getServletContext().setAttribute("seat", arr);
		//request.setAttribute("seatUsed", dao.usedSeat());
		
		
		//--------------ㅡmain 이동 ---------------------------------------	
		request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
