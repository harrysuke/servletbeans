<%@page import="javax.servlet.http.HttpSession" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">JSP MySQL CRUD</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
	  <%
	  HttpSession s = request.getSession();
	  out.println(s.getAttribute("name"));
	  if(s.getAttribute("name") != null){
	  %>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="viewusers.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="adduserform.jsp">Add user</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="searchform.jsp">Search</a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="logout.jsp">Log Out</a>
        </li>
	  <%}else{%>
		<li class="nav-item">
          <a class="nav-link" href="login.jsp">Log In</a>
        </li>
	  <%}%>
      </ul>
    </div>
  </div>
</nav>