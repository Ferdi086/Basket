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
							<li><a href="Players" class="hvr-underline-from-center"> 
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
	  </form> 
	</div>
	<div class="col-lg-2 se_pos">
	  <form>		
	  	<select name='' class='form-group' id="sel_pos">
			<option value=''> ------ Select a Position ------ </option>
			<option value='C'>  CENTER </option>
			<option value='PF'>  POWER FORWARD </option>
			<option value='PG'>  POINT GUARD </option>
			<option value='SF'>  SMALL FORWARD </option>
			<option value='SG'>  SHOOTING GUARD </option>
			<option value='G/F'>  UNKNOWN </option>
		</select>
	  </form>
	</div>
	<div class="col-lg-3 se_name">
	  <form>		
	  	<div class="input-group">
		      <input type="text" class="form-control input-lg input_n" placeholder="Search by Name">
		      <span class="input-group-btn cari_n">
		        <button class="btn btn-success" type="button" style="height:36px"> 
		       		 <span class="glyphicon glyphicon-search"></span>
		        </button>
		      </span>
		    </div>
	  </form>
	</div>
</div>
<div class="abc table-responsive">
<table class="table col-lg-offset-1">
	<tr>
		<td id="A"><h3><a href="PlayersByName?Name=A">A</a></h3></td>
		<td id="B"><h3><a href="PlayersByName?Name=B">B</a></h3></td>
		<td id="C"><h3><a href="PlayersByName?Name=C">C</a></h3></td>
		<td id="D"><h3><a href="PlayersByName?Name=D">D</a></h3></td>
		<td id="E"><h3><a href="PlayersByName?Name=E">E</a></h3></td>
		<td id="F"><h3><a href="PlayersByName?Name=F">F</a></h3></td>
		<td id="G"><h3><a href="PlayersByName?Name=G">G</a></h3></td>
		<td id="H"><h3><a href="PlayersByName?Name=H">H</a></h3></td>
		<td id="I"><h3><a href="PlayersByName?Name=I">I</a></h3></td>
		<td id="J"><h3><a href="PlayersByName?Name=J">J</a></h3></td>
		<td id="K"><h3><a href="PlayersByName?Name=K">K</a></h3></td>
		<td id="L"><h3><a href="PlayersByName?Name=L">L</a></h3></td>
		<td id="M"><h3><a href="PlayersByName?Name=M">M</a></h3></td>
		<td id="N"><h3><a href="PlayersByName?Name=N">N</a></h3></td>
		<td id="O"><h3><a href="PlayersByName?Name=O">O</a></h3></td>
		<td id="P"><h3><a href="PlayersByName?Name=P">P</a></h3></td>
		<td id="Q"><h3><a href="PlayersByName?Name=Q">Q</a></h3></td>
		<td id="R"><h3><a href="PlayersByName?Name=R">R</a></h3></td>
		<td id="S"><h3><a href="PlayersByName?Name=S">S</a></h3></td>
		<td id="T"><h3><a href="PlayersByName?Name=T">T</a></h3></td>
		<td id="U"><h3><a href="PlayersByName?Name=U">U</a></h3></td>
		<td id="V"><h3><a href="PlayersByName?Name=V">V</a></h3></td>
		<td id="W"><h3><a href="PlayersByName?Name=W">W</a></h3></td>
		<td id="X"><h3><a href="PlayersByName?Name=X">X</a></h3></td>
		<td id="Y"><h3><a href="PlayersByName?Name=Y">Y</a></h3></td>
		<td id="Z"><h3><a href="PlayersByName?Name=Z">Z</a></h3></td>
	</tr>
</table>
</div>
<div class="team" id="team">
		<div class="container unik">
			<div class="wthree_team_grids">
                            <c:forEach var = "item" items = "${requestScope.player}">
				<div class="col-md-3 wthree_team_grid">
					<a href="PlayerDetails?ID_P=${item.value.idPemain}">
						<div class="hovereffect">
						<img src="../img/Players/${item.value.foto}" alt=" " class="img-responsive" />
						<div class="overlay">
							<h6>${item.value.namaPemain}</h6>
						</div>
					</a>
					</div>
					<h4>${item.value.namaPos}</h4>
					<p>${item.value.tinggi} cm</p>
				</div>
                            </c:forEach>
                            <div class="clearfix"> </div>
			</div>
			
		</div>
	</div>
    <h1 class='ab hidden'>${requestScope.abc}</h1>
<!-- js-scripts -->
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	

<script>
    $(document).ready(function (){
       var x = $('.ab').html();
       //alert(x);
       $('#'+x).css({"background-color": "lightgrey"});
    });
    //  ajax dropdown team 
    $('#sel_team').change(function(){
        $('.wthree_team_grids').remove();
        var id = $(this).val();
        $.ajax({
            type : 'POST',
            url : 'PlayersByTeam',
            data: {
                'id_team': id
            },
            beforeSend: function(){
            },
            success: function(data){
                $('.unik').append(data);      
            }
        });
    });
    //  ajax dropdown posisi 
    $('#sel_pos').change(function(){
        $('.wthree_team_grids').remove();
        var id = $(this).val();
        $.ajax({
            type : 'POST',
            url : 'PlayersByPos',
            data: {
                'kd_pos': id
            },
            beforeSend: function(){
            },
            success: function(data){
                $('.unik').append(data);      
            }
        });
    });
    $('.cari_n').click(function(){
       $('.wthree_team_grids').remove();
        var id = $('.input_n').val();
        $.ajax({
            type : 'POST',
            url : 'PlayersByNameLike',
            data: {
                'Nama_pem': id
            },
            beforeSend: function(){
            },
            success: function(data){
                $('.unik').append(data);      
            }
        }); 
    });
    $('.input_n').click(function(){
       $(this).val(null); 
    });
</script>
</body>
</html>
