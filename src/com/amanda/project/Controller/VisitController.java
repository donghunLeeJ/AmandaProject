package com.amanda.project.Controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Timer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DAO.SelVisitDAO;
import com.amanda.project.DAO.SeltodayvisitDAO;


import com.amanda.project.DTO.ThreevisitDTO;
import com.amanda.project.DTO.VisitDTO;

@WebServlet("*.visit")
public class VisitController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");

		switch(cmd) {

		case "adminchart.visit" :
			SelVisitDAO dao=new SelVisitDAO(); //매일 총 방문자 수 
			SeltodayvisitDAO dao1=new SeltodayvisitDAO(); //3시간전,6시간 전 방문자 수 
			if(dao.allvisit()!=null  && dao1.allvisit()!=null )
			
			{	System.out.println("kk");
				List<VisitDTO> list=dao.allvisit();
				List<ThreevisitDTO> list1=dao1.allvisit();
				request.setAttribute("list",list);
				request.setAttribute("list1",list1);
				request.getRequestDispatcher("WEB-INF/adminmain.jsp").forward(request, response);//방문자수 select후 main 페이지로 이동  
			}
			break;
			
		
			
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
