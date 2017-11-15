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
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
<style>
	.nav-tabs > li {
    max-width: 140px;
	}
	.nav-tabs .active a{
		color:#23B684 !important;
	}
	.nav-tabs{
		margin-top: 2%;
	}
	.nav-tabs > li > a{
		color:white;
	}
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
						<h1><a href="index.jsp"><span>Basket</span>Apps</a></h1>
					</div>
					<!-- navbar-header -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a class="hvr-underline-from-center active" href="index.jsp">
							<span class="glyphicon glyphicon-home"> </span> Home</a>
							</li>
							<li><a href="Teams" class="hvr-underline-from-center">
							<span class="glyphicon glyphicon-th-large"> </span> Teams</a>
							</li>
							<li><a href="player.jsp" class="hvr-underline-from-center"> 
							<span class="glyphicon glyphicon-user"> </span> Players</a></li>
							<li><a href="#" data-toggle="dropdown"><span data-hover="ShortCodes">
							<span class="glyphicon glyphicon-stats"> </span> Statistics</span><span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="team_stat.jsp"><span data-hover="Icons">Team Statistics</span></a></li>
									<li><a href="player_stat.jsp"><span data-hover="Typograpghy">Player Statistics</span></a></li>
								</ul>
							</li>	
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
</div>

    <div class='bungkus'>
        <p><b>BasketBall Statistics</b> for IBL(Indonesian Basketball League)</p>
        
        <div class='col-md-6 kiri'>
            <div class='kiri_jud'>
                <h4>Every Player</h4>
            </div>
            <center>
                <div class='foto_wrap'>
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                </div>
                
                <div class='foto_wrap'>
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                    <img src='images/team2.jpg' class="foto_pl">
                </div>
                <div class="kiri_form">
                <form>		
                    <select name='' class='form-group' id="sel_team">
                            <option value=''> ------------ Select a Team ------------ </option>
                            <option value='BPJ'>  BIMA PERKASA JOGJA </option>
                            <option value='GRB'>  BANK BJB GARUDA BANDUNG </option>
                            <option value='CLS'>  CLS KNIGHTS SURABAYA </option>
                            <option value='HTS'>  HANGTUAH SUMSEL </option>
                            <option value='JSB'>  JNE SILIWANGI BANDUNG </option>
                            <option value='NSH'>  NSH JAKARTA </option>
                            <option value='PCF'>  PACIFIC CAESAR SURABAYA </option>
                            <option value='PJE'>  PELITA JAYA </option>
                            <option value='SMP'>  SATRIA MUDA PERTAMINA JAKARTA </option>
                            <option value='SWS'>  SATYA WACANA SALATIGA </option>
                            <option value='ASP'>  W88.NEWS ASPAC JAKARTA </option>
                    </select>
                    <select id="sel_plyr">
                            <option value=''> ------------ Select a Player ------------ </option>
                    </select><br>
                    <button class="kiri_btn"> Go </button>
                </form> 
                </div>
            </center>
        </div>
    </div>

<!-- js scripts -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js-scripts -->
</body>
</html>
