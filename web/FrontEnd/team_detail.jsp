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
<link rel="stylesheet" href="css/styles.css">
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<!-- //web-fonts -->
<style>
	h2 {
   width: 100%; 
   text-align: center; 
   border-bottom: 2px solid #ffcc00; 
   line-height: 0.1em;
   margin: 10px 0 20px; 
} 

h2 span { 
	background-color: white;
    color:#23B684;
    padding:0 10px; 
}
.kotak_team_isi > h5:hover{
    cursor:pointer;
    color:#23B684;
}
</style>
</head>
<body>
<%@include file="Sync/Menu.jsp" %>
<c:forEach var = "item" items = "${requestScope.team}">
     <c:set var = "idmusim" value ="${requestScope.idmusim}"/>
<div class="row" style="margin-top:10px;margin-bottom:10px;">
	<div class="col-lg-3 col-lg-offset-2 col-md-4 col-sm-5 col-xs-5 team_logo">
		<img src="../img/Team/Logo/${item.value.logo}" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" alt="${item.value.namateam}" width="150" height="150"/>
	</div>
	<div class="col-lg-6  col-md-6 col-sm-7 col-xs-7 team_name">
            <h3>${requestScope.thn_awal} - ${requestScope.thn_akhir} ${item.value.namateam}</h3>
            
	</div>
           
</div>
            <div class="container">  
                
                <div class="btn-group">                    
                    <c:if test = "${requestScope.idmusimprev != 0}" >
                        <button class="btn btn-default" onclick="previous('${item.value.id}','${idmusim}')"><span class="glyphicon glyphicon-chevron-left"></span> <b>Previous Season</b></button>
                    </c:if>
                    <c:if test = "${requestScope.idmusimnext != 0}" >
                        <button class="btn btn-default" onclick="next('${item.value.id}','${idmusim}')"><b>Next Season</b> <span class="glyphicon glyphicon-chevron-right"></span></button>
                    </c:if>       
                </div>
                <!--
                <c:if test = "${requestScope.idmusimprev != 0}" >
                    <button class="btn btn-default" onclick="previous('${item.value.id}','${idmusim}')"><span class="glyphicon glyphicon-chevron-left"></span> <b>Previous Season</b></button>
                </c:if>
                <c:if test = "${requestScope.idmusimnext != 0}" >
                    <button class="btn btn-default" style="float:right;" onclick="next('${item.value.id}','${idmusim}')"><b>Next Season</b> <span class="glyphicon glyphicon-chevron-right"></span></button>
                </c:if>  -->
                <!--                
                <button class="btn btn-default" onclick="previous('${item.value.id}','${idmusim}')"><span class="glyphicon glyphicon-chevron-left"></span> <b>Previous</b></button>    
                <button class="btn btn-default" style="float:right;" onclick="next('${item.value.id}','${idmusim}')"><b>Next</b> <span class="glyphicon glyphicon-chevron-right"></span></button>
                -->
            </div>
            <script>
                function previous(id_t, idmusim){
                    var ids = idmusim;
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "Previous");
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "id_t");
                    hiddenField.setAttribute("value", id_t);
                    form.appendChild(hiddenField);
                    var hiddenField1 = document.createElement("input");
                    hiddenField1.setAttribute("type", "hidden");
                    hiddenField1.setAttribute("name", "id_musim");
                    hiddenField1.setAttribute("value", idmusim);
                    form.appendChild(hiddenField1);                    
                    document.body.appendChild(form);
                    form.submit();                    
                 }
                 function next(id_t, idmusim){
                    var ids = idmusim;
                    var form = document.createElement("form");
                    form.setAttribute("method", "POST");
                    form.setAttribute("action", "Next");
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", "id_t");
                    hiddenField.setAttribute("value", id_t);
                    form.appendChild(hiddenField);
                    var hiddenField1 = document.createElement("input");
                    hiddenField1.setAttribute("type", "hidden");
                    hiddenField1.setAttribute("name", "id_musim");
                    hiddenField1.setAttribute("value", idmusim);
                    form.appendChild(hiddenField1);                    
                    document.body.appendChild(form);
                    form.submit();                    
                 }
            </script>
<div class="col-lg-12 team_stats">
	<h3> ${item.value.namateam} STATISTICS <span class="glyphicon glyphicon-stats"> </span></h3>
</div>
</c:forEach>
<div class="row team_stats2">
	<div class="col-lg-3 col-md-5 col-sm-5 top_point">
		<h4>TOP POINTS</h4>
                <c:forEach var = "item" items = "${requestScope.tp}">
		<div class="kotak_team">
			<div class="kotak_team_isi" style="vertical-align:top;">
				<img src="../img/Players/${item.value.foto}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" class="img-circle" width="55" height="55"/>
			</div>
			<div class="kotak_team_isi" style="max-width:170px;">
                            <h5 onclick="playdetail(${item.value.id})">${item.value.namaPemain}</h5>
				<p>${item.value.pos}</p>
			</div>
			<div class="kotak_team_isi pull-right">
				<h5 style="margin:3px 4px 0 0">${item.value.point}</h5>
			</div>
		</div>
                </c:forEach>
		
	</div>
	<div class="col-lg-3 col-md-5 col-sm-5 top_point">
		<h4>TOP ASSISTS</h4>
		<c:forEach var = "item" items = "${requestScope.ta}">
		<div class="kotak_team">
			<div class="kotak_team_isi" style="vertical-align:top;">
				<img src="../img/Players/${item.value.foto}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" class="img-circle" width="55" height="55"/>
			</div>
			<div class="kotak_team_isi" style="max-width:170px;">
				<h5 onclick="playdetail(${item.value.id})">${item.value.namaPemain}</h5>
				<p>${item.value.pos}</p>
			</div>
			<div class="kotak_team_isi pull-right">
				<h5 style="margin:3px 4px 0 0">${item.value.point}</h5>
			</div>
		</div>
                </c:forEach>
	</div>
	<div class="col-lg-3 col-md-5 col-sm-5 top_point">
		<h4>TOP REBOUNDS</h4>
		<c:forEach var = "item" items = "${requestScope.tr}">
		<div class="kotak_team">
			<div class="kotak_team_isi" style="vertical-align:top;">
				<img src="../img/Players/${item.value.foto}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" class="img-circle" width="55" height="55"/>
			</div>
			<div class="kotak_team_isi" style="max-width:170px;">
				<h5 onclick="playdetail(${item.value.id})">${item.value.namaPemain}</h5>
				<p>${item.value.pos}</p>
			</div>
			<div class="kotak_team_isi pull-right">
				<h5 style="margin:3px 4px 0 0">${item.value.point}</h5>
			</div>
		</div>
                </c:forEach>
	</div>
</div>
<div class="general_stats">
	<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#home">  <b>GENERAL STATS</b></a></li>
					
				  </ul>
				
				  <div class="tab-content">
					<div id="home" class="tab-pane fade in active">
						
						<div style='margin-top:10px'>
						  <form>
                                                        <input type="text" value="${requestScope.id_team}" class="hidden id_hide"/>
							<label class='form-group'>Search By Season : </label>
							<select name='kat_lok' class='form-group' id='lok'>
                                                            <c:forEach var="item" items="${requestScope.ss}">
								<option value='${item.value.id_musim}'>${item.value.nama_m}</option>								
                                                            </c:forEach>
							</select>
						  </form>
						</div>

						<div class="tbl_general table-responsive gs">
							<table class="table table-bordered table-striped tb_pemain">
								<tr class="tr_general">
									<th>NO</th>
                                                                        
									<th>PLAYER</th>
									<th>POS</th>
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
                                                                <c:forEach var = "item" varStatus="loopCounter" items = "${requestScope.gs}">
								<tr>
									<td>${loopCounter.count}</td>
									<td>${item.value.namapemain}</td>
									<td>${item.value.pos}</td>
									<td>${item.value.gp}</td>
									<td>${item.value.min}</td>
									<td>${item.value.fgm}</td>
									<td>${item.value.fga}</td>
									<td>${item.value.fg}%</td>
									<td>${item.value.pm2}</td>
									<td>${item.value.pa2}</td>
									<td>${item.value.p2}%</td>
									<td>${item.value.pm3}</td>
									<td>${item.value.pa3}</td>
									<td>${item.value.p3}%</td>
									<td>${item.value.ftm}</td>
									<td>${item.value.fta}</td>
									<td>${item.value.ft}%</td>
									<td>${item.value.or1}</td>
									<td>${item.value.dr}</td>
									<td>${item.value.tr}</td>
									<td>${item.value.as}</td>
									<td>${item.value.to}</td>
									<td>${item.value.st}</td>
									<td>${item.value.bl}</td>
									<td>${item.value.ef}</td>
									<td>${item.value.pts}</td>
								</tr>
                                                                </c:forEach>
							</table>
						</div>
						
					</div>
				</div>
</div>
<div class="team" id="team">
		<div class="container">
		<h2>
			<span>ROSTER</span>
		</h2>
			<div class="wthree_team_grids">                                
                                <c:forEach var = "item" items = "${requestScope.playerlist}">
                                <div class="col-md-3 wthree_team_grid">
					<div class="hovereffect" onclick="playdetail(${item.value.id_pemain})">
						<img src="../img/Players/${item.value.foto}" alt="${item.value.nama_pemain}"  onerror="this.onerror=null;this.src='../img/Players/nopics.png';" width="100%" height="300" />
						<div class="overlay">
                                                    <h6>${item.value.nama_pemain}</h6>
						</div>
					</div>
					<h4>${item.value.nama_posisi}</h4>
					<p>${item.value.tinggi} cm</p>
				</div>
                                </c:forEach>
                                
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
                                                        
                 

        <%@include file="Sync/footer.jsp" %>
<!-- js-scripts -->					
<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
<!-- //js -->	
<script>
    $('#lok').change(function(){
        $('.tb_pemain').remove();
                var id_m = $(this).val();
                var id_t = $('.id_hide').val();
                //alert(id_m+", "+id_t);                
                $.ajax({
                    type : 'POST',
                    url : 'GeneralStat',
                    data: {
                        'id_m': id_m,
                        'id_t': id_t
                    },
                    beforeSend: function(){
                    },
                    success: function(data){
                        $('.gs').append(data);      
                    }
                });
                
            });
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
</script>


<!-- //js-scripts -->
</body>
</html>
