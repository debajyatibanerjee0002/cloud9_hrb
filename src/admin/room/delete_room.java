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

@WebServlet("/delete_room")
public class delete_room extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public delete_room() {
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
			
			String query = "DELETE FROM HRB_ROOM WHERE ROOM_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, room_id);
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
