import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTravelServlet")
public class DeleteTravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteTravelServlet() {
		super();
	}

	protected boolean deleteTravel(String query) {
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
		int id = Integer.parseInt(request.getParameter("id"));
		String query = new String("DELETE FROM travel WHERE id = " + id);
		if (deleteTravel(query)) {
			response.sendRedirect("admin-panel/travel-table.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
