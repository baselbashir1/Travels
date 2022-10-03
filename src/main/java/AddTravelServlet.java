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

@WebServlet("/AddTravelServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
//@MultipartConfig

public class AddTravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddTravelServlet() {
		super();
	}

	private String uploadImage(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		boolean result = false;
		String fileName = "";
		try {
			response.setContentType("text/html;charset=UTF-8");
			Part part = request.getPart("file");
			fileName = extractFileName(part);
			String savePath = "C:\\Users\\ASUS\\eclipse-workspace\\PL_Travels\\src\\main\\webapp\\images\\" + fileName;
			part.write(savePath + File.separator);
			result = true;
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return fileName;
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	protected boolean addTravel(String query) {
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
		
		 String image = uploadImage(request, response);

		String name = request.getParameter("name");
		String destination = request.getParameter("destination");
		float price = Float.parseFloat(request.getParameter("price"));
		String photo = request.getParameter("image");
		String query = new String ("INSERT INTO travel (name, destination, price, photo) VALUES ('"+name+"','"+destination+"','"+price+"','"+photo+"')");
		if (addTravel(query)) {
			response.sendRedirect("admin-panel/travel-table.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
