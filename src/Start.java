

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DTO.ComDTO;


@WebServlet("/Start")
public class Start extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComDAO dao = new ComDAO();
		List<ComDTO> arr = dao.selectSeat_all();
//		System.out.println(arr.get(1).getIp());
		request.getServletContext().setAttribute("seat", arr);
		request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
}
