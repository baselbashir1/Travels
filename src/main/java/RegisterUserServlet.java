import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/RegisterUserServlet")
@MultipartConfig

public class RegisterUserServlet extends HttpServlet {
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String query = new String ("INSERT INTO user (name, username, email, password) VALUES ('"+name+"','"+username+"','"+email+"','"+password+"')");
		if (registerUser(query)) {
			String userName = name;
			// String userImageName = user.getImageName();
			session.setAttribute("loggedin", "True");
			session.setAttribute("name", userName);
			response.sendRedirect("template/index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
