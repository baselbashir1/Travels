<%@ page import="java.util.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="classes.*"%>
<%@ page language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Trip Page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet" href="css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet" href="css/templatemo-style.css">

</head>
<%
String query = new String("Select * from trip");
ArrayList<Trip> trips = new ArrayList<Trip>();
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
	Statement stmt = dbConnect.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	if (rs.next()) {
		do {
	int id = (int) rs.getInt("id");
	String name = (String) rs.getString("name");
	String destination = (String) rs.getString("destination");
	float price = (float) rs.getFloat("price");
	//String photo = (String) rs.getString("photo");
	String photo = "../images/" + (String) rs.getString("photo");
	Trip trip = new Trip(id, name, destination, price, photo);
	trips.add(trip);
		} while (rs.next());

		stmt.close();
		dbConnect.close();
	}
} catch (Exception e) {
	out.println(e.getMessage());
}
%>
<body id="reportsPage" style="background-color: #1111">
	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="#">
				<h1 class="tm-site-title mb-0">Admin Panel</h1>
			</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto h-100">

					<li class="nav-item"><a class="nav-link active"
						href="trips.jsp"> Trips </a></li>

					<li class="nav-item"><a class="nav-link active"
						href="travels.jsp"> Travels </a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="login.jsp"><b>Logout</b> </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">NAME</th>
									<th scope="col">DESTINATION</th>
									<th scope="col">PRICE</th>
									<th scope="col">PHOTO</th>
									<th scope="col">OPEARATIONS</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Trip t : trips) {
									int id = t.getID();
									out.print("<tr>");
									out.print("<td>" + t.getID() + "</td>");
									out.print("<td>" + t.getName() + "</td>");
									out.print("<td>" + t.getDestination() + "</td>");
									out.print("<td>" + t.getPrice() + "</td>");
									out.print("<td><img src='" + t.getPhoto() + "' alt='" + t.getPhoto()
									+ "' class='img-fluid d-block mx-auto' style='width:80px;height:80px'></td>");

									out.print("<td>");
									out.print("<a href='../DeleteTripServlet?id=" + id + "'" + "class='tm-product-delete-link'>");
									out.print("<i class='far fa-trash-alt tm-product-delete-icon'></i>");
									out.print("</a>");
									out.print("&nbsp&nbsp");
									out.print("<a href='edit-trip.jsp?id=" + id + "'" + "class='tm-product-edit-link'>");
									out.print("<i class='far fa-trash-alt tm-product-edit-icon'></i>");
									out.print("</a>");
									out.print("</td>");
									out.print("</tr>");
								}
								%>
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="add-trip.jsp"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						Trip</a>
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light">
			<p class="text-center text-white mb-0 px-4 small">
				Copyright &copy; <b>2022</b> All rights reserved. Design: <a
					rel="nofollow noopener" href="https://templatemo.com"
					class="tm-footer-link">Travels</a>
			</p>
		</div>
	</footer>

	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->

</body>
</html>