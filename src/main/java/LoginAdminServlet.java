import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import classes.*;
import java.sql.*;

@WebServlet("/LoginAdminServlet")
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginAdminServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	private ArrayList<Admin> getAdmin(String query) {
		ArrayList<Admin> admins = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
			Statement stmt = dbConnect.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				do {
					admins = new ArrayList<Admin>();
					String username = rs.getString("username");
					String password = rs.getString("password");
					Admin admin = new Admin(username, password);
					admins.add(admin);
				} while (rs.next());
				stmt.close();
				dbConnect.close();
			}

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return admins;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String query = new String("Select * from admin");
		ArrayList<Admin> admins = (ArrayList<Admin>) getAdmin(query);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		for (Admin admin : admins) {
			String adminUserName = admin.getUsername();
			String adminPassword = admin.getPassword();
			if (adminUserName.equals(username) && adminPassword.equals(password)) {
				String userName = admin.getUsername();
				session.setAttribute("loggedin", "True");
				session.setAttribute("username", userName);
				response.sendRedirect("admin-panel/index.jsp");
				break;
			} else {
				response.sendRedirect("admin-panel/404.html");
			}
		}
	}
}
