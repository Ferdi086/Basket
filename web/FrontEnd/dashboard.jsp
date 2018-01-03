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
<link rel="stylesheet" href="css/team_hover.css"> 
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->

</head>
<body>
<%@include file="Sync/Menu.jsp" %>

<center>
		<h2 style="margin-top:2%"><span>DASHBOARD</span></h2>
</center>

<div class="bungkus_dash" style="height:1600px">
    <div class="isi_dash col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <h4>Top Points</h4>
        <table class="table table-bordered table-responsive tb_dash">
            <tr>
                <th style="width: 50px">No</th>
                <th>Nama</th>
                <th>Team</th>
                <th>Points</th>
            </tr>
            <c:forEach var="item" items="${requestScope.topPoint}">
            <tr>
                <td>${item.value.no}</td>
                <td><a href='#' onclick='playdetail(${item.value.id_pemain})'>${item.value.nama_pemain}</a></td>
                <td><a href='#' onclick="teamdetail('${item.value.id_team}')" data-toggle="tooltip" title="${item.value.id_team}"><img src='../img/Team/Logo/${item.value.logo}' class='logo_dash'></a></td>
                <td>${item.value.point}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <div class="isi_dash col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <h4>Top Rebounds</h4>
        <table class="table table-bordered table-responsive tb_dash">
            <tr>
                <th style="width: 50px">No</th>
                <th>Nama</th>
                <th>Team</th>
                <th>Points</th>
            </tr>
            <c:forEach var="item" items="${requestScope.topRebound}">
            <tr>
                <td>${item.value.no}</td>
                <td><a href='#' onclick='playdetail(${item.value.id_pemain})'>${item.value.nama_pemain}</a></td>
                <td><a href='#' onclick="teamdetail('${item.value.id_team}')" data-toggle="tooltip" title="${item.value.id_team}"><img src='../img/Team/Logo/${item.value.logo}' class='logo_dash'></a></td>
                <td>${item.value.point}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
    <div class="isi_dash col-lg-4 col-md-6 col-sm-6 col-xs-12">
        <h4>Top Assists</h4>
        <table class="table table-bordered table-responsive tb_dash">
            <tr>
                <th style="width: 50px">No</th>
                <th>Nama</th>
                <th>Team</th>
                <th>Points</th>
            </tr>
            <c:forEach var="item" items="${requestScope.topAssist}">
            <tr>
                <td>${item.value.no}</td>
                <td><a href='#' onclick='playdetail(${item.value.id_pemain})'>${item.value.nama_pemain}</a></td>
                <td><a href='#' onclick="teamdetail('${item.value.id_team}')" data-toggle="tooltip" title="${item.value.id_team}"><img src='../img/Team/Logo/${item.value.logo}' class='logo_dash'></a></td>
                <td>${item.value.point}</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>

        <%@include file="Sync/footer.jsp" %>
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	

<script>
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
                hiddenField.setAttribute("name", "id_t");
                hiddenField.setAttribute("value", id);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit();
            }
</script>



<!-- //js-scripts -->
</body>
</html>
