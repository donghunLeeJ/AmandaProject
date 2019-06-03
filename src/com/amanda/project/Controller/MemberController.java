package com.amanda.project.Controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DAO.SendMailDAO;
import com.amanda.project.DTO.ComDTO;
import com.amanda.project.DTO.MemberDTO;
import com.amanda.project.DTO.SendMailDTO;


@WebServlet("*.member")
public class MemberController extends HttpServlet {

	//로그인한 id와 포인트를 맵에 저장시킴
	public static HashMap<String,Integer>pointmap = new HashMap();//로그인한 id와 포인트를 map에 저장시킨다.
	public static HashMap<String,String>useridseat = new HashMap();//로그인하는 순간 id와 사용자가 정한 자리번호를 map에 저장시킨다.
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");
		MemberDAO dao = new MemberDAO();
		SendMailDAO sdao = new SendMailDAO();
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

				if(login==1) {
					if(loginid.equals("admin"))  //관리자인 경우 admincharcontroller로 이동후 main접속 하기
					{
						
						request.getSession().setAttribute("user", dao.select_user(loginid));
						RequestDispatcher rd=request.getRequestDispatcher("adminchart.visit");
						rd.forward(request, response);					
					}
					else {

					MemberDTO user = dao.select_user(loginid);
					//pointmap에 로그인한 id와 해당 유저가 가진 포인트를 담는다.
					pointmap.put(loginid, user.getPoint());					
								
				
					request.setAttribute("login", login);													
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
				
					//String ip = "192.168.60.27";
				   String ip = request.getRemoteAddr();			
					System.out.println(ip);

					if(cDao.seatOn(ip)>0) {
						ComDTO cDto = cDao.seatNum_get(ip);
						System.out.println(cDto.getOnOff());

								
						//useridseat에 로그인한 사용자의 id(key)를 기준으로 자리번호를 담는다.
						//(이는 나중에 seat페이지에서 key값과 value값으로 사용된다.)
						useridseat.put(loginid, cDto.getSeatNum());	
						request.getServletContext().setAttribute("UserSeatNum", useridseat);				 	


						request.getServletContext().setAttribute("seat", cDao.selectSeat_all());
					}
					
					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/loginProc.jsp");
					rd.forward(request, response);							

					}
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
					response.sendRedirect("../error.jsp");
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
				//cDao.seatOff("192.168.60.27");
				cDao.resetId(request.getRemoteAddr());
				List<ComDTO> arr = cDao.selectSeat_all();
				request.getServletContext().setAttribute("seat", arr);
			
				//로그아웃하는 순간 hashmap에 담긴 로그아웃한 사용자 데이터를 리셋시킨다.
				pointmap.remove(id);
				useridseat.remove(id);
								
			  //remove연산으로 인해 로그아웃한 사용자의 자리가 비었으므로 다시 useridseat를 세팅해 준다.
				request.getServletContext().setAttribute("UserSeatNum", useridseat);
					
				request.getSession().invalidate();		
				request.getRequestDispatcher("WEB-INF/logout.jsp").forward(request, response);	

			} catch (Exception e) {

				e.printStackTrace();
			}

			break;					
		case "resetpwProc.member" :
			//비밀번호재설정
			String id = request.getParameter("checkid");//입력받은 id값
			String email = request.getParameter("checkemail");//입력받은 email값
			int result = dao.existMember(id, email);//있으면 return 1,없으면 0, 에러면 -1
			if(result == 1) {
				request.setAttribute("id", id);
				request.setAttribute("email", email);
				request.getRequestDispatcher("sendemailProc.member").forward(request, response);
			}else if(result == 0) {
				request.getRequestDispatcher("WEB-INF/modifyalert.jsp").forward(request, response);//이 창에서 회원아니라고 alert
			}else {
				response.sendRedirect("../error.jsp");
			}
			break;

		case "sendemailProc.member" :
			//이메일전송
			String from = "acesang@naver.com";
			String to = (String)request.getAttribute("email");
			String subject = "비밀번호 재설정 확인코드입니다.";
			String content = sdao.randomnumber()+"";
			// 입력값 받음

			String saveid = (String)request.getAttribute("id");//이메일로 받은 코드 db저장할때 저장할 id값
			SendMailDTO sdto = new SendMailDTO(saveid,to,content);
			sdao.pwcheck_insert(sdto);

			Properties p = new Properties(); // 정보를 담을 객체

			p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP

			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP 서버에 접속하기 위한 정보들

			try{
				Authenticator auth = new SendMailDAO();
				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
				msg.setSubject(subject); // 제목

				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 보내는 사람

				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람


				msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

				Transport.send(msg); // 전송

				request.setAttribute("email", to);
				request.setAttribute("saveid", saveid);//id값 전달
				request.setAttribute("content", content);//코드번호 전달
				request.getRequestDispatcher("WEB-INF/pwcodecheck.jsp").forward(request, response);
			} catch(Exception e){
				sdao.pwcheck_delete(saveid, to);
				e.printStackTrace();
				response.sendRedirect("../error.jsp");
				// 오류 발생시 뒤로 돌아가도록
				return;

			}
			break;

		case "pwcheckProc.member" :
			String pw_email = request.getParameter("email");
			String pwcode = request.getParameter("pwcodecheck");
			String pw_id = request.getParameter("saveid");
			String contentcheck = sdao.show_pwcode(pw_id);

			if(contentcheck.equals(pwcode)) {
				request.setAttribute("pw_id", pw_id);
				request.setAttribute("pw_email", pw_email);
				request.getRequestDispatcher("WEB-INF/reinputpw.jsp").forward(request, response);
			}else {
				sdao.pwcheck_delete(pw_id, pw_email);
				request.getRequestDispatcher("WEB-INF/wrongpwcode.jsp").forward(request, response);
			}
			break;
		
		case "pwcompleteProc.member" :
			String pww_email = request.getParameter("pw_email");
			String pww_id = request.getParameter("pw_id");
			String pww_pw = request.getParameter("reinputpw");
			String spww_pw = dao.testSHA256(pww_pw);
			sdao.pwcheck_delete(pww_id, pww_email);//

			int compw = sdao.renew_pw(pww_id, spww_pw);//비밀번호 수정

			if(compw == 1) {
				request.getRequestDispatcher("WEB-INF/pwcomplete.jsp").forward(request, response);
			}else if(compw == 0){
				request.getRequestDispatcher("WEB-INF/modifypassword.jsp").forward(request, response);
			}else {

			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
