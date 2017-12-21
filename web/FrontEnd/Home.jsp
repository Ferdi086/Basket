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
    <%@include file="Sync/Menu.jsp" %>

    <div class='row bungkus'>
        <p style="margin-left:25px;"><b>BasketBall Statistics</b> for IBL(Indonesian Basketball League)</p>
        
        <div class='col-lg-3 col-md-12-sm-12 kiri'>
            <div class='kiri_jud'>
                <h4><center>Every Local Player</center></h4>
            </div>
            <center>
                <div class='foto_wrap' style="padding-left:5px;padding-right: 5px;">
                    <c:forEach var = "item" items = "${requestScope.p1}">
                        <a href="#" data-toggle="tooltip" data-placement="right" title="${item.value.namaPemain}">
                            <img src="../img/Players/${item.value.foto}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" class="foto_pl" onclick="playdetail('${item.value.idPemain}')">
                        </a>
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
                <h4><center>Every Team</center></h4>
            </div>
            <div class="kanan_isi">
                <c:forEach var="item" items="${requestScope.current}">
                    <h4>${item.value.thn_awal} - ${item.value.thn_akhir} IBL Standings</h4>
                </c:forEach>
                
                
                <table class="table table-bordered tb_div">
                        <tr>
                            <th data-valign="middle" data-sortable="true">No</th>
                            <th style='text-align:left'>Divisi Merah</th>
                        </tr>
                        <c:forEach var='item' items='${requestScope.klasmen_m}'>
                            <tr>
                                <td>${item.value.no}</td>
                                <td style='text-align:left'>
                                    <a href='#' onclick="teamdetail('${item.value.id_team}')" data-toggle="tooltip" data-placement="right" title="${item.value.id_team}"><img src='../img/Team/Logo/${item.value.logo}' class='logo_kcl'>${item.value.nama}</a>
                                </td>
                            </tr>
                            
                        </c:forEach>
                </table>
                <table class="table table-bordered tb_div">
                        <tr>
                            <th>No</th>
                            <th style='text-align:left'>Divisi Putih</th>
                        </tr>
                        <c:forEach var='item' items='${requestScope.klasmen_p}'>
                            <tr>
                                <td>${item.value.no}</td>
                                <td style='text-align:left'>
                                    <a href='#' onclick="teamdetail('${item.value.id_team}')" data-toggle="tooltip" data-placement="right" title="${item.value.id_team}"><img src='../img/Team/Logo/${item.value.logo}' class='logo_kcl'>${item.value.nama}</a>
                                </td>
                            </tr>
                        </c:forEach>
                </table>
            </div>
        </div>
        <div class='col-lg-3 col-md-12-sm-12 kiri'>
            <div class='kiri_jud'>
                <h4><center>Every Import Player</center></h4>
            </div>
            <center>
                <div class='foto_wrap' style="padding-left:5px;padding-right: 5px;">
                    <c:forEach var = "item" items = "${requestScope.p1a}">
                        <a href="#" data-toggle="tooltip" data-placement="right" title="${item.value.namaPemain}">
                            <img src='../img/Players/${item.value.foto}' onerror="this.onerror=null;this.src='../img/Players/nopics.png';" class="foto_pl" onclick="playdetail('${item.value.idPemain}')">
                        </a>
                    </c:forEach>
                </div>
                <div class="kiri_form">
                <form id="Pl_kiri2" method="post" action="PlayerDetails">		
                    <select name='' class="form-group" id="sel_team2" required>
                            <option value=''> ------------ Select a Team ------------ </option>
                            <c:forEach var="item" items="${requestScope.team}">
                                <option value="${item.value.id}"> ${item.value.namateam} </option>
                            </c:forEach>
                    </select>
                    <select id="sel_plyr2" name='ID_P' required>
                            <option value=''> ------------ Select a Player ------------ </option>
                    </select><br>
                    <button class="kiri_btn"> Go </button>
                </form> 
                </div>
            </center>
        </div>
        <div class='col-lg-3 col-md-10 pojok'>
            <div class='pojok_jud'>
                <h4><center>Others News</center></h4>
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
    
    
        <%@include file="Sync/footer.jsp" %>

<!-- js scripts -->
	
        
        <script>
            $(document).ready(function(){ 
                $("#sel_plyr").select2();
                $("#sel_plyr2").select2();
                $('[data-toggle="tooltip"]').tooltip();   
            });
            $('#sel_team').change(function () {
                var id = $(this).val();
                //alert(id); 
                $.ajax({
                    type: 'POST',
                    url: '../FrontEnd/doSelectPlayer2',
                    data: {
                        'asal' : "Lokal",
                        'bagian': 1,
                        'category': id
                    },
                    success: function (data) {
                        $('#sel_plyr').html(data);         
                    }
                });
            });
            
            $('#sel_team2').change(function () {
                var id = $(this).val();
                //alert(id); 
                $.ajax({
                    type: 'POST',
                    url: '../FrontEnd/doSelectPlayer2',
                    data: {
                        'asal': "Asing",
                        'bagian': 1,
                        'category': id
                    },
                    success: function (data) {
                        $('#sel_plyr2').html(data);         
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
