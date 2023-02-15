package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.SingletonConnection;

@WebServlet("/LoginProcessUser")
public class LoginProcessUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginProcessUser() {
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
			String query = "SELECT * FROM HRB_USER WHERE USER_ID=? AND USER_PASS=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, uname);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()){
				String fname = rs.getString("USER_FNAME");
				HttpSession session = request.getSession();
				session.setAttribute("uname", uname);
				session.setAttribute("fname", fname);
				response.sendRedirect("user/user_login_success.jsp");
			}else{
				response.sendRedirect("user/user_login_error.jsp");
//				RequestDispatcher requestDispatcher = request.getRequestDispatcher("admin/admin_login_error.jsp");
//				requestDispatcher.include(request, response);
			}
		}catch(Exception e){
			out.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
