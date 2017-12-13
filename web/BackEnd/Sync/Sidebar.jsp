<%-- 
    Document   : Sidebar
    Created on : Nov 30, 2017, 9:43:00 AM
    Author     : meiiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="left-menu">
            <ul class="s-menu">  
                <li> 
                    <a href="Dashboard" >
			<img class="icon" src="../img/Home.png">
			<span class='text current'>Dashboard</span>
                    </a>
                </li> 
                <li> 
                    <a href="Player" >
			<img class="icon" src="../img/pemain.png">
			<span class='text'>Player</span>
                    </a>
                </li> 
                <li> 
                    <a href="Team" >
			<img class="icon" src="../img/team.png">
			<span class='text'>Team</span>
                    </a>
                </li> 
                <li class=”dropdown”>
                    <div class="hv">
                    <a href="StatistikPlayer" class=”dropdown-toggle” data-toggle=”dropdown”><img class="icon" src="../img/statistik.png"></a>
                    <span class='text' id="Statistik">Statistic <span class="caret"></span></span>
                    </div>
                    <ul class=”dropdown-menu” id="sub">
                        <li><a href="StatistikPlayer">Statistik Player</a></li>
                        <li><a href="StatistikTeam">Statistik Team</a></li> 
                    </ul>
                </li> 
                <li> 
                    <a href="Musim" >
			<img class="icon" src="../img/musim.png">
			<span class="text">Season</span>
                    </a>
                </li>
                <li class="btn-menu">
                    <button id="togglebutton"><span class="glyphicon glyphicon-th-list"></span></button>
                    <label class='text txt-toggle' id="cursor">Menu</label>
		</li> 
            </ul>
        </div>
