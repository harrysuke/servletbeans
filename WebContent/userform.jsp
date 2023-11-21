<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<a href="viewusers.jsp">View all records</a>
<h1>Add new user</h1>

<form action="adduser.jsp" method="post">

<div class="mb-3">
<input type="text" name="name" placeholder="Name" class="form-control"/>
</div>
<div class="mb-3">
<input type="password" name="password" placeholder="Password" class="form-control"/>
</div>
<div class="mb-3">
<input type="email" name="email" placeholder="Email" class="form-control"/>
</div>
<div class="mb-3">
<label for="radioMale" class="form-label">Male</label>
<input type="radio" name="sex" value="male" id="radioMale" class="form-check-input"/>
</div>
<div class="mb-3">
<label for="radioFemale" class="form-label">Female</label>
<input type="radio" name="sex" value="female" id="radioFemale" class="form-check-input"/>
</div>
<div class="mb-3">
<select name="country" class="form-select">
<option value="Malaysia">Malaysia</option>
<option value="Indonesia">Indonesia</option>
<option value="Thailand">Thailand</option>
<option value="Singapore">Singapore</option>
<option value="Philipine">Philipine</option>
</select>
</div>
<div class="mb-3">
<button type="submit" name="submit" class="btn btn-primary">Submit</button>
</div>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>