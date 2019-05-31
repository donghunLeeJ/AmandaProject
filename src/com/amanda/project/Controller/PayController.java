package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DAO.MenuDAO;
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

		MenuDAO menuDAO= new MenuDAO();
		

		
		if(cmd.equals("time.pay")) {
			String id = request.getParameter("id");
			int price=Integer.parseInt(request.getParameter("amount"));
			String name = request.getParameter("name");
			System.out.println(pdao.update_point(id, price));
			menuDAO.insertMenu(id, name, price);
			request.getSession().setAttribute("user", dao.select_user(id));
			request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		
		}else if(cmd.equals("menu.pay")) {
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			int price=Integer.parseInt(request.getParameter("amount"));
			System.out.println("pay");
			System.out.println(id);
			System.out.println(name);
			System.out.println(price);
			menuDAO.insertMenu(id,name,price);
			request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		
		}

		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
