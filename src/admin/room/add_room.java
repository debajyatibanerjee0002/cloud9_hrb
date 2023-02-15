package admin.room;

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

@WebServlet("/add_room")
public class add_room extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public add_room() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String room_id = request.getParameter("room_id");
			String hotel_id = request.getParameter("hotel_id");
			String ac = request.getParameter("ac");
			String wifi = request.getParameter("wifi");
			String available = request.getParameter("available");
			String room_type = request.getParameter("room_type");
			
			String query = "INSERT INTO HRB_ROOM VALUES(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, room_id);
			psmt.setString(2, hotel_id);
			psmt.setString(3, ac);
			psmt.setString(4, wifi);
			psmt.setString(5, room_type);
			psmt.setString(6, available);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/room/room_page.jsp");
			}
			else{
				response.sendRedirect("./admin/room/room_add_page.jsp");
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
