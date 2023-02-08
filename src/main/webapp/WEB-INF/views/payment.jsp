<%@ page import="Shopping.model.*"%>
<%@ page
	import="Shopping.model.*,Shopping.dao.*,Shopping.helper.*,java.util.*,java.lang.*"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Hello, world!</title>
<style>
.primary-background {
	background: #48D1CC;
	color: red
}
</style>
</head>
<body>
	<%
	HttpSession hs = request.getSession();
	User user = (User) hs.getAttribute("user");
	if (user == null) {
		System.out.print("This is the profile inside null");
		response.sendRedirect("login");

		return;
	}
	System.out.print(hs.getServletContext().getRealPath("/"));

	String name = user.getName();
	%>
	<nav
		class="navbar navbar-expand-lg  navbar-light primary-background text-dark"
		style="color: red;">
		<a class="navbar-brand mb-0 h1" href="#">SHOPPING</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div>
			</ul>

			<a class="btn btn-warning btn" href="logout">Logout</a>
		</div>
	</nav>
	<!-- End of Nav bar -->


	<div class="row mt-4 ml-2">

		<div class="col-8">
			<h3>Payment</h3>
			<form>
				<label for="fname">Accepted Cards</label> <label for="cname">Name
					on Card</label> <input type="text" class="form-control" id="cname"
					name="cardname" placeholder="Card Name"> <label for="ccnum">Credit
					card number</label> <input type="text" class="form-control" id="ccnum"
					name="cardnumber" placeholder="">


				<div class="row">
					<div class="col-6">
						<div class=row>
							<div class="col-6">
								<label for="expmonth">Exp Month</label> <input type="text"
									id="expmonth" name="expmonth" placeholder="">
							</div>
							<div class=col-6>
								<label for="expyear">Exp Year</label> <input type="text"
									class="form-control" id="expyear" name="expyear" placeholder="">
							</div>
						</div>
					</div>
					<div class="col-6">
						<label for="cvv">CVV</label> <input type="text"
							class="form-control" id="cvv" name="cvv" placeholder="">
					</div>
				</div>
				<input type="submit" class="btn btn-primary pull-right mt-5 ml-6"
					value="Continue For Final Payment">
			</form>
		</div>





	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>