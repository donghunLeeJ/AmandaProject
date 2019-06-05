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
		 	
		 	//만일 사용자가 pc방이 아닌 다른 기기에서 로그인했을 경우
            //로그인한 사람의 id와 포인트값을 저장하는 pointmap에 데이터가 저장되지 않으므로 값이 null이 나오게 된다.
		 	//그 경우 ajax반복을 하지 않도록 -1를 출력시킨다.
		 	if(MemberController.pointmap.get(id) == null){
		 		
		 		pw.print(-1);
		 		
		 	}else {
		 	 	
		    	int userpoint = MemberController.pointmap.get(id);   	
		    	pw.print(userpoint); //로그인한 유저가 가진 남은 포인트를 출력시킨다	
		 	}
		 
		 	
	    }else if(command.equals("/UsersTime.com")){
	    	
	    	//seat페이지에서만 사용하는 컨트롤러
	    	//먼저 seat페이지에서 각각 로그인한 사용자의 id를 받아오면(ajax)
	    	//그 id를 key값으로 사용하는 pointmap에서 각 사용자당 남은 포인트를 뽑아올 수 있다.
	    	String userid = request.getParameter("userid");  
	    	
	    	if(MemberController.pointmap.get(userid) == null){
	    		 
		    	pw.print(-1);//만일 어떤 사용자가 갑자기 로그아웃을 해서 map에 데이터가 사라졌을 경우 seat.jsp에 -1을 보내서 반복을 중지시킨다.  
		    	
	    	}else {
	    		
	    		//정상적으로 pointmap에 로그인한 사용자의 데이터가 남아있다면 그 사용자의 포인트를 seat에 보낸다.
	    	  	int userpoint = MemberController.pointmap.get(userid);   	
		    	pw.print(userpoint);  
	    		
	    	}
	    }    
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
