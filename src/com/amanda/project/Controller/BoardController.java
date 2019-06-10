package com.amanda.project.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.amanda.project.DAO.BoardDAO;
import com.amanda.project.DTO.BoardDTO;
import com.amanda.project.DTO.FilesDTO;
import com.amanda.project.DTO.MemberDTO;
import com.amanda.project.DTO.ReplDTO;
import com.google.gson.JsonObject;



@WebServlet("*.board")
public class BoardController extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html;UTF-8");

      String requestURI = request.getRequestURI();
      String contextPath = request.getContextPath();
      String command = requestURI.substring(contextPath.length());
      BoardDAO dao = new BoardDAO();

      int result = 0;
      try {

         if(command.equals("/BoardWrite.board")){

            String title = request.getParameter("title");
            String newTitle = title.replace("<script>", "%1$2#").replace("</script>", "!5@4#");

            String contents =request.getParameter("contents");
            String newContents = contents.replace("<script>", "%1$2#").replace("</script>", "!5@4#");

            MemberDTO writerdto = (MemberDTO)request.getSession().getAttribute("user");
            String writer = writerdto.getId();

            String path =request.getParameter("path");

            int viewCount = 1;
            String ipAddr = request.getLocalAddr();
            BoardDTO dto = new BoardDTO(newTitle,newContents,writer,viewCount,ipAddr,path);

            result = dao.write(dto);

            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/boardWriteProc.jsp").forward(request, response);

         }else if(command.equals("/Board.board")){
            int currentPage = Integer.parseInt(request.getParameter("currentPage"));
            String navi = dao.getNavi(currentPage);
            request.setAttribute("navi", navi);
            List<BoardDTO> list = new ArrayList<>();         
            list = dao.selectBoard(currentPage);
            List<BoardDTO> adminList = new ArrayList<>(); 
            adminList = dao.selectAdminBoard(currentPage);
            request.setAttribute("list", list);
            request.setAttribute("adminList", adminList);
            request.getRequestDispatcher("WEB-INF/board.jsp").forward(request, response);

         }else if(command.equals("/BoardSearch.board")){
            String searchType = request.getParameter("select");
            int currentPage = Integer.parseInt(request.getParameter("currentPage"));         

            if(searchType.equals("제목")) {
               String title = request.getParameter("search");
               String navi = dao.getNaviSearch(currentPage, title);
               request.setAttribute("navi", navi);
               List<BoardDTO> list = new ArrayList<>();         
               list = dao.searchBoard(currentPage, title);
               request.setAttribute("list", list);
               request.getRequestDispatcher("WEB-INF/board.jsp").forward(request, response);
            }else if(searchType.equals("작성자")) {
               String writer = request.getParameter("search");
               String navi = dao.getNaviByWriter(currentPage, writer);
               request.setAttribute("navi", navi);
               List<BoardDTO> list = new ArrayList<>();         
               list = dao.searchWriter(currentPage, writer);
               request.setAttribute("list", list);
               request.setAttribute("showAll", "showAll");
               request.getRequestDispatcher("WEB-INF/board.jsp").forward(request, response);
            }

         }else if(command.equals("/ShowContents.board")){



            int no = Integer.parseInt(request.getParameter("no"));
            BoardDTO dto = dao.selectContents(no);
            String writer = dto.getWriter();

            List<ReplDTO> replList = dao.selectRepl(no);

            request.setAttribute("replList", replList);
            request.setAttribute("dto", dto);

            request.setAttribute("no", no);
            request.setAttribute("writer", writer);
            request.getRequestDispatcher("WEB-INF/showContents.jsp").forward(request, response);

         }else if(command.equals("/Write.board")) {

            request.getRequestDispatcher("WEB-INF/boardWrite.jsp").forward(request, response);

         }else if(command.equals("/BoardEdit.board")) {
            int no = Integer.parseInt(request.getParameter("no"));
            String writer = request.getParameter("writer");
            String title = request.getParameter("title");
            String newTitle = title.replace("<", "%1$2#").replace(">", "!5@4#");
            String contents = request.getParameter("contents");

            result = dao.update(newTitle, contents, no);

            request.setAttribute("writer", writer);
            request.setAttribute("result", result);
            request.setAttribute("no", no);
            request.getRequestDispatcher("WEB-INF/boardEditProc.jsp").forward(request, response);

         }else if(command.equals("/ContentsEdit.board")) {
            int no = Integer.parseInt(request.getParameter("no"));
            BoardDTO dto = dao.selectContents(no);

            request.setAttribute("no", no);
            request.setAttribute("dto", dto);
            request.getRequestDispatcher("WEB-INF/contentsEdit.jsp").forward(request, response);

         }else if(command.equals("/BoardDel.board")) {
            int no = Integer.parseInt(request.getParameter("no"));
            String path = dao.selectPath(no);
            
            if(path !=null) {
               File fi = new File(path);
               boolean fidel = fi.delete();
               if(fidel) {
                  System.out.println("파일 삭제 완료");
               }else {
                  System.out.println("파일 삭제 실패");
               } 
            }
            result = dao.delete(no);
            request.setAttribute("no", no);
            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/boardDelProc.jsp").forward(request, response);        



         }else if(command.equals("/Reply.board")) {

            MemberDTO writerdto = (MemberDTO)request.getSession().getAttribute("user");
            String id = writerdto.getId();
            String repl_contents = request.getParameter("repl_contents");
            String new_repl_contents = repl_contents.replace("<script>", "%1$2#").replace("</script>", "!5@4#");
            int contents_no = Integer.parseInt(request.getParameter("contents_no"));

            result = dao.insertRepl(contents_no, id, new_repl_contents);

            request.setAttribute("no", contents_no);
            request.setAttribute("result", result);
            request.getRequestDispatcher("WEB-INF/boardReplProc.jsp").forward(request, response);   



         }else if(command.equals("/ReplEdit.board")) {
            int repl_seq = Integer.parseInt(request.getParameter("repl_seq"));
            int contents_no = Integer.parseInt(request.getParameter("contents_no"));
            String repl_contents = request.getParameter("repl_contents");         
            result = dao.updateRepl(repl_seq,repl_contents);

            request.setAttribute("result", result);
            request.setAttribute("contents_no", contents_no);
            request.getRequestDispatcher("WEB-INF/boardReplEditProc.jsp").forward(request, response);   

         }else if(command.equals("/ReplDelete.board")) {
            int repl_seq = Integer.parseInt(request.getParameter("repl_seq"));
            int contents_no = Integer.parseInt(request.getParameter("contents_no"));
            result = dao.delRepl(repl_seq);

            request.setAttribute("result", result);
            request.setAttribute("contents_no", contents_no);
            request.getRequestDispatcher("WEB-INF/boardReplDelProc.jsp").forward(request, response);   

         }else if(command.equals("/ImageUpload.board")) {
            FilesDTO files = (FilesDTO)request.getSession().getAttribute("files");
            String rootPath = this.getServletContext().getRealPath("/"); // 현재 서블릿에 대한 환경정보 추출 -> 실행하기 위해 복사되는 파일의 진짜 경로 추출 -> 저장할 폴더 지정
            MemberDTO writerdto = (MemberDTO)request.getSession().getAttribute("user");
            String writer = writerdto.getId();
            String filePath = rootPath + "files/"+writer+"/"; // 파일이 저장될 본 저장소
            File uploadPath = new File(filePath);
            String realFilePath = null;
            String tempFileName = null;
            FilesDTO fidto = null;
            if(files!=null) {
               fidto = files;
            }else {
               fidto = new FilesDTO();
            }
            if(!uploadPath.exists()) {uploadPath.mkdir();}

            DiskFileItemFactory diskFactory = new DiskFileItemFactory();
            diskFactory.setRepository(new File(rootPath + "/WEB-INF/temp")); // 파일 임시 저장소

            ServletFileUpload sfu = new ServletFileUpload(diskFactory);
            sfu.setSizeMax(10*1024*1024); // byte 기준, 10Mb, 이 크기를 넣으면 에러가 난다

            try {
               List<FileItem> items = sfu.parseRequest(request); // List<FileItem>을 리턴값으로 가진다

               for(FileItem fi : items) {
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

                  System.out.println(realFilePath);
                  fidto.getFiles().add(realFilePath);

                  request.getSession().setAttribute("files", fidto);

                  JsonObject obj = new JsonObject();


                  obj.addProperty("url", "files/"+writer+"/" + tempFileName);
                  obj.addProperty("path", realFilePath);
                  response.getWriter().print(obj);

               }
            }catch(Exception e) {
               e.printStackTrace();
               response.sendRedirect("error.jsp");
            }               
         }else if(command.equals("/ImageDel.board")) {
            FilesDTO files = (FilesDTO)request.getSession().getAttribute("files");
            if(files!=null) {
               boolean flag = files.isFlag();
               if(!flag) {
                  System.out.println(files.getFiles().size()+"개의 파일");
                  for(int i=0;i<files.getFiles().size();i++) {
                     String path = files.getFiles().get(i);
                     File fi = new File(path);
                     boolean fidel = fi.delete();

                     if(fidel) {
                        System.out.println("파일 삭제 완료");
                     }else {
                        System.out.println("파일 삭제 실패");
                     }
                  }
               }
               request.getSession().setAttribute("files", null);
            }
         }else if(command.equals("/Upload.board")) {
            FilesDTO files = (FilesDTO)request.getSession().getAttribute("files");
            try{
               files.setFlag(true);
               files.setFiles(null);
            }catch(Exception e) {
               System.out.println("그림 안넣음");
            }
            
            request.getSession().setAttribute("files", null);
         }

      }catch(Exception e) {
         e.printStackTrace();
         response.sendRedirect("error.html");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}