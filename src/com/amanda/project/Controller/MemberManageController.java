package com.amanda.project.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.MemberDAO;

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
         
         
            request.setAttribute("result", dao.show_member());
            request.setAttribute("blresult",dao.show_blacklist());
            request.getRequestDispatcher("WEB-INF/membermanage.jsp").forward(request, response);
      }
      
      else if(command.equals("/toblack.manage")){
         
         String reason = request.getParameter("blackreson");//블랙 사유
         int num = Integer.parseInt(request.getParameter("blacknum"));//블랙하는 회원번호
         
         dao.addblacklist(reason, num);//member테이블 blackcheck,blackreason 컬럼 변경
         
         request.setAttribute("result", dao.show_member());
         request.setAttribute("blresult",dao.show_blacklist());//블랙리스트 올라간 사람 보여주기
         request.getRequestDispatcher("WEB-INF/membermanage.jsp").forward(request, response);

         
      }
      
      else if(command.equals("/cancelblack.manage")) {
         
         int number = Integer.parseInt(request.getParameter("blacknumber"));
         int updateresult = dao.deleteblacklist(number);
         
            request.setAttribute("updateresult", updateresult);
            request.setAttribute("result", dao.show_member());
            request.setAttribute("blresult",dao.show_blacklist());
            request.getRequestDispatcher("WEB-INF/membermanage.jsp").forward(request, response);
         
      }
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doGet(request, response);
   }

}