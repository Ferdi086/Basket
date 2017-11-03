<%-- 
    Document   : team
    Created on : Nov 2, 2017, 3:01:46 PM
    Author     : meiiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IBL | Admin</title>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery.table2excel.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/bootstrap-table.css"> 
        <link rel="stylesheet" href="../css/bootstrap-datetimepicker.css"/>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/moment.min.js"></script>
        <script src="../js/bootstrap-datetimepicker.js"></script>
        <script src="../js/excelexportjs.js"></script>
        <link href="../css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/scrollbar.css">
        <script src="../js/select2.min.js"></script>   
        <script src="../js/jquery.scrollbar.min.js"></script>
               
        <style>
		body{
                    overflow:hidden;
		}
                .top-menu{
                    width:100%;
                    height:50px;
                    background:black;
                    position:fixed;
                    z-index: 3;
                }                
                .tl-menu{
                    margin-top: 0;
                    margin-left: 50px;
                    margin-top: 5px;
                    float: left;  
                    font-size:28px;
                    font-weight: bold;
                }  
                tl-menu a{
                    text-decoration: none;
                }
                .logo{
                    color:white;
                }
                .logo:hover{
                    opacity:0.6;
                }
                #vseparator{
                    background:white;
                    width:2px;
                    height:85%;
                    margin-top: 4px;
                    margin-right: 15px;
                    float:right;
                }
                .info{
                    margin-top: 10px;
                    margin-right: 15px;
                    float: right;
                }
                .txt-info{
                    color:white;
                    font-size:18px;
                    margin-left: 10px;
                    font-weight: normal;
                    padding-top: 4px;
                }
                .tr-menu{
                    margin-top: 10px;
                    margin-right: 50px;
                    float: right;
                }   
		.navbar{
			border-radius:0;
		}
		.list{
			margin:0 auto;
			max-width:100%;
                        height:230px;
		}
		.round{
			border-radius:50%;
			height:30px;
			width:30px;
                        background:transparent;
                        border:transparent;
			background-image: url('../img/power.png');
			background-size:100%;
			background-position: 0;
			background-repeat: no-repeat;
		}
                .logout{
                    color:white;
                    font-weight: normal;
                    font-size:18px;
                    margin-left: 10px;
                    vertical-align: top;
                    cursor:pointer;
                    padding-top: 4px;
                }
                .tr-menu:hover{
                    opacity:0.6;
                }
                .isi{
                    width:100%;
                    padding-top: 0;
                    padding-left: 180px;
                    margin:auto;
                }
                #togglebutton{
                    background:transparent;
                    color:white;
                    width:32px;
                    height:32px;
                    padding:0;
                    border:transparent;
                }
                #togglebutton:hover{
                    opacity: 0.6;
                }
                .left-menu{
                    min-height:100%;
                    background:black;
                    position:fixed;  
                    float: left;
                    display: block;
                    z-index: 1;
                    padding-top:56px;                    
                }
		.left-menu ul{
			list-style-type: none;
			margin: 0;
			padding: 0.2em 0.5em;
		}
		.icon { 
                    width: 32px;
                    height:32px;  
                    background:transparent;
		}
                .icon:hover{
                    opacity: 0.6;
                }
		.left-menu ul li { 
			margin-bottom: 15px; 
                }
                .left-menu ul li a{
			text-decoration:none;
		}
                .left-menu ul li a:hover{
                    opacity:0.6;
		}
		.text {
                    display: inline-block;
                    margin-left: 10px;
                    color:white;
		}
		@media only screen and (max-width: 1280px) {
		  .text {
			  display: none;
		  }
                  .isi{
                      margin-left: 50px;
                  }
		}
                .form{
                    padding:0;
                }
                .current{
                    font-weight: bold;
                }   
                .btn-menu{
                    position:absolute;
                    bottom:5%;
                }
                
                .news-content{
                height: 660px;
                border-radius: 0px 0px 2px 2px;
                overflow-y: auto;
                overflow-x: hidden;
                padding-left: 30px;
                }
                
                #sub{
                    margin-left:30%;
                    font-size:14px;                    
                }
                #sub a{
                    color:white;
                }
                #sub li{
                    margin-bottom:10%;
                }
                
                    
                .hv:hover{
                    opacity:0.6;
                    cursor:pointer;
                }                
              
	</style>
    </head>
    <body>
        <div class="top-menu">
            <span class="tl-menu"><a href="Home" style="text-decoration:none;"><div class="logo">IBL</div></a></span>
            <span class="tr-menu">
                <a href="LogOut">
                    <button class="round" type="button" data-toggle="tooltip" data-placement="bottom" title="Sign Out"></button>
                    <label class="logout">Sign Out</label>
                </a>
            </span>
            <span id="vseparator"></span>
            <span class="info">
                <img src="../img/User.png" width="30px;" style="margin-top:-7px">
                <label class="txt-info">Hi, ${requestScope.nama_usr}</label>
            </span>
        </div>
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
			<img class="icon" src="../img/package.png">
			<span class='text'>Player</span>
                    </a>
                </li> 
                <li> 
                    <a href="Team" >
			<img class="icon" src="../img/package.png">
			<span class='text'>Team</span>
                    </a>
                </li> 
                <li class=”dropdown”>
                    <div class="hv">
                    <a href="Statistic" class=”dropdown-toggle” data-toggle=”dropdown”><img class="icon" src="../img/Book-Open.png"></a>
                    <span class='text' id="Book">Statistic<span class="caret"></span></span>
                    </div>
                    <ul class=”dropdown-menu” id="sub">
                        <li><a href="Statistic_Pemain">Player</a></li>
                        <li><a href="Statistic_Team">Team</a></li> 
                    </ul>
                </li> 
                <li class="btn-menu">
                    <button id="togglebutton"><span class="glyphicon glyphicon-th-list"></span></button>
                    <label class='text txt-toggle' id="cursor">Menu</label>
		</li> 
            </ul>
        </div>
	<div style="height:49px;"></div>
       <div class="isi container" style="overflow: auto;">
            <div class="news-content scrollbar-macosx">
               <div class="col-md-12" style="padding-right:120px;">
                    <div class="form">
                    <center><h2 style="margin-bottom:40px;"><b>Player</b></h2></center>
           
			<form class="form-horizontal" method="post" action="doInsertTeam" id="formInput">
                                <div class="form-group">
                                    <label class="control-label col-sm-2 " >Team Name</label>
                                    <div class="col-sm-3">
                                        <input id="pemain" type="text" name="nama_team" class="form-control" required/>
                                    </div>
                                   
                                    <label class="control-label col-sm-2">Team NickName</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="nick" id="nick" class="form-control" required/>
                                    </div>                                  
                                </div>	
                            <div class="form-group">
                                   <label class="control-label col-sm-2">Team's Logo</label>
                                   <div class="col-sm-3">
                                       <input type="file" name="logo" required/>
                                   </div>
                            </div>	
                            </form>                                        
				</div>	     
                                <br/>
                                <div class="form-group">
                                    <div class="col-sm-4 col-sm-offset-1">
                                        <button class="btn btn-success btn-block" data-toggle="modal" data-target="#KonfirmasiInput"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
                                    </div>
                                    <div class="col-sm-4 col-sm-offset-1">
                                        <button class="btn btn-info btn-block" id="reset"><span class="glyphicon glyphicon-repeat"></span> Reset</button>
                                    
                                    </div>
                                </div>
			
                    </div>
		</div>
                
                    
            </div>
        
    </body>
    <script>
        $(document).ready(function(){ 
            $("#loading").hide();
            $("#ok").hide();
            $("#error").hide();
             $('#togglebutton').click(function() {
		$('.text').toggle(300);
                $('#sub').hide();
            }); 
            $('.txt-toggle').click(function() {
		$('.text').toggle(300);
                $('#sub').hide();
            }); 
            $('#Book').click(function(){
               $('#sub').toggle(300);               
            });
            $('#tgl').datetimepicker({
                    format: 'YYYY-MM-DD'
                });
            jQuery('.scrollbar-macosx').scrollbar();                
                     
	});    
        $('#nick').change(function () {
            var nick = $(this).val();
            $.ajax({
                type: 'POST',
                url: 'ceknick',
                data: {
                    'NIM': nim
                },
                beforeSend: function(){
                    $('#loading').show();
                    $("#ok").hide();
                    $("#error").hide();
                },
                complete: function(){
                    $('#loading').hide();
                },
                success: function (data) {
                    var result= data.split('|');
                    var val = result[0];
                    var nama = result[1];
                    if(val=="Ok"){      
                        $('#loading').hide();
                        $("#error").hide();
                        $("#Name").val(nama);
                        $("#ok").show();  
                    }else{
                        $('#loading').hide();
                        $("#ok").hide();
                        alert("NIM Tidak Terdaftar!");
                        $("#NIM").val("");
                        $("#Name").val("");
                        $("#error").show();                        
                        $("#NIM").focus();
                        $("#error").fadeTo(5000, 0);
                    }
                }
            });
        });
    </script>
</html>



