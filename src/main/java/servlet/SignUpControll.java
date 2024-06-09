package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Account;
import dao.DAO;

/**
 * Servlet implementation class SignUpControll
 */
@WebServlet("/SignUp")
public class SignUpControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpControll() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String repassword = request.getParameter("repass");

        // Kiểm tra xem password và repassword có là null không
        if (password == null || repassword == null || !password.equals(repassword)) {
            // Mật khẩu và mật khẩu nhập lại không khớp hoặc là null
            response.sendRedirect("/view/login.jsp");
        } else {
            DAO dao = new DAO();
            Account a = dao.checkAccountExit(username);

            if (a == null) {
                // Tài khoản không tồn tại, thực hiện đăng ký
                dao.signUp(username, password);
                response.sendRedirect("DongHoServlet");
            } else {
                // Tài khoản đã tồn tại, chuyển hướng đến trang login.jsp
                response.sendRedirect("/view/login.jsp");
            }
        }
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
