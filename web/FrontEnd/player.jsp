<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<style>
	#team{
		margin-top:2%;
	}
	.team{
		padding-top:0;
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

<center>
		<h2 style="margin:2% 0"><span>ALL PLAYERS</span></h2>
</center>
<div class="row">
	<div class="col-lg-2 se_team">
	  <form>		
	  	<select name='' class='form-group' >
			<option value=''>  Select a Team </option>
			<option value=''>  Bima Perkasa Jogja </option>
			<option value=''>  Satya Wacana Salatiga </option>
			<option value=''>  NSH </option>
		</select>
	  </form> 
	</div>
	<div class="col-lg-2 se_team">
	  <form>		
	  	<select name='' class='form-group' >
			<option value=''>  Select a Position </option>
			<option value=''>  CF </option>
			<option value=''>  PG </option>
			<option value=''>  CENTER </option>
		</select>
	  </form>
	</div>
	<div class="col-lg-3 se_team">
	  <form>		
	  	<input type="text" placeholder="Search a player" class="form-group">
	  <button class="btn btn-success form-group"><span class="glyphicon glyphicon-search"></span></button>
	  </form>
	</div>
</div>
<div class="abc table-responsive">
<table class="table col-lg-offset-1">
	<tr>
		<td id="aa"><h3><a href="#">A</a></h3></td>
		<td><h3><a href="#">B</a></h3></td>
		<td><h3><a href="#">C</a></h3></td>
		<td><h3><a href="#">D</a></h3></td>
		<td><h3><a href="#">E</a></h3></td>
		<td><h3><a href="#">F</a></h3></td>
		<td><h3><a href="#">G</a></h3></td>
		<td><h3><a href="#">H</a></h3></td>
		<td><h3><a href="#">I</a></h3></td>
		<td><h3><a href="#">J</a></h3></td>
		<td><h3><a href="#">K</a></h3></td>
		<td><h3><a href="#">L</a></h3></td>
		<td><h3><a href="#">M</a></h3></td>
		<td><h3><a href="#">N</a></h3></td>
		<td><h3><a href="#">O</a></h3></td>
		<td><h3><a href="#">P</a></h3></td>
		<td><h3><a href="#">Q</a></h3></td>
		<td><h3><a href="#">R</a></h3></td>
		<td><h3><a href="#">S</a></h3></td>
		<td><h3><a href="#">T</a></h3></td>
		<td><h3><a href="#">U</a></h3></td>
		<td><h3><a href="#">V</a></h3></td>
		<td><h3><a href="#">W</a></h3></td>
		<td><h3><a href="#">X</a></h3></td>
		<td><h3><a href="#">Y</a></h3></td>
		<td><h3><a href="#">Z</a></h3></td>
	</tr>
</table>
</div>
<div class="team" id="team">
		<div class="container">
			<div class="wthree_team_grids">
				<div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
						<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</a>
					</div>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
				<div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
				<div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
				<div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
                                <div class="col-md-3 wthree_team_grid">
					<a href="player_detail.jsp">
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					</a>
					<h4>Point Guard</h4>
					<p>177 cm</p>
				</div>
				<div class="clearfix"> </div>
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
