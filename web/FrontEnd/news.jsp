<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
<link rel="stylesheet" href="css/styles.css"> 
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->

</head>
<body>
<%@include file="Sync/Menu.jsp" %>

<center>
		<h2 style="margin-top:2%"><span>NEWS</span></h2>
</center>
<div class="container-fluid artikel">
    <c:forEach var="item" items="${requestScope.nl}">
	<div class="row a_box">
		<div class="col-md-3 col-sm-5 a_gbr" onclick="detail(${item.value.id})">
			<a href="#" onclick="detail(${item.value.id})"><img src="images/news/${item.value.foto}" class="img-responive"/></a>
		</div>
		<div class="col-lg-6 col-md-7 col-sm-7 a_jud">
                        <h3 onclick="detail(${item.value.id})"><a href="#">${item.value.judul}</a></h3><br>
			<p class="a_tgl"><span class="glyphicon glyphicon-calendar"> </span>  ${item.value.tgl}</p>
			<p>${item.value.desk}...</p>
			<div class="w3ls-button pull-right" onclick="detail(${item.value.id})">
				<a href="#">Read More</a>
			</div>
		</div>
	</div>
    </c:forEach>
</div>


        <%@include file="Sync/footer.jsp" %>
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	

<script>
    function detail(id){
        var form = document.createElement("form");
        form.setAttribute("method", "POST");
        form.setAttribute("action", "NewsDetails");
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "id_n");
        hiddenField.setAttribute("value", id);
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
    }
    
</script>



<!-- //js-scripts -->
</body>
</html>
