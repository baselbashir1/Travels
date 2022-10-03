<%@ page import="java.util.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="classes.*"%>
<%@ page language="java"%>
<!DOCTYPE html>
<!--
	ustora by freshdesignweb.com
	Twitter: https://twitter.com/freshdesignweb
	URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Travels Website</title>

<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/responsive.css">

</head>

<body>
	<div class="mainmenu-area">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">Home</a></li>

						<%
						String loggedin = (String) session.getAttribute("loggedin");
						if (loggedin != "True") {
							out.print("<li><a href=" + "login.html" + ">Login</a></li>");
						} else {
							out.print("<li><a href=" + "../LogoutServlet" + "> Logout</a></li>");
							out.print("<li> <a>" + (String) session.getAttribute("nameUser") + "</a></li>");
							out.print("<li> <img src = ../images/" + (String) session.getAttribute("image") + " width = \"50\" ></li>");
						}
						%>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<!-- End mainmenu area -->


	<!-- End main content area -->

	<div class="maincontent-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="latest-product">
						<h2 class="section-title">Travels List</h2>
						<div class="product-carousel">
							<%
							String query2 = new String("Select * from travel");
							ArrayList<Travel> travels = new ArrayList<Travel>();
							try {
								Class.forName("com.mysql.jdbc.Driver");
								Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
								Statement stmt = dbConnect.createStatement();
								ResultSet rs2 = stmt.executeQuery(query2);
								if (rs2.next()) {
									do {
								int travel_id = (int) rs2.getInt("id");
								String travel_name = (String) rs2.getString("name");
								String travel_destination = (String) rs2.getString("destination");
								float travel_price = (float) rs2.getFloat("price");
								String travel_photo = "../images/" + (String) rs2.getString("photo");

								Travel travel = new Travel(travel_id, travel_name, travel_destination, travel_price, travel_photo);
								travels.add(travel);

								out.print("<div class=\"single-product\">");
								out.print("<div class=\"product-f-image\">");
								out.print("<img src=" + travel_photo + " style='width:300px;height:150px;'>");
								out.print("</div>");
								out.print("<h2> " + travel_name + "</h2>");
								out.print("<h2> " + travel_destination + "</h2>");
								out.print("<div class=\"product-carousel-price\">");
								out.print("<ins> $" + travel_price + "</ins>");
								out.print("</div>");
								out.print("</div>");

									} while (rs2.next());
									stmt.close();
									dbConnect.close();
								}

							} catch (Exception e) {
								out.println(e.getMessage());
							}
							%>

						</div>
					</div>
					<br>
					<a href="index.jsp" class="btn btn-primary">Back</a>
				</div>
			</div>
		</div>
	</div>

	<!-- End main content area -->

	<div class="footer-top-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-about-us">
						<h2>
							<span>Travels</span>
						</h2>

						<div class="footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-youtube"></i></a> <a href="#"><i
								class="fa fa-linkedin"></i></a>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">Contact</h2>

					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">Categories</h2>

					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-newsletter">
						<h2 class="footer-wid-title">About Us</h2>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer top area -->

	<div class="footer-bottom-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="copyright">
						<p>
							&copy; 2022 Travels. All Rights Reserved.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer bottom area -->

	<!-- Latest jQuery form server -->
	<script src="https://code.jquery.com/jquery.min.js"></script>

	<!-- Bootstrap JS form CDN -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js"></script>

	<!-- Slider -->
	<script type="text/javascript" src="js/bxslider.min.js"></script>
	<script type="text/javascript" src="js/script.slider.js"></script>
</body>
</html>