<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Shopping.model.Message" %>

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
	
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- clip path -->
<style>
.banner
{
clip-path: circle(94.0% at 0 51%);
}
</style>

<title>Hello, world!</title>
</head>
<body>
	<!-- NaV BAR -->
	<%@ include file="navbar.jsp"%>

			<!-- Altert if login is wrong -->

					<%  HttpSession s = request.getSession();
						Message msg=(Message)s.getAttribute("message");
						if(msg!=null)
						{
					%>
					<div class="alert <%=msg.getCssClass() %>">
						<%=msg.getContent() %>
					</div>
					<%
					  s.removeAttribute("message");
						}
					%>

	<!-- image on left side-->
	<div class="container-fluid ml-0 pl-0">
		<div class="row">
			<div class="col-5 banner">
				<image  class="banner" src="https://source.unsplash.com/700x655/?technology,dark"
					alt=" This is the login page" class="img-fluid"> </image>
			</div>
			<div class="col-6 pt-3 mt-1 ml-4">
			<!-- Login card-->
				<div class="card">
					<div class="card-header text-center primary-background text-light" ><span class="fa fa-user-plus fa-3x"></span>
					<br>
					
					<span style=" font-weight:bold;"><h3>Register here</h3></span>
					</div>
					<div class="card-body">
					<!-- form -->
						<form id="reg-form" action="register" method="Post">
							<div class="form-group">
								<label for="User Name">User Name</label> 
								<input type="text"  name="name"class="form-control" id="UserName"
									placeholder="Enter the User Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label>Gender</label> <br/>
								<input type="radio" name=gender id="male" value="male">
								<label for="Male">Male</label>
								<input type="radio"  name=user_gender id="Female" value="Female">
								<label for="Female">Female</label>
					
							</div>
							
							 <br>
							 
							  <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                
                                
							<button id="sumbimt-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
					<!--<div class="card-footer"></div>-->

				</div>

			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	\
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>



	
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

</body>
</html>