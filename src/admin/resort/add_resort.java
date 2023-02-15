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


@WebServlet("/add_resort")
public class add_resort extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public add_resort() {
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
			
			
			String query = "INSERT INTO HRB_RESORT VALUES(?,?,?,?,?,?)";
			psmt = conn.prepareStatement(query);
			psmt.setString(1, resort_id);
			psmt.setString(2, resort_name);
			psmt.setString(3, resort_addr);
			psmt.setInt(4, resort_type);
			psmt.setInt(5, total_rooms);
			psmt.setDouble(6, resort_price);
			int rn = psmt.executeUpdate();
			if(rn>0){
				response.sendRedirect("./admin/resort/resort_page.jsp");
			}
			else{
				response.sendRedirect("./admin/resort/resort_add_page.jsp");
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
