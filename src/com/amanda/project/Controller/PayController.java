package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DAO.PayDAO;


@WebServlet("*.pay")
public class PayController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");
		MemberDAO dao=new MemberDAO();
		ComDAO cDao = new ComDAO();
		PayDAO pdao = new PayDAO();
		switch(cmd) {
		
		case "time.pay" :
			String id = request.getParameter("id");
			int point=Integer.parseInt(request.getParameter("amount"));
			System.out.println(pdao.update_point(id, point));
			request.getSession().setAttribute("user", dao.select_user(id));
			request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
