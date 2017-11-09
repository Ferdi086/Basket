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
	#team{
		margin-top:2%;
	}
	.team{
		padding-top:0;
	}
        .punggung{
            background-image: url('../img/jersey2.png');
            background-size:cover;
            min-width: 70px;
            min-height:80px;
            color:white;
            text-align:center;
            margin-right:10%;
        }
        .punggung h2{
            margin-top: 40%;
            margin-left: 15%;
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
							<li><a href="Players" class="hvr-underline-from-center"> 
							<span class="glyphicon glyphicon-user"> </span> Players</a></li>
							<li><a href="gallery.html" class="hvr-underline-from-center">
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


<div class="row det_player">
    <c:forEach var = "item" items = "${requestScope.player}">
	<div class="team" id="team">
			<div class="wthree_team_grids">
				<div class="col-md-3 wthree_team_grid foto_p">
					<div class="hovereffect">
						<img src="../img/Players/${item.value.foto}" alt="${item.value.namaPemain}" class="img-responsive" width="400" height="400"/>
					</div>
				</div>
			</div>
	</div>
	<div class="col-lg-4 nama_p">
                 <div class="pull-right punggung">
                     <h2>
                         <c:if test = "${item.value.noPunggung == NULL}">
                             ?
                         </c:if>
                         ${item.value.noPunggung}
                     </h2>
                </div>
		<h1>${item.value.namaPemain}</h1>
                <br>
		<h3 style="color:white">${item.value.namaPos}</h3>
		<a href="#" style="color:black"><h3><img src="../img/Team/${item.value.logo}"/>${item.value.team}</h3></a>
		<h4><span>Birthdate</span>  : ${item.value.tgl}</h4>
		<h4><span>Height</span> : ${item.value.tinggi} cm</h4>
		<h4><span>Weight</span> : ${item.value.berat} kg</h4>
	</div>
    </c:forEach>
	<div class="col-lg-4 stat_p">
		<h3><span class="glyphicon glyphicon-expand"></span>  IBL PLAYOFF 2017</h3>
		<table class="tb_p">
			<tr>
				<td class="tb_h"><h3>PPG</h3></td>
			</tr>
			<tr>
				<td><h1>5.25</h1></td>
			</tr>
		</table>
		<table class="tb_p">
			<tr>
				<td class="tb_h"><h3>APG</h3></td>
			</tr>
			<tr>
				<td><h1>1.5</h1></td>
			</tr>
		</table>
		<table class="tb_p">
			<tr>
				<td class="tb_h"><h3>RPG</h3></td>
			</tr>
			<tr>
				<td><h1>3.5</h1></td>
			</tr>
		</table>
	</div>
</div>


<div class="game_stats">
	<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">  <b>STATS</b></a></li>
					<li><a data-toggle="tab" href="#menu1">  <b>GAMELOG</b></a></li>
  	</ul>
				
				  <div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						<h3 style="margin:3% 0">REGULAR</h3>
						<div class="tbl_general table-responsive">
							<table class="table table-bordered table-striped">
								<tr class="tr_general">
									<th>YEAR</th>
									<th>TEAM</th>
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
									<th>PF</th>
									<th>EF</th>
									<th>PTS</th>
								</tr>
								<tr>
									<td>1</td>
									<td>YO SUA</td>
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
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	

</body>
</html>