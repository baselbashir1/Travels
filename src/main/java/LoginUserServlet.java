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

@WebServlet("/LoginUserServlet")
public class LoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	private ArrayList<User> getUser(String query) {
		ArrayList<User> users = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
			Statement stmt = dbConnect.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				do {
					users = new ArrayList<User>();
					String name = rs.getString("name");
					String username = rs.getString("username");
					String email = rs.getString("email");
					String password = rs.getString("password");
					User user = new User(name, username, email, password);
					users.add(user);
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
		//doGet(request, response);

		String query = new String("Select * from user");
		ArrayList<User> users = (ArrayList<User>) getUser(query);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		for (User user : users) {
			String userUserName = user.getUsername();
			String userPassword = user.getPassword();
			if (userUserName.equals(username) && userPassword.equals(password)) {
				String userName = user.getName();
				session.setAttribute("loggedin", "True");
				session.setAttribute("name", userName);
				response.sendRedirect("template/index.jsp");
				break;
			} else {
				response.sendRedirect("admin-panel/404.html");
			}
		}
	}
}
