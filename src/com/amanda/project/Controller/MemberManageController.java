package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.MemberDAO;
import com.amanda.project.DTO.MemberDTO;
import com.google.gson.JsonObject;

@WebServlet("*.manage")
public class MemberManageController extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf8");
      response.setCharacterEncoding("utf8");
      
      String requestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = requestURI.substring(contextPath.length());
      
      MemberDAO dao = new MemberDAO();
      
      if(command.equals("/member.manage")) {
         
//    	  	request.setAttribute("info", dao.show_memberInfo());
            request.setAttribute("result", dao.show_member());
            request.setAttribute("blresult",dao.show_blacklist());
            request.getRequestDispatcher("WEB-INF/membermanage.jsp").forward(request, response);
      }
      
      else if(command.equals("/toblack.manage")){
         
         String reason = request.getParameter("blackreson");//블랙 사유
         int num = Integer.parseInt(request.getParameter("blacknum"));//블랙하는 회원번호
         
         dao.addblacklist(reason, num);//member테이블 blackcheck,blackreason 컬럼 변경
                 
         request.getRequestDispatcher("member.manage").forward(request, response);

         
      }
      
      else if(command.equals("/cancelblack.manage")) {
         
         int number = Integer.parseInt(request.getParameter("blacknumber"));
         int updateresult = dao.deleteblacklist(number);
         
            request.setAttribute("updateresult", updateresult);
            request.getRequestDispatcher("member.manage").forward(request, response);
            
      }else if(command.equals("/showinfo.manage")) { //회원 정보 띄우는 버튼 컨트롤
    	 
    	  int no = Integer.parseInt(request.getParameter("member_seq"));
    	  MemberDTO dto = dao.show_memberInfo(no);
    	  System.out.println(dto.getId());
    	  JsonObject obj = new JsonObject();
    	  obj.addProperty("id", dto.getId());
    	  obj.addProperty("seq", dto.getMem_seq());   	  
    	  obj.addProperty("name", dto.getName());
    	  obj.addProperty("birth", dto.getBirth());
    	  obj.addProperty("email", dto.getEmail());
    	  obj.addProperty("phone", dto.getPhone());
    	  obj.addProperty("point", dto.getPoint());
    	  obj.addProperty("addr1", dto.getAddress1());
    	  obj.addProperty("addr2", dto.getAddress2());
    	  obj.addProperty("time", dto.getUsehour());
    	  
    	  response.getWriter().print(obj.toString());
    	  
      }
         		  
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doGet(request, response);
   }

}