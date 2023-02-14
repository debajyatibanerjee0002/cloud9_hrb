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

@WebServlet("/update_hotel")
public class update_hotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public update_hotel() {
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
			String hotel_name = request.getParameter("hotel_name");
			String location = request.getParameter("location");
			int hotel_type = Integer.parseInt(request.getParameter("hotel_type"));
			String room_type = request.getParameter("room_type");
			double room_price1 = Double.valueOf(request.getParameter("room_price1"));
			double room_price2 = Double.valueOf(request.getParameter("room_price2"));
			double room_price3 = Double.valueOf(request.getParameter("room_price3"));
			
			
			String query = "UPDATE HRB_HOTEL SET HOTEL_NAME=?, HOTEL_ROOM_TYPE=?, HOTEL_ADDR=?, SINGLE_ROOM_PRICE=?, DOUBLE_ROOM_PRICE=?, DELUXE_ROOM_PRICE=?, HOTEL_TYPE=? WHERE HOTEL_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, hotel_name);
			psmt.setString(2, room_type);
			psmt.setString(3, location);
			psmt.setDouble(4, room_price1);
			psmt.setDouble(5, room_price2);
			psmt.setDouble(6, room_price3);
			psmt.setInt(7, hotel_type);
			psmt.setString(8, hotel_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/hotel/hotel_page.jsp");
			}
			else{
				response.sendRedirect("./admin/hotel/hotel_update_select_page.jsp");
			}
			
		}catch(Exception e){
			out.print(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
