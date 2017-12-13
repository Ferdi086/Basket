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
<%@include file="Sync/Menu.jsp" %>

<center>
		<h2 style="margin-top:2%"><span>ALL TEAMS</span></h2>

<div class="container-a2">
		<ul class="caption-style-2">                        
                        <c:forEach var = "item" items = "${requestScope.team}">
                            <c:if test="${item.value.flagactive == 'Y'}">
                            <li>                                
				<a onclick="teamdetail('${item.value.id}')"><img src="../img/Team/Logo/${item.value.logo}" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" alt="${item.value.id}" width="200px" height="200px" ></a>
				<div class="caption">
					<div class="blur"></div>
					<div class="caption-text"  onclick="teamdetail('${item.value.id}')">
						<h1><a><c:out value = "${item.value.namateam}"/></a></h1>
					</div>
				</div>
                                
                            </li>
                            </c:if>
                        </c:forEach>
                        
		</ul>
</div>
          
</center>      
<div class="clearfix" style="margin-bottom:5%"></div>

        <%@include file="Sync/footer.jsp" %>

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