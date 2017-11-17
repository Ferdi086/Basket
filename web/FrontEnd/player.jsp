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
		<td id="A" onclick="playname('A')"><h3><a href="#">A</a></h3></td>
		<td id="B" onclick="playname('B')"><h3><a href="#">B</a></h3></td>
		<td id="C" onclick="playname('C')"><h3><a href="#">C</a></h3></td>
		<td id="D" onclick="playname('D')"><h3><a href="#">D</a></h3></td>
		<td id="E" onclick="playname('E')"><h3><a href="#">E</a></h3></td>
		<td id="F" onclick="playname('F')"><h3><a href="#">F</a></h3></td>
		<td id="G" onclick="playname('G')"><h3><a href="#">G</a></h3></td>
		<td id="H" onclick="playname('H')"><h3><a href="#">H</a></h3></td>
		<td id="I" onclick="playname('I')"><h3><a href="#">I</a></h3></td>
		<td id="J" onclick="playname('J')"><h3><a href="#">J</a></h3></td>
		<td id="K" onclick="playname('K')"><h3><a href="#">K</a></h3></td>
		<td id="L" onclick="playname('L')"><h3><a href="#">L</a></h3></td>
		<td id="M" onclick="playname('M')"><h3><a href="#">M</a></h3></td>
		<td id="N" onclick="playname('N')"><h3><a href="#">N</a></h3></td>
		<td id="O" onclick="playname('O')"><h3><a href="#">O</a></h3></td>
		<td id="P" onclick="playname('P')"><h3><a href="#">P</a></h3></td>
		<td id="Q" onclick="playname('Q')"><h3><a href="#">Q</a></h3></td>
		<td id="R" onclick="playname('R')"><h3><a href="#">R</a></h3></td>
		<td id="S" onclick="playname('S')"><h3><a href="#">S</a></h3></td>
		<td id="T" onclick="playname('T')"><h3><a href="#">T</a></h3></td>
		<td id="U" onclick="playname('U')"><h3><a href="#">U</a></h3></td>
		<td id="V" onclick="playname('V')"><h3><a href="#">V</a></h3></td>
		<td id="W" onclick="playname('W')"><h3><a href="#">W</a></h3></td>
		<td id="X" onclick="playname('X')"><h3><a href="#">X</a></h3></td>
		<td id="Y" onclick="playname('Y')"><h3><a href="#">Y</a></h3></td>
		<td id="Z" onclick="playname('Z')"><h3><a href="#">Z</a></h3></td>
	</tr>
</table>
</div>
<div class="team" id="team">
		<div class="container unik">
			<div class="wthree_team_grids">
                            <c:forEach var = "item" items = "${requestScope.player}">
				<div class="col-md-3 wthree_team_grid">
					
                                        <div class="hovereffect" onclick="playdetail(${item.value.idPemain})">
                                            <img src="../img/Players/${item.value.foto}" alt=" " class="img-responsive" />
                                            <div class="overlay">
                                                    <h6>${item.value.namaPemain}</h6>
                                            </div>
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
    
    <footer>
            <div class="copyright">
                    <div class="container">
                            <p>© 2017 Transporters. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
                    </div>
            </div>
    </footer>
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
<script>
    // Function pindah page with jquery
    function playdetail(id){
        var form = document.createElement("form");
        form.setAttribute("method", "POST");
        form.setAttribute("action", "PlayerDetails");
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "ID_P");
        hiddenField.setAttribute("value", id);
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
    }
    function playname(huruf){
        var form = document.createElement("form");
        form.setAttribute("method", "POST");
        form.setAttribute("action", "PlayersByName");
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "Name");
        hiddenField.setAttribute("value", huruf);
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>
</html>
