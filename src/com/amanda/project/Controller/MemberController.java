package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DTO.MemberDTO;


@WebServlet("*.member")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");
		MemberDAO dao=new MemberDAO();
		
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
					request.getSession().setAttribute("user", dao.select_user(loginid));
					MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
					dto.getId();
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
		case "joinProc.member" :
			//회원 가입 컨트롤러
			try {
				MemberDAO jdao = new MemberDAO();
				String id = request.getParameter("joinmemberid");//회원가입시 받는 아이디
				String pw = request.getParameter("joinmemberpw");//회원가입시 받는 비밀번호
				String spw = jdao.testSHA256(pw);//비밀번호 sha처리
				String name = request.getParameter("joinmembername");//회원가입시 받는 이름
				String birth = request.getParameter("joinmemberbirth");//회원가입시 받는 생년월일
				String email = request.getParameter("joinmemberemail");//회원가입시 받는 email
				String phone = request.getParameter("joinmemberphone");//회원가입시 받는 폰번호
				MemberDTO dto = new MemberDTO(id,spw,name,birth,email,phone);
				
				System.out.println(id);
				
				
				int result = dao.joinmember(dto);
				if(result == 1) {
					request.setAttribute("result", result);
					request.getRequestDispatcher("WEB-INF/joincomp.jsp").forward(request, response);
				}else {
					response.sendRedirect("error.jsp");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		case "deleteProc.member" :
			//회원 탈퇴 컨트롤러
			//회원 탈퇴 컨트롤러
			String delid= request.getParameter("id");//삭제할 아이디
			String delpw= request.getParameter("pw");//삭제할 패스워드
		
			
				int delresult = dao.delete(delid, delpw);
				if(delresult==1) {
					request.setAttribute("delresult", delresult);
					request.getRequestDispatcher("WEB-INF/outmember.jsp").forward(request, response);
				}
			
			break;
			
		case "updateProc.member" :
			//회원 정보수정 컨트롤러

			break;
	
		case "logoutProc.member" :
			request.getSession().invalidate();
			request.getRequestDispatcher("WEB-INF/logout.jsp").forward(request, response);	
		break;
	
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
