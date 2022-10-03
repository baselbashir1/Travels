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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	private ArrayList<?> getUser(String query, String type) {
		ArrayList users = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
			Statement stmt = dbConnect.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				do {
					if (type == "user") {
						users = new ArrayList<User>();
						String name = rs.getString("name");
						String username = rs.getString("username");
						String email = rs.getString("email");
						String password = rs.getString("password");
						// String imageName = rs.getString("image");
						User user = new User(name, username, email, password);
						users.add(user);
					} else if (type == "admin") {
						users = new ArrayList<Admin>();
						String username = rs.getString("username");
						String password = rs.getString("password");
						// String role = rs.getString("role");
						Admin admin = new Admin(username, password);
						users.add(admin);
					}
				} while (rs.next());
				stmt.close();
				dbConnect.close();
			}

		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return users;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		doGet(request, response);

		String isAdmin = request.getParameter("admin");

		if (isAdmin == null) {
			String query = new String("Select * from user");
			ArrayList<User> users = (ArrayList<User>) getUser(query, "user");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			for (User user : users) {
				String userUserName = user.getUsername();
				String userPassword = user.getPassword();
				if (userUserName.equals(username) && userPassword.equals(password)) {
					String userName = user.getName();
					// String userImageName = user.getImageName();
					session.setAttribute("loggedin", "True");
					session.setAttribute("name", userName);
					// session.setAttribute("image", userImageName);
					response.sendRedirect("template/index.jsp");
					break;
				} else {
					response.sendRedirect("admin-panel/404.html");
				}

			}
		} else {
			String query = new String("Select * from admin");
			ArrayList<Admin> admins = (ArrayList<Admin>) getUser(query, "admin");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			for (Admin admin : admins) {
				String adminUserName = admin.getUsername();
				String adminPassword = admin.getPassword();
				if (adminUserName.equals(username) && adminPassword.equals(password)) {
					response.sendRedirect("admin-panel/index.jsp");
					break;
				} else {
					response.sendRedirect("admin-panel/404.html");
				}
			}
		}
	}

}
