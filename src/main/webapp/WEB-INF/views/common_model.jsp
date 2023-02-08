<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Shopping.model.User" %>
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

<title>My Cart</title>
</head>
<body>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">My Cart</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<% HttpSession hs1 = request.getSession();
				
				User user1 =(User)hs1.getAttribute("user");
				CartDao cd=new CartDao(ConnectionProvider.getConnection());
				
				List<Cart> c1=cd.getAllCartItemByUserId(user1.getId());
				
				%>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">ProductName</th>
								<th scope="col">Quantity</th>
								<th scope="col">size</th>
								<th scope="col">Colour</th>
								<th scope="col">price</th>
								
							
							</tr>
						</thead>
						<tbody>
						<%int total=0;
						for(Cart c2:c1)
						{
						%>
							<tr>
								
								<td><%=c2.getItemname() %></td>
								<td><%=c2.getQuantity() %></td>	
								<td><%=c2.getSize() %></td>
								<td><%=c2.getColour() %></td>
								<td><%=c2.getPrice() %></td>
								<% total= total+c2.getPrice();%>
								
							</tr>
						<%} %>	
						
						<tr>
								
								<th>Total</th>
								<th> </th>
								<th> </th>
								<th></th>
								<th><%=total %></th>
								
								
							</tr>
						</tbody>
						
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a  href="checkout" type="button" class="btn btn-primary">Checkout</a>
				</div>
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