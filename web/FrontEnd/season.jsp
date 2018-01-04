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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- css files -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" /> <!-- Style-CSS --> 
<link rel="stylesheet" href="css/font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="css/team_hover.css"> 
<link rel="stylesheet" href="css/styles.css"> 
<link rel="stylesheet" href="css/bootstrap-table.css">
<!-- //css files -->
<script type="text/javascript" src="js/bootstrap-table.js"></script>
        <script type="text/javascript" src="js/moment.min.js"></script>
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->

</head>
<body>
<%@include file="Sync/Menu.jsp" %>

<center>
		<h2 style="margin-top:2%"><span>IBL Schedule and Results</span></h2>
</center>
                <div class='row tgh center-block'>
                    <div class='logo_ibl'>
                     <img src='../img/logo_ibl.jpg' style='max-width:150px'/>
                    </div>
                    <div class='dropd'>
                        <form>		
                            <select name='' class='form-group' id="sel_sea">
                                    <option value=''> ------ Select Season ------ </option>
                                    <c:forEach var='item' items='${requestScope.musim}'>
                                         <option value='${item.value.id_musim}'> ${item.value.nama_musim}</option>
                                    </c:forEach>
                            </select>
                        </form>
                        <div class='bungkus'>
                            <div class='leader'>
                                <b>PPG Leader : </b> 
                                    <c:forEach var='item' items='${requestScope.ppg}'>
                                      <a href='#' onclick="playdetail('${item.value.foto}')">${item.value.namaPemain}</a>
                                    </c:forEach>
                                <br>
                                <b>APG Leader : </b> 
                                    <c:forEach var='item' items='${requestScope.apg}'>
                                      <a href='#' onclick="playdetail('${item.value.foto}')">${item.value.namaPemain}</a>
                                    </c:forEach>
                                  <br>
                                <b>RPG Leader : </b> 
                                    <c:forEach var='item' items='${requestScope.rpg}'>
                                      <a href='#' onclick="playdetail('${item.value.foto}')">${item.value.namaPemain}</a>
                                    </c:forEach>
                                <br>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-sm-12-md-12 tbl_schedule center-block">
                    <center>
                    <table class="table table-bordered tb_div table-responsive" style="max-width: 1000px">
                        <tr>
                            <th>Date</th>
                            <th>Team 1</th>
                            <th>PTS</th>
                            <th>Team 2</th>
                            <th>PTS</th>
                        </tr>
                        <c:forEach var='item' items='${requestScope.statistik}'>                            
                            <tr>
                                <td><a href='#' data-toggle="tooltip" title="${item.value.match}">${item.value.tgl}</a></td>
                                <td><a href='#'><img src='../img/Team/Logo/${item.value.logo1}' class='logo_kcl'>${item.value.team1}</a></td>
                                <td>${item.value.pts1}</td>
                                <td><a href='#'><img src='../img/Team/Logo/${item.value.logo2}' class='logo_kcl'>${item.value.team2}</a></td>
                                <td>${item.value.pts2}</td>
                            </tr>
                        </c:forEach>
                        
                    </table>
                    </center>
                </div>

    
        <%@include file="Sync/footer.jsp" %>
<!-- js-scripts -->					
<!-- js -->
	
  
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
    $('#sel_sea').change(function (){
        $('.leader').remove();
        $('.tb_div').remove();
        var id = $(this).val();
        $.ajax({
            type : 'POST',
            url : 'SeasonLeader',
            data: {
                'id_m': id
            },
            beforeSend: function(){
            },
            success: function(data){
                $('.bungkus').append(data);      
            }
        });
        $.ajax({
            type : 'POST',
            url : 'SeasonTabel',
            data: {
                'id_m': id
            },
            beforeSend: function(){
            },
            success: function(data){
                $('.tbl_schedule').append(data);      
            }
        });
    });
</script>




<!-- //js-scripts -->
</body>
</html>
