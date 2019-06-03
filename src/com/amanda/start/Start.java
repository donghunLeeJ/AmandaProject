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

import com.amanda.project.Controller.MemberController;
import com.amanda.project.DAO.ComDAO;


import com.amanda.project.DAO.VisitDAO;

import com.amanda.project.DTO.ComDTO;
@WebServlet("/Start")
public class Start extends HttpServlet {
	
	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		VisitDAO vdao = new VisitDAO();
		vdao.insertVisit();
		request.getServletContext().setAttribute("count", vdao.totalVisit());
		
	
		
	//	System.out.println(arr.get(1).getIp());
	      ComDAO dao = new ComDAO();
	     List<ComDTO> arr = dao.selectSeat_all();
	   //   System.out.println(arr.get(1).getIp());
	         
	     
	  request.getServletContext().setAttribute("UserSeatNum", MemberController.useridseat);
	    request.setAttribute("seatUsed", dao.usedSeat());
	     request.getServletContext().setAttribute("seat", arr);
	      request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		
	

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}


}
