package admin.resort;

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


@WebServlet("/delete_resort")
public class delete_resort extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public delete_resort() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String resort_id = request.getParameter("resort_id");
			
			
			String query = "DELETE FROM HRB_RESORT WHERE RESORT_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, resort_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/resort/resort_page.jsp");
			}
			else{
				response.sendRedirect("./admin/resort/resort_delete_page.jsp");
			}
			
		}catch(Exception e){
			out.print(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
