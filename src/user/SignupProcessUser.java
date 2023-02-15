package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.SingletonConnection;

@WebServlet("/SignupProcessUser")
public class SignupProcessUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignupProcessUser() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String user_id = request.getParameter("email");
			String password = request.getParameter("password");
			String addr = request.getParameter("addr");
			int zip = Integer.parseInt((request.getParameter("zip")));
			
			String query = "INSERT INTO HRB_USER VALUES(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, user_id);
			psmt.setString(2, password);
			psmt.setString(3, fname);
			psmt.setString(4, lname);
			psmt.setString(5, addr);
			psmt.setInt(6, zip);
			
			
			int rn = psmt.executeUpdate();
			if(rn>0){
				HttpSession session = request.getSession();
				session.setAttribute("uname", user_id);
				session.setAttribute("fname", fname);
				session.setAttribute("lname", lname);
				response.sendRedirect("./user/user_login_success.jsp");
			}
			else{
				response.sendRedirect("./user/user_login_error.jsp");
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
