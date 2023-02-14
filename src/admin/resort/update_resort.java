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

@WebServlet("/update_resort")
public class update_resort extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public update_resort() {
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
			String resort_name = request.getParameter("resort_name");
			String resort_addr = request.getParameter("resort_addr");
			int resort_type = Integer.parseInt(request.getParameter("resort_type"));
			int total_rooms = Integer.parseInt(request.getParameter("total_rooms"));
			double resort_price = Double.valueOf(request.getParameter("resort_price"));
			
			
			String query = "UPDATE HRB_RESORT SET RESORT_NAME=?, RESORT_ADDR=?, RESORT_TYPE=?, TOTAL_ROOMS=?, RESORT_PRICE=? WHERE RESORT_ID=?";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, resort_name);
			psmt.setString(2, resort_addr);
			psmt.setInt(3, resort_type);
			psmt.setInt(4, total_rooms);
			psmt.setDouble(5, resort_price);
			psmt.setString(6, resort_id);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/resort/resort_page.jsp");
			}
			else{
				response.sendRedirect("./admin/resort/resort_update_select_page.jsp");
			}
			
		}catch(Exception e){
			out.print(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
