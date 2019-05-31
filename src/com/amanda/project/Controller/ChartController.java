package com.amanda.project.Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ChartDAO;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;


@WebServlet("*.chart")
public class ChartController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		ChartDAO chartDAO = new ChartDAO(); 
		Gson g = new Gson();
		Date d = new Date();
		Long minusDay = (long) 1000 * 60 * 60 * 24;
		Long time = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("YY/MM/dd");
		String dated = sdf.format(time);
		if(cmd.equals("search.chart")) {
			 String what = request.getParameter("what");
			 System.out.println(what);
			 if(what.equals("주간 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				 for(int i = 0 ; i < 7 ; i ++) {
					time = time - minusDay;
					dated = sdf.format(time);
					hashMap.put("amount"+i,chartDAO.daily_sell(i));
					hashMap2.put("day"+i,dated);
				}
				 
				 JsonObject obj = new JsonObject();
				
							 
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				
//				String result3 = "date:"+result+",amount:"+result2; 
				
				obj.add("date", result);
				 obj.add("amount", result2);
				 
						 
//				System.out.println(result3);
				
				response.getWriter().print(obj);  
			 }
		    	   	        	
		    }	    	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
