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
<link href="../css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="../css/bootstrap-table.css">
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<script src="../js/moment.min.js"></script>
<script type="text/javascript" src="../js/select2.min.js"></script>
<script type="text/javascript" src="../js/bootstrap-table.js"></script>
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
        .foto_pl{
            margin-left:1px;
            margin-right: 1px;
            margin-bottom: 5px;
            width:300px;
            height:400px;
            cursor:pointer;
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

    <div class='row bungkus'>
        <p><b>BasketBall Statistics</b> for IBL(Indonesian Basketball League)</p>
        
        <div class='col-lg-3 col-md-12-sm-12 kiri'>
            <div class='kiri_jud'>
                <h4>Top Player</h4>
            </div>
            <center>
                <div class='foto_wrap' style="padding-left:5px;padding-right: 5px;">
                    <c:forEach var = "item" items = "${requestScope.p1}">
                        <img src='../img/Players/${item.value.foto}' onerror="this.onerror=null;this.src='../img/Players/nopic.png';" class="foto_pl" onclick="playdetail('${item.value.idPemain}')">
                    </c:forEach>
                </div>
                <div class="kiri_form">
                <form id="Pl_kiri" method="post" action="PlayerDetails">		
                    <select name='' class="form-group" id="sel_team" required>
                            <option value=''> ------------ Select a Team ------------ </option>
                            <c:forEach var="item" items="${requestScope.team}">
                                <option value="${item.value.id}"> ${item.value.namateam} </option>
                            </c:forEach>
                    </select>
                    <select id="sel_plyr" name='ID_P' required>
                            <option value=''> ------------ Select a Player ------------ </option>
                    </select><br>
                    <button class="kiri_btn"> Go </button>
                </form> 
                </div>
            </center>
        </div>
        
        <div class="col-lg-5 col-md-12-sm-12 kanan">
            <div class="kanan_jud">
                <h4>Every Team</h4>
            </div>
            <div class="kanan_isi">
                <h4>2017 - 2018 IBL Standings</h4>
                
                <table class="table table-bordered tb_div">
                        <tr>
                            <th data-valign="middle" data-sortable="true">No</th>
                            <th style='text-align:left'>Divisi Merah</th>
                            <th>GP</th>
                            <th>W</th>
                            <th>L</th>
                            <th>PTS</th>
                        </tr>
                        <c:forEach var='item' items='${requestScope.klas}'>
                            <tr>
                                <td>${item.value.no}</td>
                                <td style='text-align:left'>
                                    <a href='#' onclick="teamdetail('${item.value.id_team}')"><img src='../img/Team/Logo/${item.value.logo}' class='logo_kcl'>${item.value.nama}</a>
                                </td>
                                <td>${item.value.gp}</td>
                                <td>${item.value.w}</td>
                                <td>${item.value.l}</td>
                                <td>${item.value.pts}</td>
                            </tr>
                            
                        </c:forEach>
                </table>
                <table class="table table-bordered tb_div">
                        <tr>
                            <th>No</th>
                            <th style='text-align:left'>Divisi Putih</th>
                            <th>MP</th>
                            <th>W</th>
                            <th>L</th>
                            <th>PTS</th>
                        </tr>
                    <tr>
                        <td>1</td>
                        <td style='text-align:left'>
                            <a href='#'><img src='../img/Team/Logo/BPJ.png' class='logo_kcl'>Bima Perkasa Jogja</a>
                        </td>
                        <td>10</td>
                        <td>5</td>
                        <td>5</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td style='text-align:left'>
                            <a href='#'><img src='../img/Team/Logo/BPJ.png' class='logo_kcl'>Bima Perkasa Jogja</a>
                        </td>
                        <td>10</td>
                        <td>5</td>
                        <td>5</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td style='text-align:left'>
                            <a href='#'><img src='../img/Team/Logo/BPJ.png' class='logo_kcl'>Bima Perkasa Jogja</a>
                        </td>
                        <td>10</td>
                        <td>5</td>
                        <td>5</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td style='text-align:left'>
                            <a href='#'><img src='../img/Team/Logo/BPJ.png' class='logo_kcl'>Bima Perkasa Jogja</a>
                        </td>
                        <td>10</td>
                        <td>5</td>
                        <td>5</td>
                        <td>50</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td style='text-align:left'>
                            <a href='#'><img src='../img/Team/Logo/BPJ.png' class='logo_kcl'>Bima Perkasa Jogja</a>
                        </td>
                        <td>10</td>
                        <td>5</td>
                        <td>5</td>
                        <td>50</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class='col-lg-3 col-md-12 pojok'>
            <div class='pojok_jud'>
                <h4>Others News</h4>
            </div>
            <div id='sea'>
                <h4>2017-2018 IBL Season</h4>
                <a href='Season'>2017-2018 IBL Regular Schedule</a>
            </div>
            <div id='tren'>
                <h4>Trending Player Pages</h4>
                <c:forEach var='item' items='${requestScope.tren}'>
                    <a href='#' onclick='playdetail(${item.value.foto})'>${item.value.namaPemain}</a>,
                </c:forEach>
            </div>
            <div id='pojok_news'>
                <h4>Recent News</h4>
                <ul class='pjk'>
                    <c:forEach var="item" items="${requestScope.news}">
                         <li> <a href='#' onclick="detail(${item.value.id})">${item.value.judul}</a> </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

<!-- js scripts -->
	
        
        <script>
            $(document).ready(function(){ 
                $("#sel_plyr").select2();
            });
            $('#sel_team').change(function () {
                var id = $(this).val();
                //alert(id); 
                $.ajax({
                    type: 'POST',
                    url: '../BackEnd/doSelectPlayer',
                    data: {
                        'bagian': 1,
                        'category': id
                    },
                    beforeSend: function(){
                        $('#loading').show();
                    },
                    complete: function(){
                        $('#loading').hide();
                    },
                    success: function (data) {
                        $('#sel_plyr').html(data);         
                    }
                });
            });
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
            function teamdetail(id){
                var form = document.createElement("form");
                form.setAttribute("method", "POST");
                form.setAttribute("action", "TeamDetails");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "ID_T");
                hiddenField.setAttribute("value", id);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit();
            }
        </script>
<!-- //js-scripts -->
</body>
</html>
