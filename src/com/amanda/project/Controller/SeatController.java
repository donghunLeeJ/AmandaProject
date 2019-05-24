package com.amanda.project.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.SeatDAO;
import com.amanda.project.DTO.SeatDTO;


@WebServlet("*.seat")
public class SeatController extends HttpServlet {
	     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SeatDAO dao = new SeatDAO();
		response.setCharacterEncoding("utf-8");
		String ri = request.getRequestURI();
		String cp = request.getContextPath();
		String command = ri.substring(cp.length());
			
	//만일 결제가 완료된 페이지에서 pc방 컴퓨터의 ip주소를 받았을 때 데이터베이스의 comUseCheck값을 0 → 1로 바꾸는 컨트롤러(update)		
		try {
						
			//일단 로그인이 끝나는 순간 여기로 이동시킨다고 가정
			if(command.equals("/seatAdd.seat")){ 
				
/*eclipse에서 톰캣 사용시 우리가 기본적으로 친숙한 ip주소를 정상적으로 출력되게 하는 방법(미리 설정안했을 경우 0:0:0:0의 참사가..)
  메뉴의 Run -> Run Configurations -> Arguments 탭 -> -Djava.net.preferIPv4Stack=true 추가*/
				
			//String ipaddr = request.getRemoteAddr();
			String ipaddr ="192.168.60.27";
			System.out.println(ipaddr);											
		int result = dao.SeatUpdate(ipaddr);
		
		if(result > 0) {
			
			List<SeatDTO>SeatList = dao.SeatSelectAll();		
		    request.getServletContext().setAttribute("SeatList", SeatList);			        	    
		    request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
	
		  }													    
		}					
	  }catch(Exception e) {
			
			e.printStackTrace();		
		}
	}
		
	                                                                                                                            
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		doGet(request, response);
		
	}

}
