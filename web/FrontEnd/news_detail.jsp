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
						<h1><a href="Home"><span>Basket</span>Apps</a></h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a class="hvr-underline-from-center active" href="Home">
							<span class="glyphicon glyphicon-home"> </span> Home</a>
							</li>
							<li><a class="hvr-underline-from-center active" href="News">
							<span class="glyphicon glyphicon-comment"> </span> News</a>
							</li>
							<li><a href="Teams" class="hvr-underline-from-center">
							<span class="glyphicon glyphicon-th-large"> </span> Teams</a>
							</li>
							<li><a href="Players" class="hvr-underline-from-center"> 
							<span class="glyphicon glyphicon-user"> </span> Players</a></li>
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
</div>

	
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
		<div class="col-md-4 blog-grid">
			<a href="#" data-toggle="modal" data-target="#myModal"><img src="images/news/1.jpg" alt="" /></a>
			<h5>June 10,2017</h5>
			<h4><a href="#" data-toggle="modal" data-target="#myModal">Kevin Durant dan Stephen Curry Selamatkan Muka Golden State Warriors</a></h4>
			<p> Hampir kalah atau tepatnya hampir malu di rumah sendiri. Itulah yang terjadi saat...</p>
			<div class="readmore-w3">
				<a class="readmore" href="#" data-toggle="modal" data-target="#myModal">Read More</a>
			</div>
		</div>
		<div class="col-md-4 blog-grid">
			<a href="#" data-toggle="modal" data-target="#myModal"><img src="images/news/2.jpeg" alt="" /></a>
			<h5>June 17,2017</h5>
			<h4><a href="#" data-toggle="modal" data-target="#myModal">Arki Dikania Wisnu, Pemain Basket Termahal di IBL 2017-2018</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipi scingelit. Vestibulum orci justo, vehicula vel sapien et, feugiat tristique.</p>
			<div class="readmore-w3">
				<a class="readmore" href="#" data-toggle="modal" data-target="#myModal">Read More</a>
			</div>
		</div>
		<div class="col-md-4 blog-grid">
			<a href="#" data-toggle="modal" data-target="#myModal"><img src="images/news/3.jpg" alt="" /></a>
			<h5>June 26,2017</h5>
			<h4><a href="#" data-toggle="modal" data-target="#myModal">Fadlan Minallah Memperkuat Siliwangi Bandung</a></h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipi scingelit. Vestibulum orci justo, vehicula vel sapien et, feugiat sapien. Integer sit amet.</p>
			<div class="readmore-w3">
				<a class="readmore" href="#" data-toggle="modal" data-target="#myModal">Read More</a>
			</div>
		</div>
		<div class="clearfix"></div>
		</div>
	</div>
</section>	
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	





<!-- //js-scripts -->
</body>
</html>
