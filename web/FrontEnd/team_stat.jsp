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

<center>
		<h2 style="margin:2% 0"><span>TEAM STATISTICS</span></h2>
</center>
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
									<th>TEAM</th>
									<th>GP</th>
									<th>W</th>
									<th>L</th>
									<th>OFF.RTG.</th>
									<th>OFF.FLOOR%</th>
									<th>DEF.RTG.</th>
									<th>DEF.FLOOR%</th>
								</tr>
								<tr>
									<td>BIMA PERKASA JOGJA</td>
									<td>3</td>
									<td>1</td>
									<td>5</td>
									<td>85.94</td>
									<td>60.6%</td>
									<td>98.80</td>
									<td>33.5%</td>
								</tr>
							</table>
						</div>
						
					</div>
				</div>
</div>


    <footer>
            <div class="copyright">
                    <div class="container">
                            <p>Copyright © 2017 IT Directorate . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
                    </div>
            </div>
    </footer>

<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	

</body>
</html>
