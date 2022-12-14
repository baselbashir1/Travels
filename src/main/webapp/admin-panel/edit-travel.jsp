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
<link href="css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<%
int id = Integer.parseInt(request.getParameter("id"));
String query = new String("Select * from travel where id = " + id);
Travel travel = null;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection dbConnect = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelsdb", "root", "");
	Statement stmt = dbConnect.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	if (rs.next()) {
		do {
	String name = (String) rs.getString("name");
	String destination = (String) rs.getString("destination");
	float price = (float) rs.getFloat("price");
	String photo = (String) rs.getString("photo");

	travel = new Travel(id, name, destination, price, photo);
		} while (rs.next());
		stmt.close();
		dbConnect.close();
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
					<ul class="navbar-nav d-none d-md-block d-lg-none">
						<li class="nav-item"><a
							class="nav-toggler nav-link waves-effect waves-light text-white"
							href="javascript:void(0)"><i class="ti-menu ti-close"></i></a></li>
					</ul>
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
						<li><a class="profile-pic" href="#"><span class="text-white font-medium"><% out.print((String) session.getAttribute("name")); %></span></a>
						</li>
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
						<h4 class="page-title">Travels</h4>
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
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
						<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
							<div class="row">
								<div class="col-12">
									<h2 class="tm-block-title d-inline-block">Edit Travel</h2>
								</div>
							</div>
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">
									<%
									out.print(
											"<form action='../UpdateTravelServlet?id=" + travel.getID() + "'" + "method='post' class='tm-edit-product-form'>");
									%>
									<div class="form-group mb-3">
										<label for="name">Travel Name</label>
										<%
										out.print("<input id='name' name='name' type='text' value = '" + travel.getName() + "'"
												+ "class= 'form-control validate'>");
										%>
									</div>
									<div class="form-group mb-3">
										<label for="name">Destination</label>
										<%
										out.print("<input id='destination' name='destination' type='text' value = '" + travel.getDestination() + "'"
												+ "class= 'form-control validate'>");
										%>
									</div>
									<div class="form-group mb-3">
										<label for="price">Price</label>
										<%
										out.print("<input id='price' name='price' type='number' value = '" + travel.getPrice() + "'"
												+ "class= 'form-control validate'>");
										%>
									</div>
								</div>
								
		
								<div class="col-12">
									<button type="submit"
										class="btn btn-primary btn-block text-uppercase">Update
										Travel</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">
				2021 ? Ample Admin brought to you by <a
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
	<!--Wave Effects -->
	<script src="js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="js/custom.js"></script>
</body>

</html>