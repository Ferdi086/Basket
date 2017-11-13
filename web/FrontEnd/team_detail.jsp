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
	h2 {
   width: 100%; 
   text-align: center; 
   border-bottom: 2px solid #ffcc00; 
   line-height: 0.1em;
   margin: 10px 0 20px; 
} 

h2 span { 
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
<c:forEach var = "item" items = "${requestScope.team}">
<div class="row" style="margin-top:10px;margin-bottom:10px;">
	<div class="col-lg-3 col-lg-offset-2 col-md-4 col-sm-5 col-xs-5 team_logo">
		<img src="../img/Team/Logo/${item.value.logo}"/>
	</div>
	<div class="col-lg-6  col-md-6 col-sm-7 col-xs-7 team_name">
		<h3>${item.value.nama_team}</h3>
	</div>
</div>
<center>
	<div class="team_foto col-lg-md-12 col-sm-12 col-xs-12" style="margin-top:10px;">
		<img src="../img/Team/Foto/${item.value.gambar}" class="img-responsive" width="200px" height="200px"/>
	</div>
</center>

<div class="col-lg-12 team_stats">
	<h3> ${item.value.nama_team} STATISTICS <span class="glyphicon glyphicon-stats"> </span></h3>
</div>
</c:forEach>
<div class="row team_stats2">
	<div class="col-lg-3 col-md-5 col-sm-5 top_point">
		<h4>TOP POINTS</h4>
                <c:forEach var = "item" items = "${requestScope.tp}">
		<div class="kotak_team">
			<div class="kotak_team_isi">
				<img src="../img/Players/${item.value.foto}" class="img-circle" width="55" height="55"/>
			</div>
			<div class="kotak_team_isi">
				<h5>${item.value.namaPemain}</h5>
				<p>${item.value.pos}</p>
			</div>
			<div class="kotak_team_isi pull-right">
				<h5 style="margin:3px 4px 0 0">${item.value.point}</h5>
			</div>
		</div>
                </c:forEach>
		
	</div>
	<div class="col-lg-3 col-md-5 col-sm-5 top_point">
		<h4>TOP ASSISTS</h4>
		<c:forEach var = "item" items = "${requestScope.ta}">
		<div class="kotak_team">
			<div class="kotak_team_isi">
				<img src="../img/Players/${item.value.foto}" class="img-circle" width="55" height="55"/>
			</div>
			<div class="kotak_team_isi">
				<h5>${item.value.namaPemain}</h5>
				<p>${item.value.pos}</p>
			</div>
			<div class="kotak_team_isi pull-right">
				<h5 style="margin:3px 4px 0 0">${item.value.point}</h5>
			</div>
		</div>
                </c:forEach>
	</div>
	<div class="col-lg-3 col-md-5 col-sm-5 top_point">
		<h4>TOP REBOUNDS</h4>
		<c:forEach var = "item" items = "${requestScope.tr}">
		<div class="kotak_team">
			<div class="kotak_team_isi">
				<img src="../img/Players/${item.value.foto}" class="img-circle" width="55" height="55"/>
			</div>
			<div class="kotak_team_isi">
				<h5>${item.value.namaPemain}</h5>
				<p>${item.value.pos}</p>
			</div>
			<div class="kotak_team_isi pull-right">
				<h5 style="margin:3px 4px 0 0">${item.value.point}</h5>
			</div>
		</div>
                </c:forEach>
	</div>
</div>
<div class="general_stats">
	<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">  <b>GENERAL STATS</b></a></li>
					<li><a data-toggle="tab" href="#menu1">  <b>ADVANCED</b></a></li>
				  </ul>
				
				  <div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						
						<div style='margin-top:10px'>
						  <form>
							<label class='form-group'>Search By Season : </label>
							<select name='kat_lok' class='form-group' id='lok'>
								<option value=''>IBL REGULAR SEASON 2017</option>
								<option value=''>IBL REGULAR SEASON 2015 - 2016</option>
								<option value=''>CHAMPIONSHIP PRESEASON 2015</option>
								<option value=''>IBL PRESEASON 2015</option>
							</select>
						  </form>
						</div>

						<div class="tbl_general table-responsive">
							<table class="table table-bordered table-striped">
								<tr class="tr_general">
									<th>NO</th>
									<th>PLAYER</th>
									<th>Pos</th>
									<th>GP</th>
									<th>MIN</th>
									<th>FGM</th>
									<th>FGA</th>
									<th>FG%</th>
									<th>2PM</th>
									<th>2PA</th>
									<th>2P%</th>
									<th>3PM</th>
									<th>3PA</th>
									<th>3P%</th>
									<th>FTM</th>
									<th>FTA</th>
									<th>FT%</th>
									<th>OR</th>
									<th>DR</th>
									<th>TR</th>
									<th>AS</th>
									<th>TO</th>
									<th>ST</th>
									<th>BL</th>
									<th>EF</th>
									<th>PTS</th>
								</tr>
								<tr>
									<td>1</td>
									<td>Rizky Alfian</td>
									<td>SF</td>
									<td>5</td>
									<td>5.94</td>
									<td>0.60</td>
									<td>1.80</td>
									<td>33%</td>
									<td>0.60</td>
									<td>1.20</td>
									<td>50%</td>
									<td>0.00</td>
									<td>0.60</td>
									<td>0%</td>
									<td>0.60</td>
									<td>1.00</td>
									<td>60%</td>
									<td>0.40</td>
									<td>0.60</td>
									<td>1.00</td>
									<td>0.20</td>
									<td>0.80</td>
									<td>0.20</td>
									<td>0.00</td>
									<td>6.00</td>
									<td>1.80</td>
								</tr>
							</table>
						</div>
						
					</div>
					<div id="menu1" class="tab-pane fade">
					
						<div style='margin-top:10px'>
						  <form>
							<label class='form-group'>Search By Season : </label>
							<select name='kat_lok' class='form-group' id='lok'>
								<option value=''>IBL REGULAR SEASON 2017</option>
								<option value=''>IBL REGULAR SEASON 2015 - 2016</option>
								<option value=''>CHAMPIONSHIP PRESEASON 2015</option>
								<option value=''>IBL PRESEASON 2015</option>
							</select>
						  </form>
						</div>

						<div class="tbl_general table-responsive">
							<table class="table table-bordered table-striped">
								<tr class="tr_general">
									<th>NO</th>
									<th>PLAYER</th>
									<th>Pos</th>
									<th>GP</th>
									<th>MIN</th>
									<th>FGM</th>
									<th>FGA</th>
									<th>FG%</th>
									<th>2PM</th>
									<th>2PA</th>
									<th>2P%</th>
									<th>3PM</th>
									<th>3PA</th>
									<th>3P%</th>
									<th>FTM</th>
									<th>FTA</th>
									<th>FT%</th>
									<th>OR</th>
									<th>DR</th>
									<th>TR</th>
									<th>AS</th>
									<th>TO</th>
									<th>ST</th>
									<th>BL</th>
									<th>EF</th>
									<th>PTS</th>
								</tr>
								<tr>
									<td>1</td>
									<td>Rizky Alfian</td>
									<td>SF</td>
									<td>5</td>
									<td>5.94</td>
									<td>0.60</td>
									<td>1.80</td>
									<td>33%</td>
									<td>0.60</td>
									<td>1.20</td>
									<td>50%</td>
									<td>0.00</td>
									<td>0.60</td>
									<td>0%</td>
									<td>0.60</td>
									<td>1.00</td>
									<td>60%</td>
									<td>0.40</td>
									<td>0.60</td>
									<td>1.00</td>
									<td>0.20</td>
									<td>0.80</td>
									<td>0.20</td>
									<td>0.00</td>
									<td>6.00</td>
									<td>1.80</td>
								</tr>
							</table>
						</div>
						
					</div>
				</div>
</div>
<div class="team" id="team">
		<div class="container">
		<h2>
			<span>ROSTER</span>
		</h2>
			<div class="wthree_team_grids">                                
                                <c:forEach var = "item" items = "${requestScope.player}">
                                <div class="col-md-3 wthree_team_grid">
					<a href="PlayerDetails?ID_P=${item.value.idPemain}">
					<div class="hovereffect">
						<img src="../img/Players/${item.value.foto}" alt="${item.value.namaPemain}" class="img-responsive" width="400" height="400"/>
						<div class="overlay">
                                                    <h6>${item.value.namaPemain}</h6>
						</div>
					</div>
					</a>
					<h4>${item.value.namaPos}</h4>
					<p>${item.value.tinggi} cm</p>
				</div>
                                </c:forEach>
                                
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>


<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	





<!-- //js-scripts -->
</body>
</html>
