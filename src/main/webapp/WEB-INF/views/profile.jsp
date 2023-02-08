<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="Shopping.model.*,Shopping.dao.*,Shopping.helper.*,java.util.*,java.lang.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.primary-background {
	background: #48D1CC;
	color: red
}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value="/resources/css/style.css" />">
<script src="<c:url value="/resources/js/script.js"/>">
	
</script>

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
			<%
			CartDao cdx = new CartDao(ConnectionProvider.getConnection());

			List<Cart> cx = cdx.getAllCartItemByUserId(user.getId());
			%>
			<a class="nav-link" href="#"> <span
				class="fa fa-user-circle fa-lg"></span> <span
				style="font-size: 23px; color: black"> <%=user.getName()%></span></a> <a
				class="nav-link " href="#" style="font-size: 19px;"
				data-toggle="modal" data-target="#exampleModal"><span
				class="fa fa-cart-plus" style="font-size: 25px; font-color: red"></span>
				Cart<span>(<%=cx.size()%>)
			</span></a> <a class="btn btn-warning btn" href="logout">Logout</a>
		</div>
	</nav>
	<!-- End of Nav bar -->

	<%
	HttpSession s = request.getSession();
	Message msg = (Message) s.getAttribute("message");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>">
		<%=msg.getContent()%>
	</div>
	<%
	s.removeAttribute("message");
	}
	%>

	<!-- Start of body -->

	<%
	ProductDao pd = new ProductDao(ConnectionProvider.getConnection());
	%>

	<div class="container-fluid mt-2">
		<div class="row">
			<!-- categories list -->
			<div class="col-3">
				<ul class="list-group">
					<li class="list-group-item active">All Categories</li>

					<%
					List<Categories> cat = pd.getAllCategories();
					for (Categories categories : cat) {
					%>
					<li class="list-group-item"><%=categories.getCname()%></li>

					<%
					}
					%>

				</ul>


			</div>
			<!-- End of Ctegories List -->

			<!-- Start of product -->
			<div class="col-9">
				<div class="row">

					<%
					List<Product> product = pd.getAllProduct();
					for (Product p : product)

					{
					%>
					<div class="col-4 mt-4">
						<div class="card" style="width: 22rem;">
							<img src="resources/image/<%=p.getPimage()%>"
								style="height: 400px;" alt="Card image cap">
							<div class="card-title">
								<h5 class="card-title"><%=p.getPname()%></h5>
							</div>
							<div class="card-body" style="height: 100px;">

								<p class="card-text"><%=p.getPdescription()%></p>

							</div>
							<div class="card-footer">
								<form action="addtocart" method="post">
									<input type="hidden" name="userid" value="<%=user.getId()%>">
									<input type="hidden" name="productid" value="<%=p.getPid()%>">
									<div class="form-group col-10">

										<%
										SizeDao sd = new SizeDao(ConnectionProvider.getConnection());
										List<String> size = sd.getSizebyPid(p.getPid());
										List<String> colour=sd.getColorbyPid(p.getPid());
										System.out.print(size.size());
										if (size.size() == 0) {
										%>

										<div Style="color: red">out of stock</div>

										<%
										} else {
										%>
										<div class=row>
										<div class="col-6">
										<label for="inputState">Select Size</label> <select
											id="inputState" name="size" class="form-control">
											<option disabled autofocus>Select the Size</option>
											<%
											for (String productSize : size) {
											%>
											<option selected value="<%=productSize%>"><%=productSize%></option>
										

											<%
											}
											
											%>
										</select>
										</div>
										<div class="col-6">
											<label for="inputState1">Select Colour</label> <select
											id="inputState1" name="colour" class="form-control">
											<option disabled autofocus>Select the Colour</option>
											<%
											for (String productColour : colour) {
											%>
											<option selected value="<%=productColour%>"><%=productColour%></option>
										

											<%
											}
											}
											%>
										</select>
										</div></div>
										
										
									</div>

									<input type="submit" class="btn btn-primary pull-right"
										value="AddTOCart">
								</form>
								<a href='#' class="btn btn-primary btn-info disabled ">&#8377;
									<%=p.getPprice()%></a>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>



			</div>
		</div>
	</div>





	<%@ include file="common_model.jsp"%>




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