<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <!--
		<li><a class="hvr-underline-from-center active" href="News">
                    <span class="glyphicon glyphicon-comment"> </span> News</a>
		</li>-->
		<li><a href="Teams" class="hvr-underline-from-center">
                    <span class="glyphicon glyphicon-th-large"> </span> Teams</a>
		</li>
		<li><a href="Players" class="hvr-underline-from-center"> 
                    <span class="glyphicon glyphicon-user"> </span> Players</a>
                </li>
		<li><a href="DashboardFront" class="hvr-underline-from-center"> 
                    <span class="glyphicon glyphicon-stats"> </span> Dashboard</a>
                </li>
            </ul>
        </div>
	<div class="clearfix"> </div>	
    </nav>
</div>
