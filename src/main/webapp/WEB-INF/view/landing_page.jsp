<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<title>DEMO</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">


</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="/index">Demo</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="/index">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/register">Register</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/login">Sign in</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/show-users">User Details</a>
				</li>

			</ul>
		</div>
	</nav>


	<div class="container">
		<br />
		<c:choose>

			<c:when test="${mode=='MODE_INDEX' }">

				<div class="jumbotron">
					<h1>Hello from the other side!</h1>
				</div>
			</c:when>

			<c:when test="${mode=='MODE_REGISTER' }">

				<h3>Registration</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-user">
					<input type="hidden" name="id" value="${user.id }" />
					<div class="form-group">
						<label class="control-label col-md-3">Username</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="username"
								value="${user.username }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">First Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="firstname"
								value="${user.firstname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Last Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="lastname"
								value="${user.lastname }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Age </label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="age"
								value="${user.age }" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Password</label>
						<div class="col-md-7">
							<input type="password" class="form-control" name="password"
								value="${user.password }" />
						</div>
					</div>
					<div class="form-group ">
						<input type="submit" class="btn btn-primary" value="Register" />
					</div>
				</form>
				<br />

			</c:when>
			<c:when test="${mode=='ALL_USERS' }">
				<div class="container text-center" id="tasksDiv">
					<h3>All Users</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Id</th>
									<th>UserName</th>
									<th>First Name</th>
									<th>LastName</th>
									<th>Age</th>
									<th>Delete</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${users }">
									<tr>
										<td>${user.id}</td>
										<td>${user.username}</td>
										<td>${user.firstname}</td>
										<td>${user.lastname}</td>
										<td>${user.age}</td>
										<td><a href="/delete-user?id=${user.id }"><span>DELETE</span></a></td>
										<td><a href="/edit-user?id=${user.id }"><span>EDIT</span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>

			<c:when test="${mode=='MODE_UPDATE' }">
				<div class="container text-center">
					<h3>Update User</h3>
					<hr>
					<form class="form-horizontal" method="POST" action="save-user">
						<input type="hidden" name="id" value="${user.id }" />
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									value="${user.username }" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">First Name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="firstname"
									value="${user.firstname }" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Last Name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="lastname"
									value="${user.lastname }" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Age </label>
							<div class="col-md-3">
								<input type="text" class="form-control" name="age"
									value="${user.age }" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Password</label>
							<div class="col-md-7">
								<input type="password" class="form-control" name="password"
									value="${user.password }" />
							</div>
						</div>
						<div class="form-group ">
							<input type="submit" class="btn btn-primary" value="Update" />
						</div>
					</form>
				</div>
			</c:when>

			<c:when test="${mode=='MODE_LOGIN' }">
				<div class="container text-center">
					<h3>User Login</h3>
					<hr>
					<form class="form-horizontal" method="POST" action="/login-user">
						<c:if test="${not empty error }">
							<div class="alert alert-danger">
								<c:out value="${error }"></c:out>
							</div>
						</c:if>
						<div class="form-group">
							<label class="control-label col-md-3">Username</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="username"
									value="${user.username }" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Password</label>
							<div class="col-md-7">
								<input type="password" class="form-control" name="password"
									value="${user.password }" />
							</div>
						</div>
						<div class="form-group ">
							<input type="submit" class="btn btn-primary" value="Login" />
						</div>
					</form>
				</div>
			</c:when>



		</c:choose>

	</div>
	<!-- /container  -->


	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>