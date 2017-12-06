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
<link rel="stylesheet" href="css/styles.css"> 
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
 <style>
 .heading h3 {
   width: 100%; 
   text-align: center; 
   border-bottom: 2px solid #ffcc00; 
   line-height: 0.1em;
	} 

	.heading h3 span { 
		background-color: white;
	    color:#23B684;
	    padding:0 10px; 
	}
	</style>
</head>
<body>
<%@include file="Sync/Menu.jsp" %>

	
	<div class="col-lg-12 col-md-12 a_detail">
            <c:forEach var="item" items="${requestScope.news}">
               <center>
                        <h2>${item.value.judul}</h2>
                        <p class="a_det_tgl"> ${item.value.tgl}</p>
                        <img src="images/news/${item.value.foto}"><br>
                </center>
                        <div class="col-lg-10 col-lg-offset-1 a_det_isi">
                        <p>${item.value.desk}</p>
                        </div> 
            </c:forEach>
	
	</div>
	<section class="blog" id="blog">
	<div class="container">
		<div class="heading">
			<h3><span>Post</span></h3>
		</div>
		<div class="blog-grids">
                <c:forEach var='item' items='${requestScope.nl}'>
                    <div class="col-md-4 blog-grid">
                            <a href="#" onclick="detail(${item.value.id})"><img src="images/news/${item.value.foto}" alt="" /></a>
                            <h5>${item.value.tgl}</h5>
                            <h4><a href="#" onclick="detail(${item.value.id})">${item.value.judul}</a></h4>
                            <p> ${item.value.desk}...</p>
                            <div class="readmore-w3" onclick="detail(${item.value.id})">
                                    <a class="readmore" href="#" >Read More</a>
                            </div>
                    </div>
                </c:forEach>
		<div class="clearfix"></div>
		</div>
	</div>
            
</section>	
    
    
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
