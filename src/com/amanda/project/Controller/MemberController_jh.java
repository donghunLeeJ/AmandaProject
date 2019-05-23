package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.HyangMemberdao;
import com.amanda.project.DTO.MemberDTO;
import com.amanda.project.DTO.MemberDTO2;


@WebServlet("*.member2")
public class MemberController_jh extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		response.setCharacterEncoding("utf-8");
		HyangMemberdao dao=new HyangMemberdao();
		switch(cmd) {
		
		case "loginProc.member" :
			//로그인 화면에서 아이디 비밀번호 값을 받아 db와 비교하여 로그인을 실행시켜주는 controller
					
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
				String id = request.getParameter("newid");
				String name = request.getParameter("newname");
				String phone = request.getParameter("newpohone");
				String email = request.getParameter("newemail");
				String zipcode = request.getParameter("newpost");
				String address1 = request.getParameter("newaddress1");
				String address2 = request.getParameter("newaddress2");
				int result = 0;
				
				System.out.println(id);
				
//				if (request.getParameter("newpw") == null) {
//					String pw = (String) request.getSession().getAttribute("pw");
//					try {
//						result = dao.updateMember(new MemberDTO2(id, dao.testSHA256(pw), name, phone, email, zipcode, address1, address2));
//						request.setAttribute("result",result);
//						RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/Member/myupdateProc.jsp");
//						rd.forward(request, response);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//					System.out.print(pw);
//				} else {
//					String pw = request.getParameter("newpw");
//
//					try {
//						result = dao.updateMember(new MemberDTO2(id, dao.testSHA256(pw), name, phone, email, zipcode, address1, address2));
//						request.setAttribute("result",result);
//						RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/Member/myupdateProc.jsp");
//						rd.forward(request, response);
//					} catch (Exception e) {
//						e.printStackTrace();
//
//					}
//					System.out.print(pw);
//				}	
			
			break;
		}
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
