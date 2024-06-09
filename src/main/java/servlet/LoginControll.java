package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Account;
import dao.DAO;

/**
 * Servlet implementation class LoginControll
 */
@WebServlet("/Login")
public class LoginControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("user");
		String password = request.getParameter("pass");
		DAO dao = new DAO();
		Account a = dao.login(username, password);
		if(a == null) {
			request.setAttribute("mess","WRONG USER OR PASSWORD");
			request.getRequestDispatcher("/view/login.jsp").forward(request, response);
			
		}else {
			//request.getRequestDispatcher("home").forward(request, response);
			HttpSession session = request.getSession();
			session.setAttribute("acc", a);
			response.sendRedirect("DongHoServlet");
		}
//		if (a != null) {
//	        System.out.println("Dữ liệu Account từ SQL: " + a.toString());
//
//	        // Chuyển hướng hoặc xử lý logic khác ở đây nếu cần
//	        request.getRequestDispatcher("home.jsp").forward(request, response);
//	    } else {
//	        // Nếu không tìm thấy dữ liệu, chuyển hướng đến trang login.jsp
//	        request.getRequestDispatcher("login.jsp").forward(request, response);
//	    }
//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
