package user.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.SingletonConnection;

import user.search.searchClass.HotelSearchResult;


@WebServlet("/user_search")
public class user_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public user_search() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection conn;
		PreparedStatement psmt;
		String from_date = request.getParameter("from_date");
		String to_date = request.getParameter("to_date");
		String place = request.getParameter("place");
		String type = request.getParameter("type");
		try{
			conn = SingletonConnection.getSingletonConnection();
			
			ArrayList<HotelSearchResult> hotelSearchResult = new ArrayList<HotelSearchResult>();
			if(type.equals("HOTEL")){								
				String query = "SELECT * FROM HRB_HOTEL WHERE ADDR=?";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, place);
				ResultSet rs = psmt.executeQuery();
				while(rs.next()){
					HotelSearchResult obj = new HotelSearchResult();
					obj.setHotel_id(rs.getString("HOTEL_ID"));
					obj.setHotel_name(rs.getString("HOTEL_NAME"));
					obj.setHotel_type(rs.getInt("HOTEL_TYPE"));
					obj.setAddr(rs.getString("ADDR"));
					obj.setHotel_room_type(rs.getString("HOTEL_ROOM_TYPE"));
					obj.setSingle_room_price(rs.getDouble("SINGLE_ROOM_PRICE"));
					obj.setDouble_room_price(rs.getDouble("DOUBLE_ROOM_PRICE"));
					obj.setDeluxe_room_price(rs.getDouble("Deluxe_ROOM_PRICE"));
					obj.setFrom_date(from_date);
					obj.setTo_date(to_date);
					hotelSearchResult.add(obj);
				}
				HttpSession session = request.getSession();
				session.setAttribute("hotelSearchResult", hotelSearchResult);
				session.setAttribute("from_date", from_date);
				session.setAttribute("to_date", to_date);
				int size = hotelSearchResult.size();
				session.setAttribute("size", size);
				response.sendRedirect("user/search/search_page1.jsp");
				System.out.println(size);
			}else{				
				String query = "SELECT * FROM HRB_RESORT WHERE ADDR=?";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, place);
				ResultSet rs = psmt.executeQuery();
				while(rs.next()){
					HttpSession session = request.getSession();
					response.sendRedirect("user/user_login_success.jsp");
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
