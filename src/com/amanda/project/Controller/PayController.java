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
			pdao.pay_table_insert(id, price);
			if(price == 1000) {
				price = 3600;
			}else if(price == 2000) {
				price = 7200;
			}else if(price == 3000) {
				price = 10800;
			}else if(price == 5000) {
				price = 19800;
			}else if(price == 10000) {
				price = 39600;
			}else if(price == 20000) {
				price = 82800;
			}
			pdao.update_point(id, price);
			
			request.getSession().setAttribute("user", dao.select_user(id));
					
			if(!(MemberController.pointmap.get(id) == null)){//만일 사용자가 pc방에서 로그인했을 경우에만 작동하는 코드	
			                                                
			int userPoint = MemberController.pointmap.get(id); //현재 로그인중인 사용자의 포인트값을 꺼낸다			
			MemberController.pointmap.put(id, userPoint + price);//그 포인트값에 결제로 추가된 포인트를 더해준다.		
			
			}
						
			request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		
		}else if(cmd.equals("menu.pay")) {
			String id=request.getParameter("id");

	         String name = request.getParameter("name");
	         int price=Integer.parseInt(request.getParameter("amount"));
	         System.out.println("pay");
	         System.out.println(id);
	         System.out.println(name);
	         System.out.println(price);
	         pdao.menu_pay_table_insert(id, price, name);
	         request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		

		}

		
	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
