package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.MemberDAO;
<<<<<<< HEAD
import com.amanda.project.DTO.MemberDTO;

=======
>>>>>>> f7dd6f183ad3758b555c0449b7452bb793303330



@WebServlet("*.member")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		response.setCharacterEncoding("utf-8");
<<<<<<< HEAD
		MemberDAO dao=new MemberDAO();
=======
		MemberDAO dao = new MemberDAO();
>>>>>>> f7dd6f183ad3758b555c0449b7452bb793303330
		switch(cmd) {
		
		case "loginProc.member" :
			//로그인 화면에서 아이디 비밀번호 값을 받아 db와 비교하여 로그인을 실행시켜주는 controller
			String loginid=request.getParameter("loginid");
			String loginpw=request.getParameter("loginpw");
			System.out.println(loginid+loginpw);
			try {
				boolean login = dao.checklogin(loginid, dao.testSHA256(loginpw));
				if(login==true) {
					System.out.println(login);
					request.getSession().setAttribute("id", loginid);
					request.getSession().setAttribute("pw", loginpw);
					request.setAttribute("login", login);
				RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/main.jsp");
				rd.forward(request, response);
				}
				else {
					System.out.println(login);
					request.setAttribute("login", login);
					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/main.jsp");
					rd.forward(request, response);
				}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
		
			
			break;
		case "idCheckByAjax.member" :
			//로그인 화면에서 아이디 비밀번호 값을 받아 db와 비교하여 로그인을 실행시켜주는 controller
					
			break;
		case "joinProc.member" :
			//회원 가입 컨트롤러
		
			break;
		case "deleteProc.member" :
			//회원 탈퇴 컨트롤러
		
			break;
			
		case "updateProc.member" :
			//회원 정보수정 컨트롤러
<<<<<<< HEAD
			String pw=request.getParameter("newpw");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			try {
				int result=dao.updateMember(new MemberDTO(pw,email,phone) );
				System.out.println(result);
			} catch (Exception e) {				
				e.printStackTrace();
			}	
=======
			String id = request.getParameter("newid");
			String name = request.getParameter("newname");
			String phone = request.getParameter("newpohone");
			String email = request.getParameter("newemail");
			String zipcode = request.getParameter("newpost");
			String address1 = request.getParameter("newaddress1");
			String address2 = request.getParameter("newaddress2");
			int result = 0;
>>>>>>> f7dd6f183ad3758b555c0449b7452bb793303330
//			if (request.getParameter("newpw") == null) {
//				String pw = (String) request.getSession().getAttribute("pw");
//				try {
//					result = dao.updateMember(new MemberDTO2(id, dao.testSHA256(pw), name, phone, email, zipcode, address1, address2));
//					request.setAttribute("result",result);
//					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/Member/myupdateProc.jsp");
//					rd.forward(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				System.out.print(pw);
//			} else {
//				String pw = request.getParameter("newpw");
//
//				try {
//					result = dao.updateMember(new MemberDTO2(id, dao.testSHA256(pw), name, phone, email, zipcode, address1, address2));
//					request.setAttribute("result",result);
//					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/Member/myupdateProc.jsp");
//					rd.forward(request, response);
//				} catch (Exception e) {
//					e.printStackTrace();
//
//				}
//				System.out.print(pw);
<<<<<<< HEAD
//			}	
=======
//			}		
>>>>>>> f7dd6f183ad3758b555c0449b7452bb793303330
			
			break;
		}
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
