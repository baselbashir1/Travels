import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import classes.Admin;

@WebServlet("/RegisterAdminServlet")
@MultipartConfig

public class RegisterAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected boolean registerUser(String query) {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String query = new String("INSERT INTO admin (name, username, password) VALUES ('" + name + "','" + username
				+ "','" + password + "')");
		if (registerUser(query)) {

			String q = new String("Select * from admin");
			ArrayList<Admin> admins = (ArrayList<Admin>) getAdmin(q);
			session.setAttribute("loggedin", "True");
			session.setAttribute("username", username);
			response.sendRedirect("admin-panel/index.jsp");
			break;
		}

		response.sendRedirect("admin-panel/index.jsp");
	}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
