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

<title>Checkout</title>
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
				<li class="nav-item active"><a class="nav-link" href="profile">Home
						<span class="sr-only">(current)</span>
				</a></li>

		
			</ul>

			<a class="btn btn-warning btn" href="logout">Logout</a>
		</div>
	</nav>
	<!-- End of Nav bar -->

	<center>
		<h2>SECURE CHECKOUT</h2>
	</center>



	<!-- 
	Start of my cart table -->
	<div class="container">
		<div class="row">
			<div class="col-7">
				<form action="payment">

					<div class="row">
						<div class="col-9">
							<h3>Billing Address</h3>

							<div class="form-group">
								<label for="fname"> Full Name</label> <input type="text"
									class="form-control" id="fname" name="firstname"
									placeholder="Enter Full Name" value=<%=user.getName()%>>
								<label for="email"><i></i> Email</label> <input type="text"
									class="form-control" id="email" name="email"
									placeholder="Enter Email" value=<%=user.getEmail()%>>
							</div>
							<label for="adr"> Address</label> <input type="text"
								class="form-control" id="adr" name="address"
								placeholder="Enater Address"> <label for="city">
								City</label> <input type="text" class="form-control" id="city"
								name="city" placeholder="City">

							<div class="row">
								<div class="col-6">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" name="state"
										placeholder="State">
								</div>
								<div class="col-50">
									<label for="zip">Zip</label> <input type="text"
										class="form-control" id="zip" name="zip" placeholder="Pincode">
								</div>
							</div>
						</div>





					</div>
					<input type="submit" class="btn btn-primary pull-right mt-5 ml-6"
						value="Continue to checkout">

				</form>




			</div>
			<div class=" col-5">

				<h4>PAYMENT SUMMARY</h4>
				<%
				HttpSession hs1 = request.getSession();

				User user1 = (User) hs1.getAttribute("user");
				CartDao cd = new CartDao(ConnectionProvider.getConnection());

				List<Cart> c1 = cd.getAllCartItemByUserId(user1.getId());
				%>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ProductName</th>
							<th scope="col">Quantity</th>
							<th scope="col">size</th>
							<th scope="col">Colour</th>
							<th scope="col">price</th>
							
							<th scope="col">Delete Product</th>


						</tr>
					</thead>
					<tbody>
						<%
						int total = 0;
						for (Cart c2 : c1) {
						%>
						<tr>

							<td><%=c2.getItemname()%></td>
							<td><%=c2.getQuantity()%></td>
							<td><%=c2.getSize()%></td>
							<td><%=c2.getColour()%></td>
							<td><%=c2.getPrice()%></td>
							
							<td><a href="deletecartproduct/<%=c2.getCid()%>">delete</a></td>
							<%
							total = total + c2.getPrice();
							%>

						</tr>
						<%
						}
						%>

						<tr>

							<th>Total</th>
							<th></th>
							<th></th>
							<th></th>
							<th><%=total%></th>


						</tr>
					</tbody>

				</table>

			</div>

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