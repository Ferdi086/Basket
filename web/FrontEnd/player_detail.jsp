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
	#team{
		margin-top:2%;
	}
	.team{
		padding-top:0;
	}
        .punggung{
            background-image: url('../img/jersey2.png');
            background-size:cover;
            min-width: 70px;
            min-height:80px;
            color:white;
            text-align:center;
            margin-right:10%;
        }
        .punggung h2{
            margin-top: 40%;
            margin-left: 15%;
        }
        .tb_p{
            margin-top: 2%;
            margin-right: 2%;
            margin-left: 1%;
        }
        .tb_p td{
            min-width:120px; 
            background:white;
        }
        #imgteam:hover{
            cursor:pointer;
        }
        #namateam:hover{
            color:white;
        }
</style>
</head>
<body>
<%@include file="Sync/Menu.jsp" %>


<div class="row det_player">
    <c:forEach var = "item" items = "${requestScope.player}">
	<div class="team" id="team">
			<div class="wthree_team_grids">
				<div class="col-md-3 wthree_team_grid foto_p">
					<div class="hovereffect">
                                            <img src="../img/Players/${item.value.foto}" alt="${item.value.namaPemain}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" class="img-responsive" width="400" height="400"/>						
					</div>
				</div>
			</div>
	</div>
	<div class="col-lg-4 nama_p">
                 <div class="pull-right punggung">
                     <h2>
                         <c:if test = "${item.value.noPunggung == NULL}">
                             ?
                         </c:if>
                         ${item.value.noPunggung}
                     </h2>
                </div>
		<h1>${item.value.namaPemain}</h1>
                <br>
		<h3 style="color:white">${item.value.namaPos}</h3>
                <br/>
                <table id='imgteam'>
                    <tr onclick="teamdetail('${item.value.idTeam}','${requestScope.id_musim}','${requestScope.thn_awal}','${requestScope.thn_akhir}')">
                        <td>
                            <img src="../img/Team/Logo/${item.value.logo}" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" width="65" height="65"/>
                        </td>
                        <td style='padding:7px'>
                            <a href="#" style="color:black" ><h3 id='namateam'>${item.value.team}</h3></a>
                        </td>
                    </tr>
                </table>
		
		<br/>
                <h4><span>Birthdate</span>  : 
                    <c:choose>         
                        <c:when test = "${item.value.tgl == '1 January 1900'}">
                            ? 
                        </c:when>  
                        <c:otherwise>
                            ${item.value.tgl} 
                        </c:otherwise>  
                    </c:choose> 
                </h4>
		<h4><span>Height</span> :
                    <c:choose>         
                        <c:when test = "${item.value.tinggi == 0}">
                            ? cm
                        </c:when>  
                        <c:otherwise>
                            ${item.value.tinggi} cm
                        </c:otherwise>  
                    </c:choose>  
                </h4>
		<h4><span>Weight</span> : 
                    <c:choose>         
                        <c:when test = "${item.value.berat == 0}">
                            ? Kg
                        </c:when>  
                        <c:otherwise>
                            ${item.value.berat} Kg
                        </c:otherwise>  
                    </c:choose>  
                </h4>
	</div>
    </c:forEach>
	<div class="col-lg-4 stat_p" >
            <h3>Regular</h3>
            <table class="table table-bordered tb_career">
                <tr>
                    <th>Summary</th>
                    <th>GP</th>
                    <th>PPG</th>
                    <th>RPG</th>
                    <th>APG</th>
                    <th>FG%</th>
                    <th>FT%</th>
                </tr>
                <c:forEach var="item" items="${requestScope.sum}">
                <tr>
                    <td>${item.value.sum}</td>
                    <td>${item.value.GP}</td>
                    <td>${item.value.ppg}</td>
                    <td>${item.value.rpg}</td>
                    <td>${item.value.apg}</td>
                    <td>${item.value.fg}</td>
                    <td>${item.value.ft}</td>
                </tr>
                </c:forEach>
                <c:forEach var="item" items="${requestScope.sumcar}">
                    <c:choose>        
                        <c:when test = "${empty item.value.GP}">
                            <tr>
                                <td colspan="7"><center>No matching records found</center></td>
                            </tr>
                        </c:when>  
                        <c:otherwise>
                            <tr>
                                <td>${item.value.sum}</td>
                                <td>${item.value.GP}</td>
                                <td>${item.value.ppg}</td>
                                <td>${item.value.rpg}</td>
                                <td>${item.value.apg}</td>
                                <td>${item.value.fg}</td>
                                <td>${item.value.ft}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose> 
                </c:forEach>                
            </table>
            
            <h3>Playoff</h3>
            <table class="table table-bordered tb_career">
                <tr>
                    <th>Summary</th>
                    <th>GP</th>
                    <th>PPG</th>
                    <th>RPG</th>
                    <th>APG</th>
                    <th>FG%</th>
                    <th>FT%</th>
                </tr>
                <c:forEach var="item" items="${requestScope.sumpo}">
                    <tr>
                        <td>${item.value.sum}</td>
                        <td>${item.value.GP}</td>
                        <td>${item.value.ppg}</td>
                        <td>${item.value.rpg}</td>
                        <td>${item.value.apg}</td>
                        <td>${item.value.fg}</td>
                        <td>${item.value.ft}</td>
                    </tr>
                </c:forEach>
                <c:forEach var="item" items="${requestScope.sumpocar}">
                    <c:choose>        
                        <c:when test = "${empty item.value.GP}">
                            <tr>
                                <td colspan="7"><center>No matching records found</center></td>
                            </tr>
                        </c:when>  
                        <c:otherwise>
                            <tr>
                                <td>${item.value.sum}</td>
                                <td>${item.value.GP}</td>
                                <td>${item.value.ppg}</td>
                                <td>${item.value.rpg}</td>
                                <td>${item.value.apg}</td>
                                <td>${item.value.fg}</td>
                                <td>${item.value.ft}</td>
                            </tr>
                        </c:otherwise>
                    </c:choose> 
                </c:forEach>
                
            </table>
            
	</div>
</div>


<div class="game_stats">
	<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#menu01">  <b>STATS</b></a></li>
					<li><a data-toggle="tab" href="#menu1">  <b>GAMELOG</b></a></li>
					<li><a data-toggle="tab" href="#menu2">  <b>HISTORY TEAM</b></a></li>
  	</ul>
				
				  <div class="tab-content">
					<div id="menu01" class="tab-pane fade in active">                                            
                                                    <h3 style="margin:3% 0 1% 0">REGULAR</h3>
                                                    <div class="tbl_general table-responsive">
                                                            <table class="table table-bordered table-striped">
                                                                    <tr class="tr_general">
                                                                            <th>YEAR</th>
                                                                            <th>TEAM</th>
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
                                                                            <th>PF</th>
                                                                            <th>EF</th>
                                                                            <th>Average Points</th>
                                                                            <th>Total Points</th>
                                                                    </tr>

                                                                    <c:forEach var="item" items="${requestScope.player_stat}">                                                                        
                                                                    <tr>
                                                                            <td>${item.value.period}</td>
                                                                            <td>${item.value.id_team}</td>
                                                                            <td>${item.value.GP}</td>
                                                                            <td>${item.value.MIN}</td>
                                                                            <td>${item.value.FGM}</td>
                                                                            <td>${item.value.FGA}</td>
                                                                            <td>${item.value.FG}</td>
                                                                            <td>${item.value.PM2}</td>
                                                                            <td>${item.value.PA2}</td>
                                                                            <td>${item.value.p2}</td>
                                                                            <td>${item.value.PM3}</td>
                                                                            <td>${item.value.PA3}</td>
                                                                            <td>${item.value.p3}</td>
                                                                            <td>${item.value.FTM}</td>
                                                                            <td>${item.value.FTA}</td>
                                                                            <td>${item.value.FT}</td>
                                                                            <td>${item.value.o_R}</td>
                                                                            <td>${item.value.DR}</td>
                                                                            <td>${item.value.TR}</td>
                                                                            <td>${item.value.a_S}</td>
                                                                            <td>${item.value.t_O}</td>
                                                                            <td>${item.value.ST}</td>
                                                                            <td>${item.value.BL}</td>
                                                                            <td>${item.value.PF}</td>
                                                                            <td>${item.value.EF}</td>
                                                                            <td>${item.value.PTS}</td>
                                                                            <td>${item.value.SPTS}</td>
                                                                    </tr>
                                                                    </c:forEach>
                                                                    <c:forEach var="item" items="${requestScope.player_stat_sum}">
                                                                        <c:choose>         
                                                                            <c:when test = "${empty item.value.GP}">
                                                                                <tr>
                                                                                    <td colspan="26"><center>No matching records found</center></td>
                                                                                </tr>
                                                                            </c:when>  
                                                                            <c:otherwise>
                                                                                <tr>
                                                                                    <td colspan="2"></td>
                                                                                    <td>
                                                                                        ${item.value.GP}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.MIN}
                                                                                    </td>
                                                                                    <td>                                                                                
                                                                                        ${item.value.FGM}
                                                                                    </td>
                                                                                    <td>                                                                                
                                                                                        ${item.value.FGA}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FG}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PM2}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PA2}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.p2}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PM3}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PA3}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.p3}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FTM}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FTA}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FT}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.o_R}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.DR}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.TR}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.a_S}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.t_O}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.ST}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.BL}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PF}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.EF}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PTS}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.SPTS}
                                                                                    </td>
                                                                                </tr>   
                                                                            </c:otherwise>
                                                                        </c:choose>                                                     
                                                                    </c:forEach>
                                                            </table>
                                                    </div>
                                                    
                                                    <h3 style="margin:3% 0 1% 0">PLAYOFF</h3>
                                                    <div class="tbl_general table-responsive">
                                                            <table class="table table-bordered table-striped">
                                                                    <tr class="tr_general">
                                                                            <th>YEAR</th>
                                                                            <th>TEAM</th>
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
                                                                            <th>PF</th>
                                                                            <th>EF</th>
                                                                            <th>Average Points</th>
                                                                            <th>Total Points</th>
                                                                    </tr>

                                                                    <c:forEach var="item" items="${requestScope.player_stat2}">
                                                                    <tr>
                                                                            <td>${item.value.period}</td>
                                                                            <td>${item.value.id_team}</td>
                                                                            <td>${item.value.GP}</td>
                                                                            <td>${item.value.MIN}</td>
                                                                            <td>${item.value.FGM}</td>
                                                                            <td>${item.value.FGA}</td>
                                                                            <td>${item.value.FG}</td>
                                                                            <td>${item.value.PM2}</td>
                                                                            <td>${item.value.PA2}</td>
                                                                            <td>${item.value.p2}</td>
                                                                            <td>${item.value.PM3}</td>
                                                                            <td>${item.value.PA3}</td>
                                                                            <td>${item.value.p3}</td>
                                                                            <td>${item.value.FTM}</td>
                                                                            <td>${item.value.FTA}</td>
                                                                            <td>${item.value.FT}</td>
                                                                            <td>${item.value.o_R}</td>
                                                                            <td>${item.value.DR}</td>
                                                                            <td>${item.value.TR}</td>
                                                                            <td>${item.value.a_S}</td>
                                                                            <td>${item.value.t_O}</td>
                                                                            <td>${item.value.ST}</td>
                                                                            <td>${item.value.BL}</td>
                                                                            <td>${item.value.PF}</td>
                                                                            <td>${item.value.EF}</td>
                                                                            <td>${item.value.PTS}</td>
                                                                            <td>${item.value.SPTS}</td>
                                                                    </tr>
                                                                    </c:forEach>
                                                                    <c:forEach var="item" items="${requestScope.player_stat2_sum}">
                                                                        <c:choose>         
                                                                            <c:when test = "${empty item.value.GP}">
                                                                                <tr>
                                                                                    <td colspan="26"><center>No matching records found</center></td>
                                                                                </tr>
                                                                            </c:when>  
                                                                            <c:otherwise>
                                                                                <tr>
                                                                                    <td colspan="2"></td>
                                                                                    <td>
                                                                                        ${item.value.GP}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.MIN}
                                                                                    </td>
                                                                                    <td>                                                                                
                                                                                        ${item.value.FGM}
                                                                                    </td>
                                                                                    <td>                                                                                
                                                                                        ${item.value.FGA}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FG}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PM2}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PA2}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.p2}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PM3}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PA3}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.p3}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FTM}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FTA}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.FT}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.o_R}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.DR}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.TR}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.a_S}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.t_O}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.ST}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.BL}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PF}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.EF}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.PTS}
                                                                                    </td>
                                                                                    <td>
                                                                                        ${item.value.SPTS}
                                                                                    </td>
                                                                                </tr>   
                                                                            </c:otherwise>
                                                                        </c:choose>                                                              
                                                                    </c:forEach>
                                                            </table>
                                                    </div>
						
					</div>
                                      
					<div id="menu1" class="tab-pane fade">
					
						<div style='margin-top:10px'>
						  <form>
                                                        <input type="text" value="${requestScope.id_pem}" class="hidden id_hide"/>
							<label class='form-group'>Search By Season : </label>
							<select name='' class='form-group' id='se_season'>
                                                            <option value=""> ------- Choose One ------- </option>
                                                            <c:forEach var="item" items="${requestScope.player_gl}">
								<option value='${item.value.id_m}'>${item.value.nama_m}</option>
                                                            </c:forEach>
							</select>
						  </form>
						</div>

						<div class="tbl_general table-responsive bungkus_season">
							<table class="table table-bordered table-striped tb_season">
								<tr class="tr_general">
                                                                        <th>DATE</th>
									<th>MATCH</th>
									<th>W/L</th>
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
									<th>PF</th>
									<th>EF</th>
									<th>PTS</th>
								</tr>
                                                                <tr>
                                                                    <td colspan="26"><center>No matching records found</center></td>
                                                                </tr>
							</table>
						</div>
						
					</div>
                                        <div id="menu2" class="tab-pane fade">
                                            <div class="tbl_general table-responsive" style="margin-top:3%">
							<table class="table table-bordered table-striped histo">
                                                            <tr class="tr_general">
                                                                <th>SEASON</th>
                                                                <th>AGE</th>
                                                                <th>TEAM</th>
                                                                <th>POSITION</th>
                                                                <th>Number of Games</th>
                                                            </tr>
                                                            <c:forEach var="item" items="${requestScope.his}">
                                                            <tr>
                                                                <td>${item.value.season}</td>
                                                                <td>${item.value.age}</td>
                                                                <td><a href='#' onclick="teamdetail('${item.value.team}','${requestScope.id_musim}','${requestScope.thn_awal}','${requestScope.thn_akhir}')"><img src="../img/Team/Logo/${item.value.logo}" style="width:50px; height:50px">
                                                                    ${item.value.nteam}</a></td>
                                                                <td>${item.value.pos}</td>
                                                                <td>${item.value.gp}</td>
                                                            </tr>
                                                            </c:forEach>
                                                        </table>
                                            </div>
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
            $('#se_season').change(function(){
                $('.tb_season').remove();
                var id_m = $(this).val();
                var id_p = $('.id_hide').val();
                $.ajax({
                    type : 'POST',
                    url : 'PlayersBySeason',
                    data: {
                        'id_m': id_m,
                        'id_p': id_p
                    },
                    beforeSend: function(){
                    },
                    success: function(data){
                        $('.bungkus_season').append(data);      
                    }
                });
            });
            
            function teamdetail(id_t, id_musim, thn_awal, thn_akhir){
                var form = document.createElement("form");
                form.setAttribute("method", "POST");
                form.setAttribute("action", "TeamDetails");
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "id_t");
                hiddenField.setAttribute("value", id_t);
                form.appendChild(hiddenField);
                var hiddenField2 = document.createElement("input");
                hiddenField2.setAttribute("type", "hidden");
                hiddenField2.setAttribute("name", "id_musim");
                hiddenField2.setAttribute("value", id_musim);
                form.appendChild(hiddenField2);
                var hiddenField3 = document.createElement("input");
                hiddenField3.setAttribute("type", "hidden");
                hiddenField3.setAttribute("name", "thn_awal");
                hiddenField3.setAttribute("value", thn_awal);
                form.appendChild(hiddenField3);
                var hiddenField4 = document.createElement("input");
                hiddenField4.setAttribute("type", "hidden");
                hiddenField4.setAttribute("name", "thn_akhir");
                hiddenField4.setAttribute("value", thn_akhir);
                form.appendChild(hiddenField4);
                document.body.appendChild(form);
                form.submit();
            }
        </script>
</body>
</html>
