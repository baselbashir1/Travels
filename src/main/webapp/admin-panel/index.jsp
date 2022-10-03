<%@ page import="java.util.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="classes.*"%>
<%@ page language="java"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>Admin Panel</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/ample-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="plugins/images/favicon.png">
<!-- Custom CSS -->
<link href="plugins/bower_components/chartist/dist/chartist.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
<!-- Custom CSS -->
<link href="css/style.min.css" rel="stylesheet">
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
<%
String query2 = new String("Select * from travel");
ArrayList<Travel> travels = new ArrayList<Travel>();
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection dbConnect2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
	Statement stmt2 = dbConnect2.createStatement();
	ResultSet rs2 = stmt2.executeQuery(query2);
	if (rs2.next()) {
		do {
	int id_travel = (int) rs2.getInt("id");
	String name_travel = (String) rs2.getString("name");
	String destination_travel = (String) rs2.getString("destination");
	float price_travel = (float) rs2.getFloat("price");
	String photo_travel = "../images/" + (String) rs2.getString("photo");
	Travel travel = new Travel(id_travel, name_travel, destination_travel, price_travel, photo_travel);
	travels.add(travel);
		} while (rs2.next());
		stmt2.close();
		dbConnect2.close();
	}
} catch (Exception e) {
	out.println(e.getMessage());
}
%>
<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin6">
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<a class="navbar-brand" href="dashboard.html"> <!-- Logo icon -->
						<b class="logo-icon"> <!-- Dark Logo icon --> <img
							src="plugins/images/logo-icon.png" alt="homepage" />
					</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
							<!-- dark Logo text --> <img src="plugins/images/logo-text.png"
							alt="homepage" />
					</span>
					</a>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<a
						class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<!-- ============================================================== -->
				<!-- End Logo -->
				<!-- ============================================================== -->
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">

					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav ms-auto d-flex align-items-center">

						<!-- ============================================================== -->
						<!-- Search -->
						<!-- ============================================================== -->
						<li class=" in">
							<form role="search" class="app-search d-none d-md-block me-3">
								<input type="text" placeholder="Search..."
									class="form-control mt-0"> <a href="" class="active">
									<i class="fa fa-search"></i>
								</a>
							</form>
						</li>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
						<li><a class="profile-pic" href="#"><span class="text-white font-medium"><% out.print((String) session.getAttribute("username")); %></span></a>
						</li>
						<%
						String loggedin = (String) session.getAttribute("loggedin");
						if (loggedin != "True") {
							out.print("<li><a href=" + "login.jsp" + ">Login</a></li>");
						} else {
						//	out.print("<li><a href=" + "../LogoutAdminServlet" + "> Logout</a></li>");
							out.print("<li><a href=" + "../admin-panel/login.jsp" + "> Logout</a></li>");
							//HttpSession sesssion = request.getSession();
							//sesssion.invalidate();
							out.print("<li> <a>" + (String) session.getAttribute("username") + "</a></li>");
						}
						%>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
					</ul>
					
				</div>
			</nav>
		</header>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin6">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<!-- User Profile-->
						<li class="sidebar-item pt-2"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="index.jsp" aria-expanded="false"> <i
								class="far fa-clock" aria-hidden="true"></i> <span
								class="hide-menu">Dashboard</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="trip-table.jsp" aria-expanded="false"> <i
								class="fa fa-table" aria-hidden="true"></i> <span
								class="hide-menu">Trip Table</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="travel-table.jsp" aria-expanded="false"> <i
								class="fa fa-table" aria-hidden="true"></i> <span
								class="hide-menu">Travel Table</span>
						</a></li>
					</ul>

				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb bg-white">
				<div class="row align-items-center">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Dashboard</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<div class="d-md-flex">
							<ol class="breadcrumb ms-auto">
								<li><a href="#" class="fw-normal">Dashboard</a></li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Three charts -->
				<!-- ============================================================== -->
				<div class="row justify-content-center">
					<div class="col-lg-4 col-md-12">
						<div class="white-box analytics-info">
							<h3 class="box-title">Total Visit</h3>
							<ul class="list-inline two-part d-flex align-items-center mb-0">
								<li>
									<div id="sparklinedash">
										<canvas width="67" height="30"
											style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
									</div>
								</li>
								<li class="ms-auto"><span class="counter text-success">659</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="white-box analytics-info">
							<h3 class="box-title">Total Page Views</h3>
							<ul class="list-inline two-part d-flex align-items-center mb-0">
								<li>
									<div id="sparklinedash2">
										<canvas width="67" height="30"
											style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
									</div>
								</li>
								<li class="ms-auto"><span class="counter text-purple">869</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="white-box analytics-info">
							<h3 class="box-title">Unique Visitor</h3>
							<ul class="list-inline two-part d-flex align-items-center mb-0">
								<li>
									<div id="sparklinedash3">
										<canvas width="67" height="30"
											style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
									</div>
								</li>
								<li class="ms-auto"><span class="counter text-info">911</span>
								</li>
							</ul>
						</div>
					</div>
				</div>


				<!-- ============================================================== -->
				<!-- Trip Table -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12 col-lg-12 col-sm-12">
						<div class="white-box">
							<div class="d-md-flex mb-3">
								<h3 class="box-title mb-0">Trip Table</h3>
								<div class="col-md-3 col-sm-4 col-xs-6 ms-auto">
									<select class="form-select shadow-none row border-top">
										<option>March 2021</option>
										<option>April 2021</option>
										<option>May 2021</option>
										<option>June 2021</option>
										<option>July 2021</option>
									</select>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table no-wrap">
									<thead>
										<tr>
											<th class="border-top-0">#</th>
											<th class="border-top-0">NAME</th>
											<th class="border-top-0">DESTINATION</th>
											<th class="border-top-0">PRICE</th>
											<th class="border-top-0">PHOTO</th>
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
											out.print("</tr>");
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- ============================================================== -->
				<!-- Travel Table -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12 col-lg-12 col-sm-12">
						<div class="white-box">
							<div class="d-md-flex mb-3">
								<h3 class="box-title mb-0">Travel Table</h3>
								<div class="col-md-3 col-sm-4 col-xs-6 ms-auto">
									<select class="form-select shadow-none row border-top">
										<option>March 2021</option>
										<option>April 2021</option>
										<option>May 2021</option>
										<option>June 2021</option>
										<option>July 2021</option>
									</select>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table no-wrap">
									<thead>
										<tr>
											<th class="border-top-0">#</th>
											<th class="border-top-0">NAME</th>
											<th class="border-top-0">DESTINATION</th>
											<th class="border-top-0">PRICE</th>
											<th class="border-top-0">PHOTO</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (Travel t : travels) {
											int id = t.getID();
											out.print("<tr>");
											out.print("<td>" + t.getID() + "</td>");
											out.print("<td>" + t.getName() + "</td>");
											out.print("<td>" + t.getDestination() + "</td>");
											out.print("<td>" + t.getPrice() + "</td>");
											out.print("<td><img src='" + t.getPhoto() + "' alt='" + t.getPhoto()
											+ "' class='img-fluid d-block mx-auto' style='width:80px;height:80px'></td>");

											out.print("</tr>");
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">
				2021 © Ample Admin brought to you by <a
					href="https://www.wrappixel.com/">wrappixel.com</a>
			</footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/app-style-switcher.js"></script>
	<script
		src="plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="js/custom.js"></script>
	<!--This page JavaScript -->
	<!--chartis chart-->
	<script src="plugins/bower_components/chartist/dist/chartist.min.js"></script>
	<script
		src="plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="js/pages/dashboards/dashboard1.js"></script>

</body>

</html>