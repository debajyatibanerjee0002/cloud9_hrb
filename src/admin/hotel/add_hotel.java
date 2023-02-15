package admin.hotel;

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


@WebServlet("/add_hotel")
public class add_hotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public add_hotel() {
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
			
			
			String query = "INSERT INTO HRB_HOTEL VALUES(?,?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, hotel_id);
			psmt.setString(2, hotel_name);
			psmt.setString(3, room_type);
			psmt.setString(4, location);
			psmt.setDouble(5, room_price1);
			psmt.setDouble(6, room_price2);
			psmt.setDouble(7, room_price3);
			psmt.setInt(8, hotel_type);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/hotel/hotel_page.jsp");
			}
			else{
				response.sendRedirect("./admin/hotel/hotel_add_page.jsp");
			}
			conn.close();
			
		}catch(Exception e){
			out.print(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
