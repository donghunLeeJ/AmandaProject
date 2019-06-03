package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.MemberDAO;

@WebServlet("*.manage")
public class MemberManageController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("/member.manage")) {
			MemberDAO dao = new MemberDAO();
			
				request.setAttribute("result", dao.show_member());
				request.getRequestDispatcher("WEB-INF/membermanage.jsp").forward(request, response);
		}
		
		else if(command.equals("/toblack.manage")){
			
			int num = Integer.parseInt(request.getParameter("memnum"));
			String name = request.getParameter("memname");
			String id = request.getParameter("memid");
			String phone = request.getParameter("memphone");
			int usehour = Integer.parseInt(request.getParameter("memusehour"));
			
			System.out.println(num + " : " + name + " : " + id + " : " + phone + " : " + usehour);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
