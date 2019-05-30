package com.amanda.project.Controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DTO.ComDTO;
import com.amanda.project.DTO.MemberDTO;


@WebServlet("*.member")
public class MemberController extends HttpServlet {
	
	//로그인한 id와 포인트를 맵에 저장시킴
	public static HashMap<String,Integer>pointmap = new HashMap();//로그인한 id와 포인트를 맵에 저장시킨다.
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");
		MemberDAO dao=new MemberDAO();
		ComDAO cDao = new ComDAO();
	
		
		switch(cmd) {
		
		case "loginProc.member" :
			//로그인 화면에서 아이디 비밀번호 값을 받아 db와 비교하여 로그인을 실행시켜주는 controller
			String loginid=request.getParameter("loginid");
			String loginpw=request.getParameter("loginpw");
			System.out.println(loginid+loginpw);
			int login;
			try {
				login = dao.checklogin(loginid, dao.testSHA256(loginpw));
			
//<<<<<<< HEAD
				if(login==1) {
					               									
											
					MemberDTO user = dao.select_user(loginid);
					
					//pointmap에 로그인한 id와 해당 유저가 가진 포인트를 담는다.
					pointmap.put(loginid, user.getPoint());	
					
					//pointmap에 담긴 point값을 세션에 저장시킨다.(이후 페이지가 이동할 때마다 세션을 이렇게 초기화시켜야 하는데 아직 구현 못했음)
					request.setAttribute("login", login);
					request.getSession().setAttribute("point", pointmap.get(loginid));										
					request.getSession().setAttribute("user", dao.select_user(loginid));
														
					//로그인한 순간 사용자의 포인트를 1초마다 1씩 감소시키는 스레드(timertask)를 생성				
					Timer time = new Timer();
					TimerTask timertask = new TimerTask() {
						
						@Override
						public void run() {
						
							//조건1 : pointmap의 값이 null이 아닌 경우(즉 로그아웃 컨트롤러에서 hashmap을 remove하는 순간 바로 작업이 취소된다.)
							if(!(pointmap.get(loginid) == null)) {	
								
							//조건2 : pointmap에 저장된 포인트의 값이 0보다 큰 경우만 작동함
								if(pointmap.get(loginid) > 0) {	
																			
									//서버에서 단순히 잘 작동하고 있는지 테스트하는 코드
									System.out.println(loginid+"님의 남은 포인트: " + pointmap.get(loginid));	
									
									int point = pointmap.get(loginid) - 1;
									
									pointmap.put(loginid, point);}//포인트의 값을 1씩 감소시킨다.						
	                   }else{
							
							System.out.println("로그아웃 또는 타임아웃이므로 카운트 초기화");
							time.cancel();
						
						  }															
						}
					};	
									
					//각각 timertask클래스 변수 , 스레드가 작동하기까지 대기 시간,반복 주기를 나타냄
					//(반복주기에서 1000은 1초와 같다.)
					time.schedule(timertask,1,1000);
									
					
					String ip = request.getRemoteAddr();			
					System.out.println(ip);
					
					if(cDao.seatOn(ip)>0) {
						ComDTO cDto = cDao.seatNum_get(ip);
						System.out.println(cDto.getOnOff());
						request.getServletContext().setAttribute("seat", cDao.selectSeat_all());
					}
					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/main.jsp");
					rd.forward(request, response);							


					
				}else if(login == -1){
					System.out.println(login);
					request.setAttribute("login", login);
					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/main.jsp");
					rd.forward(request, response);
				}else {
					RequestDispatcher rd=request.getRequestDispatcher("../error.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
				String postcode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				
				System.out.println("컨트롤러");
				System.out.println(postcode);
				System.out.println(address1);
				System.out.println(address2);
				MemberDTO dto = new MemberDTO(id,spw,name,birth,email,phone,postcode,address1,address2);
				
				
				
				
				int result = dao.joinmember(dto);
				System.out.println(result);
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
		
			String delid= request.getParameter("id");//삭제할 아이디
			String delpw= request.getParameter("pw");//삭제할 패스워드
			
			System.out.println(delpw);
			
			
				int delresult = dao.delete(delid, delpw);
				//System.out.println(delresult);
				
					if(delresult==1) {
						request.getSession().invalidate();
						request.setAttribute("delresult", delresult);
						request.getRequestDispatcher("WEB-INF/outMember.jsp").forward(request, response);
					}else {
						request.setAttribute("delresult", delresult);
						request.getRequestDispatcher("WEB-INF/outMember.jsp").forward(request, response);
					}
			break;
			
		case "updateProc.member" :
			//회원 정보수정 컨트롤러	
			try {
				System.out.println("kk");
			String pw=request.getParameter("newpw");
			String email=request.getParameter("newemail");
			String phone=request.getParameter("phone");
			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
           	String id=dto.getId();
				int result=dao.updateMember(new MemberDTO(id,pw,email,phone));
				if(result==1) {
					System.out.println(result);
				request.getSession().setAttribute("user", dao.select_user(id));
					request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
				}
			
				} catch (Exception e) {
				
				e.printStackTrace();
			}
			break;
	
		case "logoutProc.member" :
				
			try {
				
					
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
			 	String id=dto.getId();
			 	
			 	//로그아웃하는 순간 point에 담긴 변수를 데이터베이스에 담는다.(id는 로그인한 해당 id)
				dao.PointUpdate(pointmap.get(id), id);		
							
				cDao.seatOff(request.getRemoteAddr());	
				List<ComDTO> arr = cDao.selectSeat_all();
				request.getServletContext().setAttribute("seat", arr);
				
				//로그아웃하는 순간 해시맵에 담긴 모든 값들을 리셋시킨다.
				pointmap.remove(id);
							
				request.getSession().invalidate();		
				request.getRequestDispatcher("WEB-INF/logout.jsp").forward(request, response);	
									
			} catch (Exception e) {
			
				e.printStackTrace();
			}
			
			break;						
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
