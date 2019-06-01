

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amanda.project.Controller.MemberController;
import com.amanda.project.DAO.ComDAO;
import com.amanda.project.DTO.ComDTO;

@WebServlet("/Start")
public class Start extends HttpServlet {
	
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ComDAO cdao = new ComDAO();
		List<ComDTO> arr = cdao.selectSeat_all();
//		System.out.println(arr.get(1).getIp());

			
		//현재 useridseat에 저장된 사용자의 id와 자리번호를 담는다.(이 데이터는 seat에서 사용함)
		request.getServletContext().setAttribute("UserSeatNum", MemberController.useridseat);
			

		request.getServletContext().setAttribute("seat", arr);
		int usedSeat = cdao.selectSeat();
		System.out.println(usedSeat);
		request.getSession().setAttribute("user", null);
		request.getServletContext().setAttribute("seatUsed", usedSeat );
		request.getRequestDispatcher("WEB-INF/main.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}
}
