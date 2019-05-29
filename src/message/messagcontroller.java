package message;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class messagcontroller
 */
@WebServlet("/messagcontroller")
public class messagcontroller extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String who=request.getParameter("who");
		String text=request.getParameter("content");
		System.out.println(who+":"+text);
		request.setAttribute("who", who);
		request.setAttribute("text",text);
		RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/hello.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
