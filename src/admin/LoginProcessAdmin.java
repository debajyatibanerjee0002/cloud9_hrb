package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.SingletonConnection;

import java.sql.*;

@WebServlet("/LoginProcessAdmin")
public class LoginProcessAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginProcessAdmin() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String uname = request.getParameter("email");
			String pass = request.getParameter("pass");
			String query = "SELECT * FROM HRB_ADMIN WHERE ADMIN_ID=? AND ADMIN_PASS=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, uname);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				HttpSession session = request.getSession();
				session.setAttribute("uname", uname);
				response.sendRedirect("admin/admin_login_success.jsp");
//				RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin_login_success.jsp");
//				requestDispatcher.forward(request, response);
			}else{
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin_login_error.jsp");
				requestDispatcher.include(request, response);
			}
			conn.close();
		}catch(Exception e){
			out.print(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
