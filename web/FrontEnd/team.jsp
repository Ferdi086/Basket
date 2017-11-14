<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>BasketApps</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--// Meta tag Keywords -->

<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all" /><!-- for testimonials -->

<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="css/team_hover.css"> 
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->

</head>
<body>
<div class="header">
		<nav class="navbar navbar-default">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" onclick="myFunction(this)">
							<span class="sr-only">Toggle navigation</span>
							<div class="contain" >
								<div class="bar1"></div>
								<div class="bar2"></div>
								<div class="bar3"></div>
							</div>
							<script>
									function myFunction(x) {
									    x.classList.toggle("change");
									}
								</script>
						</button>
						<h1><a href="index.jsp"><span>Basket</span>Apps</a></h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a class="hvr-underline-from-center active" href="index.jsp">
							<span class="glyphicon glyphicon-home"> </span> Home</a>
							</li>
							<li><a class="hvr-underline-from-center active" href="news.jsp">
							<span class="glyphicon glyphicon-comment"> </span> News</a>
							</li>
							<li><a href="Teams" class="hvr-underline-from-center">
							<span class="glyphicon glyphicon-th-large"> </span> Teams</a>
							</li>
							<li><a href="player.jsp" class="hvr-underline-from-center"> 
							<span class="glyphicon glyphicon-user"> </span> Players</a></li>
							<li><a href="gallery.jsp" class="hvr-underline-from-center">
							<span class="glyphicon glyphicon-unchecked"> </span> Gallery</a>
							</li>
							<li><a href="#" data-toggle="dropdown"><span data-hover="ShortCodes">
							<span class="glyphicon glyphicon-stats"> </span> Statistics</span><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="team_stat.jsp"><span data-hover="Icons">Team Statistics</span></a></li>
									<li><a href="player_stat.jsp"><span data-hover="Typograpghy">Player Statistics</span></a></li>
								</ul>
							</li>	
							<li>
							<a href="#" id='search_ic' ><span data-toggle="modal" data-target=".search-modal" class="glyphicon glyphicon-search"></span></a>
							</li>
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
</div>

<center>
		<h2 style="margin-top:2%"><span>ALL TEAMS</span></h2>

<div class="container-a2">
		<ul class="caption-style-2">                        
                        <c:forEach var = "item" items = "${requestScope.team}">
                            <li >                                
				<a onclick="teamdetail('${item.value.id}')"><img src="../img/Team/Logo/${item.value.logo}" alt="${item.value.id}" width="200px" height="200px" ></a>
				<div class="caption">
					<div class="blur"></div>
					<div class="caption-text"  onclick="teamdetail('${item.value.id}')">
						<h1><a><c:out value = "${item.value.nama_team}"/></a></h1>
					</div>
				</div>
                                
                            </li>
                        </c:forEach>
                        
		</ul>
</div>
</center>
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	
<script>
    function teamdetail(id){
        
        var form = document.createElement("form");
        form.setAttribute("method", "POST");
        form.setAttribute("action", "TeamDetails");
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "ID_T");
        hiddenField.setAttribute("value", id);
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
        
    }
</script>




<!-- //js-scripts -->
</body>
</html>