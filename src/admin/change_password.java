package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.SingletonConnection;


@WebServlet("/change_password")
public class change_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public change_password() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String admin_id	= request.getParameter("uname");
			String admin_pass	= request.getParameter("newPassword");
			System.out.println(admin_id+" "+admin_pass);
			String query = "UPDATE HRB_ADMIN SET ADMIN_PASS=? WHERE ADMIN_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, admin_pass);
			psmt.setString(2, admin_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./logout/logout.jsp");
			}
			else{
				response.sendRedirect("./admin/change_password/password_change_page1.jsp");
			}
			
		}catch(Exception e){
			out.print(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
