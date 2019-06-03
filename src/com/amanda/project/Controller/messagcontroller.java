
  package com.amanda.project.Controller;
  
  import java.io.IOException;
  
 import javax.servlet.RequestDispatcher; import
  javax.servlet.ServletException; import javax.servlet.annotation.WebServlet;
  import javax.servlet.http.HttpServlet; import
 javax.servlet.http.HttpServletRequest; import
  javax.servlet.http.HttpServletResponse;
  
  @WebServlet("*.message") public class messagcontroller extends HttpServlet {
  
  protected void doGet(HttpServletRequest request, HttpServletResponse
  response) throws ServletException, IOException {
  request.setCharacterEncoding("utf-8"); 
  String requestURI =  request.getRequestURI(); 
  String contextPath = request.getContextPath();
  String command = requestURI.substring(contextPath.length()); 
  System.out.println(command);
  try {
  
  if(command.equals("/reply.message")){
  String who=request.getParameter("who"); 
  String text=request.getParameter("content");
  request.setAttribute("who", who);
  request.setAttribute("text",text); 
  RequestDispatcher  rd=request.getRequestDispatcher("WEB-INF/admintoclinet.jsp"); rd.forward(request,response); //cient�뿉寃� 蹂대궡湲�
  
  } 
  else if(command.equals("/replytoclient.message")){
	  String who=request.getParameter("who"); 
	  String text=request.getParameter("content");
	  System.out.println("client"+who+text);
	  request.setAttribute("who", who);
	  request.setAttribute("text",text); 
	  RequestDispatcher  rd=request.getRequestDispatcher("WEB-INF/clienttoadmin.jsp"); rd.forward(request,response); //admin�뿉寃� 蹂대궡湲� 
 
	  } 
 
  } catch(Exception e) { e.printStackTrace();} }
  
  
  protected void doPost(HttpServletRequest request, HttpServletResponse
  response) throws ServletException, IOException {
 
 }
 
 }
