package user.booking;

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

@WebServlet("/Booking")
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Booking() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String bill_no = request.getParameter("bill_no");
			String hotel_id = request.getParameter("hotel_id");
			String room_id = request.getParameter("room_id");
			String user_id = request.getParameter("user_id");
			String room_type = request.getParameter("room_type");
			String hotel_rosort_name = request.getParameter("hotel_name");
			double room_price = Double.valueOf(request.getParameter("room_price"));
			String user_name = request.getParameter("user_name");
			int age = Integer.parseInt(request.getParameter("age"));
			int no_of_guests = Integer.parseInt(request.getParameter("no_of_guests"));
			String name_of_guests = request.getParameter("name_of_guests");
			String from_date = request.getParameter("from_date");
			String to_date = request.getParameter("to_date");
			int no_of_nights = Integer.parseInt(request.getParameter("no_of_nights"));
			double total = Double.valueOf(request.getParameter("total"));
			
			HttpSession session = request.getSession();
			session.setAttribute("room_id", room_id);
			session.setAttribute("uname", user_id);
			
			String query = "UPDATE HRB_ROOM SET AVAILABLE=? WHERE ROOM_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, "NO");
			psmt.setString(2, room_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				query = "INSERT INTO HRB_BOOKING VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, bill_no);
				psmt.setString(2, user_id);
				psmt.setString(3, user_name);
				psmt.setInt(4, age);
				psmt.setString(5, hotel_rosort_name);
				psmt.setString(6, room_type);
				psmt.setDouble(7, no_of_guests);
				psmt.setString(8, name_of_guests);
				psmt.setString(9, from_date);
				psmt.setString(10, to_date);
				psmt.setInt(11, no_of_nights);
				psmt.setDouble(12, total);
				rn = psmt.executeUpdate();
				
				
				if(rn>0){
					response.sendRedirect("user/booking/booking_view_page.jsp");
				}
				else{
					response.sendRedirect("user/booking/booking_view_page.jsp");
				}
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
