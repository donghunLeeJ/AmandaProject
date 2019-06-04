package com.amanda.project.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileExistsException;

import com.amanda.project.DAO.MenuDAO;
import com.amanda.project.DTO.MenuDTO;
import com.amanda.project.DTO.MenuTitleDTO;
import com.amanda.project.DTO.MenuTitleEditDTO;



@WebServlet("*.admin")
public class AdminController extends HttpServlet {

<<<<<<< HEAD
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		MenuDAO dao = new MenuDAO();
		int result = 0;

		try {
			if(command.equals("/MenuAdd.admin")){

				String rootPath = this.getServletContext().getRealPath("/"); // 현재 서블릿에 대한 환경정보 추출 -> 실행하기 위해 복사되는 파일의 진짜 경로 추출 -> 저장할 폴더 지정
				String filePath = rootPath + "admin/"; // 파일이 저장될 본 저장소
				File uploadPath = new File(filePath);
				String realFilePath = null;
				String tempFileName = null;

				if(!uploadPath.exists()) {uploadPath.mkdir();}
				HashMap<String, String> parameterMap = new HashMap<String, String>();
				DiskFileItemFactory diskFactory = new DiskFileItemFactory();
				diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp")); // 파일 임시 저장소
				ServletFileUpload sfu = new ServletFileUpload(diskFactory);
				sfu.setSizeMax(100*1024*1024); // byte 기준, 10Mb, 이 크기를 넣으면 에러가 난다			
				List<FileItem> items = sfu.parseRequest(request); // List<FileItem>을 리턴값으로 가진다, 넘겨받은 자료를 분리

				for(FileItem fi : items) {				
					String name = fi.getFieldName();//폼의 각 항목의 이름 저장
					if(fi.isFormField()){//폼 필드의 항목인지 검사										
						String value = new String(fi.getString().getBytes("ISO-8859-1"),"utf-8");
						parameterMap.put(name, value);//폼에 있는 인풋 태그 각각의 이름과 값을 저장
						System.out.println(name + " : " + value);
						System.out.println(parameterMap.get(name));
					}else{// isFormField의 끝
						if(fi.getSize()==0) {continue;} // 업로드 파일 선택을 하지 않았을 경우 의미없는 빈 파일 생성을 방지
						while(true) {
							try {
								long tempTime = System.currentTimeMillis();
								tempFileName = tempTime+"_"+fi.getName();
								realFilePath = filePath + "/" + tempFileName;
								fi.write(new File(realFilePath));//임시 저장소에 있는 파일을 옮겨서 저장한다 -> 경로 및 이름 지정
								break;
							}catch(FileExistsException fee) { //같은 파일을 동시에 여러 개 업로드 했을 경우에 생길 수 있는 예외 처리(시간차 0.001초 미만)
								System.out.println("파일 이름 재설정");
							}
						}

					}
				}

				String menuTitle = parameterMap.get("menuTitleAdd");
				String menuDesc = parameterMap.get("menuDescAdd");
				int menuPrice = Integer.parseInt(parameterMap.get("menuPriceAdd"));
				String menuImg  = "admin/"+tempFileName;
				String menuRealPath = realFilePath;
				System.out.println(menuRealPath);

				MenuDTO dto = new MenuDTO(0,menuImg,menuRealPath,menuTitle,menuDesc,menuPrice);
				result = dao.menuAdd(dto);

				request.setAttribute("result", result);
				request.getRequestDispatcher("menuAddProc.jsp").forward(request, response);

			}else if(command.equals("/MenuDel.admin")) {

				int menu_seq = Integer.parseInt(request.getParameter("menu_seq"));
				result = dao.menuDel(menu_seq);

				request.setAttribute("result", result);
				request.getRequestDispatcher("menuDelProc.jsp").forward(request, response);

			}else if(command.equals("/MenuUpdate.admin")){

				String rootPath = this.getServletContext().getRealPath("/"); // 현재 서블릿에 대한 환경정보 추출 -> 실행하기 위해 복사되는 파일의 진짜 경로 추출 -> 저장할 폴더 지정
				String filePath = rootPath + "admin/"; // 파일이 저장될 본 저장소
				File uploadPath = new File(filePath);
				String realFilePath = null;
				String tempFileName = null;

				if(!uploadPath.exists()) {uploadPath.mkdir();}
				HashMap<String, String> parameterMap = new HashMap<String, String>();
				DiskFileItemFactory diskFactory = new DiskFileItemFactory();
				diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp")); // 파일 임시 저장소
				ServletFileUpload sfu = new ServletFileUpload(diskFactory);
				sfu.setSizeMax(100*1024*1024); // byte 기준, 10Mb, 이 크기를 넣으면 에러가 난다			
				List<FileItem> items = sfu.parseRequest(request); // List<FileItem>을 리턴값으로 가진다, 넘겨받은 자료를 분리

				for(FileItem fi : items) {				
					String name = fi.getFieldName();//폼의 각 항목의 이름 저장
					if(fi.isFormField()){//폼 필드의 항목인지 검사										
						String value = new String(fi.getString().getBytes("ISO-8859-1"),"utf-8");
						parameterMap.put(name, value);//폼에 있는 인풋 태그 각각의 이름과 값을 저장
						System.out.println(name + " : " + value);
					}else{// isFormField의 끝
						if(fi.getSize()==0) {continue;} // 업로드 파일 선택을 하지 않았을 경우 의미없는 빈 파일 생성을 방지
						while(true) {
							try {
								long tempTime = System.currentTimeMillis();
								tempFileName = tempTime+"_"+fi.getName();
								realFilePath = filePath + "/" + tempFileName;
								fi.write(new File(realFilePath));//임시 저장소에 있는 파일을 옮겨서 저장한다 -> 경로 및 이름 지정
								break;
							}catch(FileExistsException fee) { //같은 파일을 동시에 여러 개 업로드 했을 경우에 생길 수 있는 예외 처리(시간차 0.001초 미만)
								System.out.println("파일 이름 재설정");
							}
						}

					}
				}

				int menu_seq = Integer.parseInt(parameterMap.get("menuNoEdit"));
				String menuTitle = parameterMap.get("menuTitleEdit");
				String menuDesc = parameterMap.get("menuDescEdit");
				int menuPrice = Integer.parseInt(parameterMap.get("menuPriceEdit"));
				String menuImg  = "admin/"+tempFileName;
				String menuRealPath = realFilePath;
				System.out.println(menuRealPath);

				if(menuRealPath==null) {
					MenuDTO dto = new MenuDTO(menu_seq,"","",menuTitle,menuDesc,menuPrice);
					result = dao.menuUpdatePart(dto);
				}else {
					MenuDTO dto = new MenuDTO(menu_seq,menuImg,menuRealPath,menuTitle,menuDesc,menuPrice);
					result = dao.menuUpdateAll(dto);
				}

				request.setAttribute("result", result);
				request.getRequestDispatcher("/menuUpdateProc.jsp").forward(request, response);
				
			}else if(command.equals("/MenuHeaderEdit.admin")){
				String top1 = request.getParameter("menuHeaderTop");
				String bot1 = request.getParameter("menuHeaderBot1");
				String bot2 = request.getParameter("menuHeaderBot2");
				String food1 = request.getParameter("firstHeaderMenu");
				String foodDesc1 = request.getParameter("menuDesc1");
				String food2 = request.getParameter("secondHeaderMenu");
				String foodDesc2 = request.getParameter("menuDesc2");
				String food3 = request.getParameter("thirdHeaderMenu");
				String foodDesc3 = request.getParameter("menuDesc3");
				
				MenuTitleEditDTO menuHeader = new MenuTitleEditDTO(top1, bot1, bot2, food1, foodDesc1, food2, foodDesc2, food3, foodDesc3);
				result = dao.menuHeaderUpdate(menuHeader);
				
				request.setAttribute("result", result);
				request.getRequestDispatcher("menuHeaderUpdateProc.jsp").forward(request, response);
				
			}else{
				List<String> descs = new ArrayList<>();
				List<MenuTitleDTO> foods = new ArrayList<>();
				List<MenuDTO> list = new ArrayList<>(); 
				
				descs = dao.selectDesc();
				String top = descs.get(0);
				String bot1 = descs.get(1);
				String bot2 = descs.get(2);
				
				foods = dao.selectFood();
				String food1 = dao.selectImgPath(foods.get(0).getMenuName());
				String food1Desc = foods.get(0).getMenuContent();
				String food2 = dao.selectImgPath(foods.get(1).getMenuName());
				String food2Desc = foods.get(1).getMenuContent();
				String food3 = dao.selectImgPath(foods.get(2).getMenuName());
				String food3Desc = foods.get(2).getMenuContent();
				
				list = dao.selectMenu();
				
				request.setAttribute("top", top);
				request.setAttribute("bot1", bot1);
				request.setAttribute("bot2", bot2);
				request.setAttribute("food1", food1);
				request.setAttribute("food1Desc", food1Desc);
				request.setAttribute("food2", food2);
				request.setAttribute("food2Desc", food2Desc);
				request.setAttribute("food3", food3);
				request.setAttribute("food3Desc", food3Desc);
				request.setAttribute("list", list);
				request.getRequestDispatcher("manu2.jsp").forward(request, response);

			}


		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
=======
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html;UTF-8");

      String requestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = requestURI.substring(contextPath.length());
      MenuDAO dao = new MenuDAO();
      int result = 0;

      try {
         if(command.equals("/MenuAdd.admin")){

            String rootPath = this.getServletContext().getRealPath("/"); // 현재 서블릿에 대한 환경정보 추출 -> 실행하기 위해 복사되는 파일의 진짜 경로 추출 -> 저장할 폴더 지정
            String filePath = rootPath + "admin/"; // 파일이 저장될 본 저장소
            File uploadPath = new File(filePath);
            String realFilePath = null;
            String tempFileName = null;

            if(!uploadPath.exists()) {uploadPath.mkdir();}
            HashMap<String, String> parameterMap = new HashMap<String, String>();
            DiskFileItemFactory diskFactory = new DiskFileItemFactory();
            diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp")); // 파일 임시 저장소
            ServletFileUpload sfu = new ServletFileUpload(diskFactory);
            sfu.setSizeMax(100*1024*1024); // byte 기준, 10Mb, 이 크기를 넣으면 에러가 난다         
            List<FileItem> items = sfu.parseRequest(request); // List<FileItem>을 리턴값으로 가진다, 넘겨받은 자료를 분리

            for(FileItem fi : items) {            
               String name = fi.getFieldName();//폼의 각 항목의 이름 저장
               if(fi.isFormField()){//폼 필드의 항목인지 검사                              
                  String value = new String(fi.getString().getBytes("ISO-8859-1"),"utf-8");
                  parameterMap.put(name, value);//폼에 있는 인풋 태그 각각의 이름과 값을 저장
                  System.out.println(name + " : " + value);
                  System.out.println(parameterMap.get(name));
               }else{// isFormField의 끝
                  if(fi.getSize()==0) {continue;} // 업로드 파일 선택을 하지 않았을 경우 의미없는 빈 파일 생성을 방지
                  while(true) {
                     try {
                        long tempTime = System.currentTimeMillis();
                        tempFileName = tempTime+"_"+fi.getName();
                        realFilePath = filePath + "/" + tempFileName;
                        fi.write(new File(realFilePath));//임시 저장소에 있는 파일을 옮겨서 저장한다 -> 경로 및 이름 지정
                        break;
                     }catch(FileExistsException fee) { //같은 파일을 동시에 여러 개 업로드 했을 경우에 생길 수 있는 예외 처리(시간차 0.001초 미만)
                        System.out.println("파일 이름 재설정");
                     }
                  }

               }
            }

            String menuTitle = parameterMap.get("menuTitleAdd");
            String menuDesc = parameterMap.get("menuDescAdd");
            int menuPrice = Integer.parseInt(parameterMap.get("menuPriceAdd"));
            String menuImg  = "admin/"+tempFileName;
            String menuRealPath = realFilePath;
            System.out.println(menuRealPath);

            MenuDTO dto = new MenuDTO(0,menuImg,menuRealPath,menuTitle,menuDesc,menuPrice);
            result = dao.menuAdd(dto);

            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/MenuAddProc.jsp").forward(request, response);

         }else if(command.equals("/MenuDel.admin")) {

            int menu_seq = Integer.parseInt(request.getParameter("menu_seq"));
            result = dao.menuDel(menu_seq);

            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/MenuDelProc.jsp").forward(request, response);

         }else if(command.equals("/MenuUpdate.admin")){

            String rootPath = this.getServletContext().getRealPath("/"); // 현재 서블릿에 대한 환경정보 추출 -> 실행하기 위해 복사되는 파일의 진짜 경로 추출 -> 저장할 폴더 지정
            String filePath = rootPath + "admin/"; // 파일이 저장될 본 저장소
            File uploadPath = new File(filePath);
            String realFilePath = null;
            String tempFileName = null;

            if(!uploadPath.exists()) {uploadPath.mkdir();}
            HashMap<String, String> parameterMap = new HashMap<String, String>();
            DiskFileItemFactory diskFactory = new DiskFileItemFactory();
            diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp")); // 파일 임시 저장소
            ServletFileUpload sfu = new ServletFileUpload(diskFactory);
            sfu.setSizeMax(100*1024*1024); // byte 기준, 10Mb, 이 크기를 넣으면 에러가 난다         
            List<FileItem> items = sfu.parseRequest(request); // List<FileItem>을 리턴값으로 가진다, 넘겨받은 자료를 분리

            for(FileItem fi : items) {            
               String name = fi.getFieldName();//폼의 각 항목의 이름 저장
               if(fi.isFormField()){//폼 필드의 항목인지 검사                              
                  String value = new String(fi.getString().getBytes("ISO-8859-1"),"utf-8");
                  parameterMap.put(name, value);//폼에 있는 인풋 태그 각각의 이름과 값을 저장
                  System.out.println(name + " : " + value);
               }else{// isFormField의 끝
                  if(fi.getSize()==0) {continue;} // 업로드 파일 선택을 하지 않았을 경우 의미없는 빈 파일 생성을 방지
                  while(true) {
                     try {
                        long tempTime = System.currentTimeMillis();
                        tempFileName = tempTime+"_"+fi.getName();
                        realFilePath = filePath + "/" + tempFileName;
                        fi.write(new File(realFilePath));//임시 저장소에 있는 파일을 옮겨서 저장한다 -> 경로 및 이름 지정
                        break;
                     }catch(FileExistsException fee) { //같은 파일을 동시에 여러 개 업로드 했을 경우에 생길 수 있는 예외 처리(시간차 0.001초 미만)
                        System.out.println("파일 이름 재설정");
                     }
                  }

               }
            }

            int menu_seq = Integer.parseInt(parameterMap.get("menuNoEdit"));
            String menuTitle = parameterMap.get("menuTitleEdit");
            String menuDesc = parameterMap.get("menuDescEdit");
            int menuPrice = Integer.parseInt(parameterMap.get("menuPriceEdit"));
            String menuImg  = "admin/"+tempFileName;
            String menuRealPath = realFilePath;
            System.out.println(menuRealPath);

            if(menuRealPath==null) {
               MenuDTO dto = new MenuDTO(menu_seq,"","",menuTitle,menuDesc,menuPrice);
               result = dao.menuUpdatePart(dto);
            }else {
               MenuDTO dto = new MenuDTO(menu_seq,menuImg,menuRealPath,menuTitle,menuDesc,menuPrice);
               result = dao.menuUpdateAll(dto);
            }

            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/MenuUpdateProc.jsp").forward(request, response);
            
         }else if(command.equals("/MenuHeaderEdit.admin")){
            String top1 = request.getParameter("menuHeaderTop");
            String bot1 = request.getParameter("menuHeaderBot1");
            String bot2 = request.getParameter("menuHeaderBot2");
            String food1 = request.getParameter("firstHeaderMenu");
            String foodDesc1 = request.getParameter("menuDesc1");
            String food2 = request.getParameter("secondHeaderMenu");
            String foodDesc2 = request.getParameter("menuDesc2");
            String food3 = request.getParameter("thirdHeaderMenu");
            String foodDesc3 = request.getParameter("menuDesc3");
            
            MenuTitleEditDTO menuHeader = new MenuTitleEditDTO(top1, bot1, bot2, food1, foodDesc1, food2, foodDesc2, food3, foodDesc3);
            result = dao.menuHeaderUpdate(menuHeader);
            
            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/MenuHeaderUpdateProc.jsp").forward(request, response);
            
         }else if(command.equals("/select.admin")){
            List<String> descs = new ArrayList<>();
            List<MenuTitleDTO> foods = new ArrayList<>();
            List<MenuDTO> list = new ArrayList<>(); 
            
            descs = dao.selectDesc();
            String top = descs.get(0);
            String bot1 = descs.get(1);
            String bot2 = descs.get(2);
            
            foods = dao.selectFood();
            String food1 = dao.selectImgPath(foods.get(0).getMenuName());
            String food1Desc = foods.get(0).getMenuContent();
            String food2 = dao.selectImgPath(foods.get(1).getMenuName());
            String food2Desc = foods.get(1).getMenuContent();
            String food3 = dao.selectImgPath(foods.get(2).getMenuName());
            String food3Desc = foods.get(2).getMenuContent();
            
            list = dao.selectMenu();
            
            request.setAttribute("top", top);
            request.setAttribute("bot1", bot1);
            request.setAttribute("bot2", bot2);
            request.setAttribute("food1", food1);
            request.setAttribute("food1Desc", food1Desc);
            request.setAttribute("food2", food2);
            request.setAttribute("food2Desc", food2Desc);
            request.setAttribute("food3", food3);
            request.setAttribute("food3Desc", food3Desc);
            request.setAttribute("list", list);
            request.getRequestDispatcher("WEB-INF/MenuAdmin.jsp").forward(request, response);

         }else if(command.equals("/ClientSelect.admin")){
             List<String> descs = new ArrayList<>();
             List<MenuTitleDTO> foods = new ArrayList<>();
             List<MenuDTO> list = new ArrayList<>(); 
             
             descs = dao.selectDesc();
             String top = descs.get(0);
             String bot1 = descs.get(1);
             String bot2 = descs.get(2);
             
             foods = dao.selectFood();
             String food1 = dao.selectImgPath(foods.get(0).getMenuName());
             String food1Desc = foods.get(0).getMenuContent();
             String food2 = dao.selectImgPath(foods.get(1).getMenuName());
             String food2Desc = foods.get(1).getMenuContent();
             String food3 = dao.selectImgPath(foods.get(2).getMenuName());
             String food3Desc = foods.get(2).getMenuContent();
             
             list = dao.selectMenu();
             
             request.setAttribute("top", top);
             request.setAttribute("bot1", bot1);
             request.setAttribute("bot2", bot2);
             request.setAttribute("food1", food1);
             request.setAttribute("food1Desc", food1Desc);
             request.setAttribute("food2", food2);
             request.setAttribute("food2Desc", food2Desc);
             request.setAttribute("food3", food3);
             request.setAttribute("food3Desc", food3Desc);
             request.setAttribute("list", list);
             request.getRequestDispatcher("WEB-INF/manu.jsp").forward(request, response);

          }



      }catch(Exception e) {
         e.printStackTrace();
         response.sendRedirect("error.html");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }
>>>>>>> 1aa62f52fb166227291a8112197f3723998d9ff2

}