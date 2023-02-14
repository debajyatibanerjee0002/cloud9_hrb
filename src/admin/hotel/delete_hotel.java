package admin.hotel;

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


@WebServlet("/delete_hotel")
public class delete_hotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public delete_hotel() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String hotel_id = request.getParameter("hotel_id");
			
			
			String query = "DELETE FROM HRB_HOTEL WHERE HOTEL_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, hotel_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/hotel/hotel_page.jsp");
			}
			else{
				response.sendRedirect("./admin/hotel/hotel_delete_page.jsp");
			}
			
		}catch(Exception e){
			out.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
