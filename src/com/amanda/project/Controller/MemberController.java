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

	//濡쒓렇�씤�븳 id�� �룷�씤�듃瑜� 留듭뿉 ���옣�떆�궡
	public static HashMap<String,Integer>pointmap = new HashMap();//濡쒓렇�씤�븳 id�� �룷�씤�듃瑜� map�뿉 ���옣�떆�궓�떎.
	public static HashMap<String,String>useridseat = new HashMap();//濡쒓렇�씤�븯�뒗 �닚媛� id�� �궗�슜�옄媛� �젙�븳 �옄由щ쾲�샇瑜� map�뿉 ���옣�떆�궓�떎.

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");
		MemberDAO dao = new MemberDAO();
		SendMailDAO sdao = new SendMailDAO();
		ComDAO cDao = new ComDAO();

		switch(cmd) {

		case "loginProc.member" :
			//濡쒓렇�씤 �솕硫댁뿉�꽌 �븘�씠�뵒 鍮꾨�踰덊샇 媛믪쓣 諛쏆븘 db�� 鍮꾧탳�븯�뿬 濡쒓렇�씤�쓣 �떎�뻾�떆耳쒖＜�뒗 controller
			String loginid=request.getParameter("loginid");
			String loginpw=request.getParameter("loginpw");

			String checkPw;
			try {
				checkPw = dao.checklogin(loginid);

				if(checkPw.equals(dao.testSHA256(loginpw))) {

					if(loginid.equals("admin"))  //愿�由ъ옄�씤 寃쎌슦 admincharcontroller濡� �씠�룞�썑 main�젒�냽 �븯湲�
					{
						request.getSession().setAttribute("user", dao.select_user(loginid));
						request.getServletContext().setAttribute("seat", cDao.selectSeat_all());
						RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/adminmain.jsp");
						rd.forward(request, response);					
					}else {

						MemberDTO user = dao.select_user(loginid);			
						request.setAttribute("login", 1);													
						request.getSession().setAttribute("user", dao.select_user(loginid));


						String ip = "192.168.60.27";
						//String ip = request.getRemoteAddr();			
						System.out.println(ip);
						System.out.println(ip);

						if(cDao.UserSeatIpCheck(ip) == 0){	

							//pointmap�뿉 濡쒓렇�씤�븳 id�� �빐�떦 �쑀��媛� 媛�吏� �룷�씤�듃瑜� �떞�뒗�떎.
							pointmap.put(loginid, user.getPoint());		

							//濡쒓렇�씤�븳 �닚媛� �궗�슜�옄�쓽 �룷�씤�듃瑜� 1珥덈쭏�떎 1�뵫 媛먯냼�떆�궎�뒗 �뒪�젅�뱶(timertask)瑜� �깮�꽦				
							Timer time = new Timer();
							TimerTask timertask = new TimerTask() {

								@Override
								public void run() {

									//議곌굔1 : pointmap�쓽 媛믪씠 null�씠 �븘�땶 寃쎌슦(利� 濡쒓렇�븘�썐 而⑦듃濡ㅻ윭�뿉�꽌 hashmap�쓣 remove�븯�뒗 �닚媛� 諛붾줈 �옉�뾽�씠 痍⑥냼�맂�떎.)
									if(!(pointmap.get(loginid) == null)) {	

										//議곌굔2 : pointmap�뿉 ���옣�맂 �룷�씤�듃�쓽 媛믪씠 0蹂대떎 �겙 寃쎌슦留� �옉�룞�븿
										if(pointmap.get(loginid) > 0) {	
											int point = pointmap.get(loginid) - 1;
											pointmap.put(loginid, point);}//�룷�씤�듃�쓽 媛믪쓣 1�뵫 媛먯냼�떆�궓�떎.						
									}else{

										System.out.println("濡쒓렇�븘�썐 �삉�뒗 ���엫�븘�썐�씠誘�濡� 移댁슫�듃 珥덇린�솕");
										time.cancel();

									}															
								}
							};	

							//媛곴컖 timertask�겢�옒�뒪 蹂��닔 , �뒪�젅�뱶媛� �옉�룞�븯湲곌퉴吏� ��湲� �떆媛�,諛섎났 二쇨린瑜� �굹���깂
							//(諛섎났二쇨린�뿉�꽌 1000�� 1珥덉� 媛숇떎.)
							time.schedule(timertask,1,1000);
						}



						if(cDao.seatOn(ip)>0) {
							ComDTO cDto = cDao.seatNum_get(ip);
							System.out.println(cDto.getOnOff());
							//useridseat�뿉 濡쒓렇�씤�븳 �궗�슜�옄�쓽 id(key)瑜� 湲곗��쑝濡� �옄由щ쾲�샇瑜� �떞�뒗�떎.
							//(�씠�뒗 �굹以묒뿉 seat�럹�씠吏��뿉�꽌 key媛믨낵 value媛믪쑝濡� �궗�슜�맂�떎.)
							useridseat.put(loginid, cDto.getSeatNum());	
							request.getServletContext().setAttribute("UserSeatNum", useridseat);				 	
							request.getServletContext().setAttribute("seat", cDao.selectSeat_all());
						}

						RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/loginProc.jsp");
						rd.forward(request, response);							
					}

				}else if(checkPw.equals("�븘�씠�뵒 �뾾�쓬")){
					request.setAttribute("login", 0);
					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/main.jsp");
					rd.forward(request, response);
				}else {
					request.setAttribute("login", -1);
					RequestDispatcher rd=request.getRequestDispatcher("WEB-INF/main.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				response.sendRedirect("error.html");
				e1.printStackTrace();
			}	


			break;
		case "joinProc.member" :
			//�쉶�썝 媛��엯 而⑦듃濡ㅻ윭
			try {
				MemberDAO jdao = new MemberDAO();
				String id = request.getParameter("joinmemberid");//�쉶�썝媛��엯�떆 諛쏅뒗 �븘�씠�뵒
				String pw = request.getParameter("joinmemberpw");//�쉶�썝媛��엯�떆 諛쏅뒗 鍮꾨�踰덊샇
				String spw = jdao.testSHA256(pw);//鍮꾨�踰덊샇 sha泥섎━
				String name = request.getParameter("joinmembername");//�쉶�썝媛��엯�떆 諛쏅뒗 �씠由�
				String birth = request.getParameter("joinmemberbirth");//�쉶�썝媛��엯�떆 諛쏅뒗 �깮�뀈�썡�씪
				String email = request.getParameter("joinmemberemail");//�쉶�썝媛��엯�떆 諛쏅뒗 email
				String phone = request.getParameter("joinmemberphone");//�쉶�썝媛��엯�떆 諛쏅뒗 �룿踰덊샇

				String postcode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");

				MemberDTO dto = new MemberDTO(id,spw,name,birth,email,phone,postcode,address1,address2);

				int result = dao.joinmember(dto);
				System.out.println(result);
				if(result == 1) {
					request.setAttribute("result", result);
					request.getRequestDispatcher("WEB-INF/joincomp.jsp").forward(request, response);
				}else if(result == -1) {
					request.setAttribute("result", result);
					request.getRequestDispatcher("WEB-INF/joincomp.jsp").forward(request, response);
				}

			} catch (Exception e) {
				response.sendRedirect("error.html");
				e.printStackTrace();
			}

			break;
		case "deleteProc.member" :
			//�쉶�썝 �깉�눜 而⑦듃濡ㅻ윭
			String delid= request.getParameter("id");//�궘�젣�븷 �븘�씠�뵒
			String delpw= request.getParameter("pw");//�궘�젣�븷 �뙣�뒪�썙�뱶
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
			//�쉶�썝 �젙蹂댁닔�젙 而⑦듃濡ㅻ윭	
			try {
				System.out.println("kk");
				String pw=request.getParameter("newpw");
				String email=request.getParameter("newemail");
				String phone=request.getParameter("phone");
				String address1=request.getParameter("address1");
				String address2=request.getParameter("address2");
				String postcode=request.getParameter("postcode");
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
				String id=dto.getId();
				int result=dao.updateMember(new MemberDTO(id,pw,email,phone,postcode,address1,address2));
				if(result==1) {
					System.out.println(result);
					request.getSession().setAttribute("user", dao.select_user(id));
					request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
				}

			} catch (Exception e) {
				
				response.sendRedirect("error.html");
				e.printStackTrace();
			}


			break;

		case "logoutProc.member" :

			try {

				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");

				String id = dto.getId();


				//留뚯씪 濡쒓렇�씤�븳 �궗�슜�옄媛� pc諛⑹뿉�꽌 濡쒓렇�븘�썐 �뻽�쓣 寃쎌슦 �옉�룞�븯�뒗 肄붾뱶�엫	
				if(!(pointmap.get(id) == null)){

					int hour = dto.getPoint() - pointmap.get(id);
					//濡쒓렇�븘�썐�븯�뒗 �닚媛� point�뿉 �떞湲� 蹂��닔瑜� �뜲�씠�꽣踰좎씠�뒪�뿉 �떞�뒗�떎.(id�뒗 濡쒓렇�씤�븳 �빐�떦 id)

					dao.PointUpdate(pointmap.get(id), id);		
					dao.usehourUpdate(hour, id); 

					//濡쒓렇�븘�썐�븯�뒗 �닚媛� hashmap�뿉 �떞湲� 濡쒓렇�븘�썐�븳 �궗�슜�옄 �뜲�씠�꽣瑜� 由ъ뀑�떆�궓�떎.
					pointmap.remove(id);
					useridseat.remove(id);


					//remove�뿰�궛�쑝濡� �씤�빐 濡쒓렇�븘�썐�븳 �궗�슜�옄�쓽 �옄由ш� 鍮꾩뿀�쑝誘�濡� �떎�떆 useridseat瑜� �꽭�똿�빐 以��떎.
					request.getServletContext().setAttribute("UserSeatNum", useridseat);

				}	


				//cDao.seatOff("192.168.60.27");
				cDao.seatOff(request.getRemoteAddr());

				cDao.resetId(request.getRemoteAddr());
				List<ComDTO> arr = cDao.selectSeat_all();
				request.getServletContext().setAttribute("seat", arr);

				request.getSession().invalidate();		
				request.getRequestDispatcher("WEB-INF/logout.jsp").forward(request, response);	

			} catch (Exception e) {
				
				response.sendRedirect("error.html");
				e.printStackTrace();
			}

			break;	
		case "adminlogoutProc.member" :

			MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
			String id=dto.getId();

			request.getSession().invalidate();		
			request.getRequestDispatcher("WEB-INF/logout.jsp").forward(request, response);	



			break;



		case "resetpwProc.member" :
			//鍮꾨�踰덊샇�옱�꽕�젙
			id = request.getParameter("checkid");//�엯�젰諛쏆� id媛�
			if(dao.checkCode(id)==1) {
				request.getRequestDispatcher("WEB-INF/codealert.jsp").forward(request, response);
			}else {

				String email = request.getParameter("checkemail");//�엯�젰諛쏆� email媛�
				int result = dao.existMember(id, email);//�엳�쑝硫� return 1,�뾾�쑝硫� 0, �뿉�윭硫� -1
				if(result == 1) {
					request.setAttribute("id", id);
					request.setAttribute("email", email);
					request.getRequestDispatcher("sendemailProc.member").forward(request, response);
				}else if(result == 0) {
					request.getRequestDispatcher("WEB-INF/modifyalert.jsp").forward(request, response);//�씠 李쎌뿉�꽌 �쉶�썝�븘�땲�씪怨� alert
				}else {
					response.sendRedirect("../error.jsp");
				}

			}
			break;



		case "findidProc.member" :
			//�븘�씠�뵒 李얘린
			String name = request.getParameter("checkName");
			String birth = request.getParameter("checkbirth");
			String email = request.getParameter("checkemail");
			int result = dao.findid(name, birth, email);
			System.out.println("result : " +name+birth );
			System.out.println(result);

			if(result == 1) {

				request.setAttribute("name", name);
				request.setAttribute("birth",birth );
				request.setAttribute("email", email);
				System.out.println(name+" "+birth+" "+email);
				request.getRequestDispatcher("sendemailid.member").forward(request, response);

			}else if(result == 0) {

				request.getRequestDispatcher("WEB-INF/alertid.jsp").forward(request, response);//�씠 李쎌뿉�꽌 �쉶�썝�븘�땲�씪怨� alert


			}else {
				response.sendRedirect("error.html");
			}
			break;





		case "sendemailProc.member" :
			//�씠硫붿씪�쟾�넚
			String from = "acesang@naver.com";
			String to = (String)request.getAttribute("email");
			String subject = "鍮꾨�踰덊샇 �옱�꽕�젙 �솗�씤肄붾뱶�엯�땲�떎.";
			String content = sdao.randomnumber()+"";
			// �엯�젰媛� 諛쏆쓬

			String saveid = (String)request.getAttribute("id");//�씠硫붿씪濡� 諛쏆� 肄붾뱶 db���옣�븷�븣 ���옣�븷 id媛�
			SendMailDTO sdto = new SendMailDTO(saveid,to,content);
			sdao.pwcheck_insert(sdto);

			Properties p = new Properties(); // �젙蹂대�� �떞�쓣 媛앹껜

			p.put("mail.smtp.host","smtp.naver.com"); // �꽕�씠踰� SMTP

			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP �꽌踰꾩뿉 �젒�냽�븯湲� �쐞�븳 �젙蹂대뱾

			try{
				Authenticator auth = new SendMailDAO();
				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses); // 硫붿씪�쓽 �궡�슜�쓣 �떞�쓣 媛앹껜
				msg.setSubject(subject); // �젣紐�

				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 蹂대궡�뒗 �궗�엺

				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 諛쏅뒗 �궗�엺


				msg.setContent(content, "text/html;charset=UTF-8"); // �궡�슜怨� �씤肄붾뵫

				Transport.send(msg); // �쟾�넚

				request.setAttribute("email", to);
				request.setAttribute("saveid", saveid);//id媛� �쟾�떖
				request.setAttribute("content", content);//肄붾뱶踰덊샇 �쟾�떖
				request.getRequestDispatcher("WEB-INF/pwcodecheck.jsp").forward(request, response);
			} catch(Exception e){
				sdao.pwcheck_delete(saveid, to);
				e.printStackTrace();
				response.sendRedirect("error.html");
				// �삤瑜� 諛쒖깮�떆 �뮘濡� �룎�븘媛��룄濡�
				return;

			}
			break;



		case "sendemailid.member" :
			//�씠硫붿씪�쟾�넚
			from = "acesang@naver.com";
			to = (String)request.getAttribute("email");
			subject = "�쉶�썝�떂�씠 �슂泥��븯�떊 �븘�씠�뵒 �엯�땲�떎";

			String checkname = request.getParameter("checkName");
			String checkbirth = request.getParameter("checkbirth");
			String checkemail = request.getParameter("checkemail");

			content = sdao.MemberId(checkname,checkbirth,checkemail);

			// �엯�젰媛� 諛쏆쓬

			p = new Properties(); // �젙蹂대�� �떞�쓣 媛앹껜

			p.put("mail.smtp.host","smtp.naver.com"); // �꽕�씠踰� SMTP
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			// SMTP �꽌踰꾩뿉 �젒�냽�븯湲� �쐞�븳 �젙蹂대뱾
			try{
				Authenticator auth = new SendMailDAO();
				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses); // 硫붿씪�쓽 �궡�슜�쓣 �떞�쓣 媛앹껜
				msg.setSubject(subject); // �젣紐�
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr); // 蹂대궡�뒗 �궗�엺
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr); // 諛쏅뒗 �궗�엺
				System.out.println(content);
				msg.setText(content);
				msg.setContent(content, "text/html;charset=UTF-8"); // �궡�슜怨� �씤肄붾뵫
				Transport.send(msg); // �쟾�넚
				request.setAttribute("email", to);
				System.out.println("�삤�굹蹂댁옄");
				request.getRequestDispatcher("WEB-INF/emailComplation.jsp").forward(request, response);
			} catch(Exception e){
				e.printStackTrace();
				response.sendRedirect("error.html");
				// �삤瑜� 諛쒖깮�떆 �뮘濡� �룎�븘媛��룄濡�
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

			int compw = sdao.renew_pw(pww_id, spww_pw);//鍮꾨�踰덊샇 �닔�젙

			if(compw == 1) {
				request.getRequestDispatcher("WEB-INF/pwcomplete.jsp").forward(request, response);
			}else if(compw == 0){
				request.getRequestDispatcher("WEB-INF/modifypassword.jsp").forward(request, response);
			}else {

			}
			break;
		case "Hello.member" :
			
			request.getRequestDispatcher("WEB-INF/Hello.jsp").forward(request, response);
		

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
