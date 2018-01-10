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
                    <table class="table table-bordered  table-responsive" id="table" data-toggle="table" data-search="true" data-url="DataMatch?id_m=5" data-page-list="[10, 25, 50, 100, ALL]"  data-show-pagination-switch="true"
           data-pagination="true">
                        <thead>
                            <tr>
                                <th data-align="center" data-field="tgl">Date</th>
                                <th data-align="center" data-field="team1">Team 1</th>
                                <th data-align="center" data-field="pts1"> PTS</th>
                                <th data-align="center" data-field="team2">Team 2</th>
                                <th data-align="center" data-field="pts2">PTS</th>
                            </tr>
                        </thead>
                        <tbody class="tbl_">
                            
                        </tbody>
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
       //$('.aa').remove();
        var id = $(this).val();
        $("#table").bootstrapTable('refresh', {
            url: 'DataMatch?id_m='+id
        });
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
    });
    
            function teamdetail(id_t, id_musim, thn_awal, thn_akhir){
                var form = document.createElement("form");
                form.setAttribute("method","POST");
                form.setAttribute("action","TeamDetails");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type","hiden");
                hiddenField.setAttribute("name","id_t");
                hiddenField.setAttribute("value",id_t);
                form.appendChild(hiddenField);
                document.body.appendChild(form);
                form.submit();
            }
                
         
</script>




<!-- //js-scripts -->
</body>
</html>
