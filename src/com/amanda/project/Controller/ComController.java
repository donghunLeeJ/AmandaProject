package com.amanda.project.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DTO.MemberDTO;


@WebServlet("*.com")
public class ComController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ui = request.getRequestURI();
		String cp = request.getContextPath();
		String command = ui.substring(cp.length());
		response.setContentType("text/html;charset=UTF-8");
	    PrintWriter pw = response.getWriter();
		
		//ajax를 받아 1초마다 실시간으로 페이지에 포인트(시간)을 출력시켜주는 컨트롤러
	    if(command.equals("/usertime.com")) {
	    	
	    	MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
		 	String id=dto.getId();
		 	
	    	int userpoint = MemberController.pointmap.get(id);   	
	    	pw.print(userpoint); //로그인한 유저가 가진 남은 포인트를 출력시킨다.   	
	    	   	        	
	    }	    	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
