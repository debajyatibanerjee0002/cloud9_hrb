package com.booking;

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

@WebServlet("/BookingDelete")
public class BookingDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookingDelete() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		try{
			conn = SingletonConnection.getSingletonConnection();
			String room_id = request.getParameter("val");
			String admin_user = request.getParameter("val2");
			String bill_no = request.getParameter("val3");
			HttpSession session = request.getSession();
			session.setAttribute("room_id", room_id);
			
			String query = "UPDATE HRB_ROOM SET AVAILABLE=? WHERE ROOM_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, "YES");
			psmt.setString(2, room_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				query = "DELETE FROM HRB_BOOKING WHERE BILL_NO=?";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, bill_no);
				rn = psmt.executeUpdate();
				if(rn>0){
					if(admin_user.equals("user")){
						response.sendRedirect("user/booking/booking_view_page.jsp");
					}else{
						response.sendRedirect("admin/booking/booking_view_page.jsp");
					}
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
