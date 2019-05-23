package com.amanda.project.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		response.setCharacterEncoding("utf-8");
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
				
			
			break;
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
