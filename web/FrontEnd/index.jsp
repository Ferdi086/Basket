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
						</ul>
					</div>

					<div class="clearfix"> </div>	
				</nav>
	
	</div>
<!-- Slider -->
<div class="slider">
	<div class="callbacks_container">
		<ul class="rslides" id="slider">
			<li>
				<div class="w3layouts-banner-top w3layouts-banner-top1">
					<div class="banner-dott">
					<div class="container">
						<div class="slider-info">
							<div class="col-md-8">
								<h2>Tantangan Baru Cacing Di NSH</h2>
								<h4><span class="glyphicon glyphicon-calendar"> </span> 10 october 2017</h4>
								<div class="bannergrids">
									<div class="col-md-10 grid1">
										<p>Wahyu Widayat Jati tak perlu menganggur lama di kancah bolabasket profesional Indonesia...</p>
									</div>									
									<div class="clearfix"></div>
								</div>
								<div class="w3ls-button">
									<a href="#">Read More</a>
								</div>
							</div>
							<div class="col-md-4">
								<div class="banner-form-agileinfo">
									<h5>STANDINGS <span>2017/2018</span></h5>
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#home">  <b>DIVISI MERAH</b></a></li>
										<li><a data-toggle="tab" href="#menu1">  <b>DIVISI PUTIH</b></a></li>
									</ul>
								  	<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<table class="table table-bordered">
															<tr>
																<th>TEAM</th>
																<th>P</th>
																<th>W</th>
																<th>L</th>
																<th>PTS</th>
															</tr>
															<tr>
																<td>Satria Muda Pertamina Jakarta</td>
																<td>14</td>
																<td>13</td>
																<td>1</td>
																<td>27</td>
															</tr>
															<tr>
																<td>CLS Knights Surabaya</td>
																<td>13</td>
																<td>11</td>
																<td>3</td>
																<td>25</td>
															</tr>
															<tr>
																<td>Bank BJB Garuda Bandung</td>
																<td>14</td>
																<td>7</td>
																<td>7</td>
																<td>21</td>
															</tr>
														</table>
										</div>
										<div id="menu1" class="tab-pane fade">
										<p><b>DIVISI PUTIH</b></p>
										</div>
											
									</div>
								</div>
									
							</div>
						</div>
					</div>
					</div>
				</div>
			</li>
			<li>
				<div class="w3layouts-banner-top w3layouts-banner-top">
					<div class="banner-dott">
					<div class="container">
						<div class="slider-info">
							<div class="col-md-8">
								<h2  href="#">Delapan Seri di Delapan Kota</h2>
								<h4><span class="glyphicon glyphicon-calendar"> </span> 09 october 2017</h4>
								<div class="bannergrids">
									<div class="col-md-10 grid1">
										<p>IBL Pertalite 2017/18 tetap akan digelar dalam delapan seri babak reguler yang akan mulai 8 Desember mendatang...</p>
									</div>									
									<div class="clearfix"></div>
								</div>
								<div class="w3ls-button">
									<a href="#">Read More</a>
								</div>
							</div>
							<div class="col-md-4">
								<div class="banner-form-agileinfo">
									<h5>STANDINGS <span>2017/2018</span></h5>
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#home">  <b>DIVISI MERAH</b></a></li>
										<li><a data-toggle="tab" href="#menu1">  <b>DIVISI PUTIH</b></a></li>
									</ul>
								  	<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<table class="table table-bordered">
															<tr>
																<th>TEAM</th>
																<th>P</th>
																<th>W</th>
																<th>L</th>
																<th>PTS</th>
															</tr>
															<tr>
																<td>Satria Muda Pertamina Jakarta</td>
																<td>14</td>
																<td>13</td>
																<td>1</td>
																<td>27</td>
															</tr>
															<tr>
																<td>CLS Knights Surabaya</td>
																<td>13</td>
																<td>11</td>
																<td>3</td>
																<td>25</td>
															</tr>
															<tr>
																<td>Bank BJB Garuda Bandung</td>
																<td>14</td>
																<td>7</td>
																<td>7</td>
																<td>21</td>
															</tr>
														</table>
										</div>
										<div id="menu1" class="tab-pane fade">
										<p><b>DIVISI PUTIH</b></p>
										</div>
											
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
</div>
<!-- //Slider -->				
<!-- banner-bottom -->
<div class="banner-bottom">
	<div class="col-md-7 bannerbottomleft">
			<div class="video-grid-single-page-agileits">
				<div data-video="h76Rd04V65Y" id="video"> <img src="images/vid_thumb1.jpg" alt="" class="img-responsive" /> </div>
			</div>
	</div>
	<div class="col-md-5 bannerbottomright">
		<h3><span>Latest Match</span></h3>
		<p>SUNDAY, 7 MAY 2017</p>
		<div class="row">
			<div class="col-md-5 col-sm-5">
				<h4 >Pelita Jaya</h4>
			</div>
			<div class="col-md-1 col-sm-1">
				<h4>VS</h4>
			</div>
			<div class="col-md-5 col-md-offset-1 col-sm-5">
				<h4>Satya Wacana Salatiga</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5 col-sm-6">
				<img src="../img/Team/Logo/PJE.png"/>
				<div class="progress progress-striped active">
				  <div class="progress-bar"  role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
				  </div>
				</div>
				<h3>45</h3>
			</div>
			<div class="col-md-5 col-md-offset-2 col-sm-6">
				<img src="../img/Team/Logo/SWS.png"/>
				<div class="progress progress-striped active">
				  <div class="progress-bar"  role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
				  </div>
				</div>
				<h3>65</h3>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<!-- //banner-bottom -->

<!-- team -->
	<div class="team" id="team">
		<div class="container">
		<div class="heading">
			<h3 style="color:#23B684"><span>Stat Leaders</span></h3>
		</div>
			<div class="wthree_team_grids">
				<div class="col-md-3 wthree_team_grid">
				<h3>TOP POINTS</h3>
				<div class="hovereffect">
					<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					<h4>Point Guard</h4>
					<p>177 cm</p>
					<h3>28.50</h3>
				</div>
				<div class="col-md-3 wthree_team_grid">
					<h3>TOP ASSISTS</h3>
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					<h4>Point Guard</h4>
					<p>177 cm</p>
					<h3>5.50</h3>
				</div>
				<div class="col-md-3 wthree_team_grid">
					<h3>TOP REBOUNDS</h3>
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					<h4>Point Guard</h4>
					<p>177 cm</p>
					<h3>16.20</h3>
				</div>
				<div class="col-md-3 wthree_team_grid">
					<h3>TOP BLOCKS</h3>
					<div class="hovereffect">
						<img src="images/player/1.png" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>Yo Sua</h6>
						</div>
					</div>
					<h4>Point Guard</h4>
					<p>177 cm</p>
					<h3>3.50</h3>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //team -->



<!-- our blog -->
<section class="blog" id="blog">
	<div class="container">
		<div class="heading">
			<h3><span>Latest News</span></h3>
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
<!-- //our blog -->

<!--- search modal -->	
<div class="modal fade search-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content" style="background-color:transparent">
      	<div class="row">
		  <div class="col-lg-12">
		    <div class="input-group">
		      <input type="text" class="form-control input-lg" placeholder="Search for...">
		      <span class="input-group-btn">
		        <button class="btn btn-success" type="button" style="height:40px"> 
		       		 <span class="glyphicon glyphicon-search"></span>
		        </button>
		      </span>
		    </div><!-- /input-group -->
		  </div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
    </div>
  </div>
</div>

<!-- footer -->
	<footer>
		<div class="copyright">
			<div class="container">
				<p>© 2017 Transporters. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
			</div>
		</div>
	</footer>
	<!-- //footer -->



<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	

<!-- start-smoth-scrolling -->
<script src="js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
	<!-- //here ends scrolling icon -->
<!-- start-smoth-scrolling -->

<!-- Baneer-js -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		$(function () {
			$("#slider").responsiveSlides({
				auto: false,
				pager:false,
				nav: true,
				speed: 1000,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
<!-- //Baneer-js -->

<!-- banner bottom video script -->
<script src="js/simplePlayer.js"></script>
			<script>
				$("document").ready(function() {
					$("#video").simplePlayer();
				});
</script>
<!-- //banner bottom video script -->

<!-- Stats-Number-Scroller-Animation-JavaScript -->
				<script src="js/waypoints.min.js"></script> 
				<script src="js/counterup.min.js"></script> 
				<script>
					jQuery(document).ready(function( $ ) {
						$('.counter').counterUp({
							delay: 100,
							time: 1000
						});
					});
				</script>
<!-- //Stats-Number-Scroller-Animation-JavaScript -->


<!-- FlexSlider-JavaScript -->
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
		$(function(){
			SyntaxHighlighter.all();
				});
				$(window).load(function(){
				$('.flexslider').flexslider({
					animation: "slide",
					start: function(slider){
						$('body').removeClass('loading');
					}
			});
		});
	</script>
<!-- //FlexSlider-JavaScript -->

<!-- //js-scripts -->
</body>
</html>
