package com.amanda.project.Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ChartDAO;
import com.amanda.project.DAO.VisitDAO;
import com.amanda.project.DTO.ChartDTO;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;


@WebServlet("*.chart")
public class ChartController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI().substring(request.getContextPath().length()+1);
		ChartDAO chartDAO = new ChartDAO(); 
		VisitDAO visitDAO = new VisitDAO();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Gson g = new Gson();
		SimpleDateFormat sdf = new SimpleDateFormat("YY/MM/dd");
		
		if(cmd.equals("search.chart")) {
			
			String what = request.getParameter("what");
			System.out.println(what);
			if(what.equals("주간 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				for(int i = 0 ; i < 7 ; i ++) {
					Calendar cal = Calendar.getInstance();
					cal.add(Calendar.DATE, -i);
					String dated = sdf.format(cal.getTime());
					System.out.println(dated);
					hashMap.put("amount"+i,chartDAO.daily_sell(i));
					hashMap2.put("day"+i,dated);
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);

				response.getWriter().print(obj);  
			}else if(what.equals("월 별 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				for(int i = 0 ; i < 7 ; i ++) {
					Calendar cal = Calendar.getInstance();
					cal.add(Calendar.MONTH, -i);
					String dated = sdf.format(cal.getTime());
					System.out.println(dated);
					hashMap.put("amount"+i,chartDAO.monthly_sell(i));
					hashMap2.put("day"+i,dated);
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				response.getWriter().print(obj);  
			}
			else if(what.equals("회원별 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				List<ChartDTO> arr = new ArrayList();
				for(int i = 0 ; i < 7 ; i ++) {
					arr = chartDAO.user_sell();
					hashMap.put("amount"+i,arr.get(i).getAmount());
					hashMap2.put("day"+i,arr.get(i).getId());
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				response.getWriter().print(obj);  
			}
			else if(what.equals("메뉴별 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				List<ChartDTO> arr = new ArrayList();
				for(int i = 0 ; i < 7 ; i ++) {
					arr = chartDAO.name_sell();
					hashMap.put("amount"+i,arr.get(i).getAmount());
					hashMap2.put("day"+i,arr.get(i).getId());
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				response.getWriter().print(obj);  
			}

		}else if(cmd.equals("visit.chart")) {
			
			String what = request.getParameter("what");
			System.out.println(what);
			if(what.equals("시간별 방문자")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				for(int i = 0 ; i < 7 ; i ++) {
					Calendar cal = Calendar.getInstance();
					cal.add(Calendar.HOUR, -i);
					SimpleDateFormat sdf2 = new SimpleDateFormat("hh시");
					String dated = sdf2.format(cal.getTime());
					System.out.println(dated);
					hashMap.put("amount"+i,visitDAO.timelyVisit(i));
					hashMap2.put("day"+i,dated);
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				System.out.println(obj);

				response.getWriter().print(obj);  
			}else if(what.equals("최근 일주일")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				for(int i = 0 ; i < 7 ; i ++) {
					Calendar cal = Calendar.getInstance();
					cal.add(Calendar.WEEK_OF_MONTH, -i);
					String dated = sdf.format(cal.getTime());
					System.out.println(dated);
					hashMap.put("amount"+i,visitDAO.weeklyVisit(i));
					hashMap2.put("day"+i,dated);
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				response.getWriter().print(obj); 
				System.out.println(obj);
			}
			else if(what.equals("회원별 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				List<ChartDTO> arr = new ArrayList();
				for(int i = 0 ; i < 7 ; i ++) {
					arr = chartDAO.user_sell();
					hashMap.put("amount"+i,arr.get(i).getAmount());
					hashMap2.put("day"+i,arr.get(i).getId());
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				response.getWriter().print(obj);  
			}
			else if(what.equals("메뉴별 매출액")) {
				Map<String,Integer> hashMap = new HashMap<>();
				Map<String,String> hashMap2 = new HashMap<>(); 
				List<ChartDTO> arr = new ArrayList();
				for(int i = 0 ; i < 7 ; i ++) {
					arr = chartDAO.name_sell();
					hashMap.put("amount"+i,arr.get(i).getAmount());
					hashMap2.put("day"+i,arr.get(i).getId());
				}

				JsonObject obj = new JsonObject();
				JsonElement result =g.toJsonTree(hashMap2);
				JsonElement result2 = g.toJsonTree(hashMap);
				obj.add("date", result);
				obj.add("amount", result2);
				response.getWriter().print(obj);  
			}

		}	    	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
