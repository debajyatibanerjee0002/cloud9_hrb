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
import user.search.searchClass.ResortSearchResult;


@WebServlet("/user_search")
public class user_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public user_search() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		Connection conn;
		PreparedStatement psmt;
		String from_date = request.getParameter("from_date");
		String to_date = request.getParameter("to_date");
		String place = request.getParameter("place");
		String type = request.getParameter("type");
		try{
			conn = SingletonConnection.getSingletonConnection();
			
			if(type.equals("HOTEL")){	
				ArrayList<HotelSearchResult> hotelSearchResult = new ArrayList<HotelSearchResult>();
				session.setAttribute("type", type);
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
				
				session.setAttribute("hotelSearchResult", hotelSearchResult);
				session.setAttribute("from_date", from_date);
				session.setAttribute("to_date", to_date);
				int size = hotelSearchResult.size();
				session.setAttribute("size", size);
				response.sendRedirect("user/search/search_page1.jsp");
//				System.out.println(size);
			}else{	
				String avail = "YES";
				ArrayList<ResortSearchResult> resortSearchResult = new ArrayList<ResortSearchResult>();
				session.setAttribute("type", type);
				String query = "SELECT * FROM HRB_RESORT WHERE ADDR=? AND AVAILABLE=?";
				psmt = conn.prepareStatement(query);
				psmt.setString(1, place);
				psmt.setString(2, avail);
				ResultSet rs = psmt.executeQuery();
				while(rs.next()){
					ResortSearchResult obj = new ResortSearchResult();
					obj.setResort_id(rs.getString("RESORT_ID"));
					obj.setResort_name(rs.getString("RESORT_NAME"));
					obj.setAddr(rs.getString("ADDR"));
					obj.setResort_type(rs.getInt("RESORT_TYPE"));
					obj.setTotal_rooms(rs.getInt("TOTAL_ROOMS"));
					obj.setResort_price(rs.getDouble("RESORT_PRICE"));
					obj.setAvailable(rs.getString("AVAILABLE"));
					resortSearchResult.add(obj);
				}
				session.setAttribute("resortSearchResult", resortSearchResult);
				session.setAttribute("from_date", from_date);
				session.setAttribute("to_date", to_date);
				int size = resortSearchResult.size();
				session.setAttribute("size", size);
				response.sendRedirect("user/search/search_page1.jsp");
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
