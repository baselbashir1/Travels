import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpdateTripServlet")
@MultipartConfig

public class UpdateTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateTripServlet() {
		super();
	}

	protected boolean updateTrip(String query) {
		boolean inserted = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
			Statement stmt = dbConnect.createStatement();

			stmt.executeUpdate(query);

			dbConnect.close();
			inserted = true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return inserted;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String destination = request.getParameter("destination");
		float price = Float.parseFloat(request.getParameter("price"));
		String query = new String("UPDATE trip SET name = '" + name + "' WHERE id =  " + id);
		String query2 = new String("UPDATE trip SET destination = '" + destination + "' WHERE id =  " + id);
		String query3 = new String("UPDATE trip SET price = '" + price + "' WHERE id =  " + id);
		if (updateTrip(query) && updateTrip(query2) && updateTrip(query3)) {
			response.sendRedirect("admin-panel/trip-table.jsp");
		}
	}
}
