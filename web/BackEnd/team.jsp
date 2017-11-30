<%-- 
    Document   : team
    Created on : Nov 2, 2017, 3:01:46 PM
    Author     : meiiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
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
        <script src="../js/bootstrap-table.js"></script>
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
                .msg{
                        padding: 0;
                        border-radius:0;
                        margin-bottom: 0;
                        text-align: center;
                        font-size: 28px;
                        font-weight: bold;
                        cursor:pointer;
                }
                .hv:hover{
                    opacity:0.6;
                    cursor:pointer;
                }                
              
	</style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <%@include file="Sidebar.jsp" %>
	<div style="height:49px;"></div>
        <div class="msg alert ${requestScope.alert}">${requestScope.ErrMess}</div>
        <script>
            $(".alert-success").delay(5000).fadeOut(2000, function () { $(this).remove(); });
            $(".alert-danger").delay(6000).fadeOut(3000, function () { $(this).remove(); });
        </script> 
       <div class="isi container" style="overflow: auto;">
            <div class="news-content scrollbar-macosx">
               <div class="col-md-12" style="padding-right:120px;">
                    <div class="form">
                    <center><h2 style="margin-bottom:40px;"><b>Team</b></h2></center>
           
			<form class="form-horizontal" method="post" action="doInsertTeam" id="InputTeam" enctype = "multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-sm-2 " >Team Name</label>
                                    <div class="col-sm-3">
                                        <input id="nama" type="text" name="nama_team" class="form-control" required/>
                                    </div>
                                   
                                    <label class="control-label col-sm-2">Team NickName</label>
                                    <div class="col-sm-3">
                                        <input id="nick" type="text" name="nick"  class="form-control" maxlength="3" required style="text-transform:uppercase">
                                    </div>  
                                    <div class="col-sm-2">
                                        <span id="loading"><img src="../img/loading.gif" width="28px"/></span>
                                        <span id="ok"><img src="../img/ok.png" width="32px"/></span>
                                        <span id="error" style="color:red"><img src="../img/error.png" width="32px"/>nickname already</span>
                                    </div>
                                </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2 " >Division</label>
                                    <div class="col-sm-3">
                                        <select id="divisi" name="divisi" class="form-control" required>
                                            <option value="">Choose one division</option>
                                            <option value="P">Putih</option>
                                            <option value="M">Merah</option>
                                        </select>
                                    </div>
                                   
                                                                  
                            </div>	
                            <div class="form-group">
                                   <label class="control-label col-sm-2">Team's Logo</label>
                                   <div class="col-sm-3">
                                       <input id="logo" type="file" name="logo" accept=".jpg, .jpeg, .png" onchange="readlogo(this);" required/>
                                   </div>
                                   <label class="control-label col-sm-2">Team's Foto</label>
                                   <div class="col-sm-3">
                                       <input id="foto" type="file" name="foto" accept=".jpg, .jpeg, .png" onchange="readfoto(this);" required/>
                                   </div>
                            </div>	
                            <div class="form-group">
                                   <label class="col-sm-2 control-label">Preview Team's Logo</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="previewlogo" style="margin-left:-15px" src="../img/Team/Logo/nopic.png" width="135px" height="140px"/>
                                    </div>
                                   <label class="col-sm-2 col-sm-offset-1 control-label">Preview Team's Foto</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="previewfoto" style="margin-left:-15px" src="../img/Team/Logo/nopic.png" width="135px" height="140px"/>
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
                <div class="col-md-12" style="padding-right:120px;padding-bottom:20px;">
                    <hr/>
                    <center><h2><b>Team List</b></h2></center>
                    <table id="player" class="table table-condensed table-striped" data-toggle="table" data-search="true" data-page-list="[10, 25, 50, 100, ALL]" data-pagination="true">
                        <thead>
                            <tr style="font-size:18px;">
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>No</center></b></th>
                                <th data-align="center" data-valign="middle"><b><center>Team Nickname</center><b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Team Name</center><b></th>            
                                <!--<th data-align="center" data-valign="middle"><b><center>Divisi</center><b></th>-->
                                <th data-align="center" data-valign="middle"><b><center>Logo</center><b></th>
                                <th data-align="center" data-valign="middle"><b><center>Team's Foto</center></b></th>
                                <th data-align="center" data-valign="middle"><b><center>Action</center></b></th>
                            </tr>
                        </thead>      
                                <c:forEach var="item" varStatus="loopCounter" items="${requestScope.Team}">
                                    <c:set var="id" value="${item.value.id}"/>
                                    <c:set var="namateam" value="${item.value.namateam}"/>
                                    <c:set var="divisi" value="${item.value.divisi}"/>
                                    <c:set var="logo" value="${item.value.logo}"/>
                                    <c:set var="gambar" value="${item.value.gambar}"/>
                                    <c:set var="flagactive" value="${item.value.flagactive}" />
                                    <tr>
                                        <td style="vertical-align: middle;text-align: center"> ${loopCounter.count}</td>
                                        <td style="vertical-align: middle;text-align: center"> ${id}</td>
                                        <td style="vertical-align: middle;text-align: center"> ${namateam} </td>
                                        <!--<td style="vertical-align: middle;text-align: center"> ${divisi} </td>-->
                                        <td style="vertical-align: middle;text-align: center"> <img src="../img/Team/Logo/${logo}" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" width="80px" height="80px"/> </td>
                                        <td style="vertical-align: middle;text-align: center"> <img src="../img/Team/Foto/${gambar}" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" width="80px" height="80px"/> </td>
                                        <td style="vertical-align: middle;text-align: center"> <button class="btn btn-warning button" data-target="#updateModal" data-toggle="modal" 
                                               role="button" onclick="Update('${id}','${namateam}','${divisi}','${logo}','${gambar}')"><span class="glyphicon glyphicon-edit"></span></button> 
                                                <c:choose>
                                                     <c:when test="${flagactive=='Y'}">
                                                         <button class="btn" data-target="#KonfirmasiNonaktif" data-toggle="modal" onclick="flagnonaktif('${id}','${flagactive}')" >Disable</button>
                                                         <br />
                                                     </c:when>   
                                                     <c:when test="${flagactive=='N'}">
                                                         <button class="btn" data-target="#KonfirmasiAktif" data-toggle="modal" onclick="flagaktif('${id}','${flagactive}')" >Enable</button>
                                                     <br />
                                                     </c:when>  
                                                 </c:choose>
                                                 </c:forEach>
                                        </td>
                                    </tr>
                                                   
                    </table>          
                    <div style='margin-top: 60px;'>
                       ${requestScope.footer}  
                        </div>
                </div>    
		</div>
                
                    
            </div>
        <!-- Modal Konfirmasi Input-->
    <div id="KonfirmasiInput" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size:30px;text-align:center;">Confirmation</h4>
                </div>
                <div class="modal-body">
                    
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="input()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Input-->
    
    <!-- Modal Validasi Input-->
    <div id="ValidasiInput" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <p style="font-size:24px;color:red;font-weight:bold;text-align:center;">Please Complete All of Your Field First!</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary btn-block" data-dismiss="modal" aria-hidden="true">OK</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Validasi Input-->
    
    <!-- Modal Update -->
    <div class="modal" id="updateModal" role="dialog">
        <div class="modal-dialog" style="margin-top:118px;width:75%" >
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title"><center>Change of Team's Data</center></h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="doUpdateTeam" id="formUpdate" enctype="multipart/form-data">
                        <div class="form-group ">
                            <label class="control-label col-sm-2">Team nickname</label>
                            <div class="col-sm-3">
                                <input type="text" name="id" id="UpdateId" class="form-control"  >
                            </div>
                           
                            <label class="control-label col-sm-2">Team Name</label>
                            <div class="col-sm-3">
                                <input type="text" name="nama" id="UpdateNama" class="form-control">
                            </div>  
                        </div>
                        <div class="form-group">
                                    <label class="control-label col-sm-2 " >Division</label>
                                    <div class="col-sm-3">
                                        <select id="Updatedivisi" name="divisi" class="form-control" required>
                                            <option value="">Choose one division</option>
                                            <option value="P">Putih</option>
                                            <option value="M">Merah</option>
                                        </select>
                                    </div>
                                   
                                                                  
                            </div>
                        <div class="form-group">
                                   <label class="control-label col-sm-2">Team's Logo</label>
                                   <div class="col-sm-3">
                                       <input id="UpdateLogo" type="file" name="logo"  onchange="readlogoupdate(this);" required/>
                                   </div>
                                   <label class="control-label col-sm-2">Team's Foto</label>
                                   <div class="col-sm-3">
                                       <input id="UpdateFoto" type="file" name="foto"  onchange="readfotoupdate(this);" required/>
                                   </div>
                            </div>	
                            <div class="form-group">
                                   <label class="col-sm-2 control-label">Preview Logo</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="previewlogoupdate" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" style="margin-left:-15px"/>
                                    </div>
                                   <label class="col-sm-2 col-sm-offset-1 control-label">Preview Foto</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="previewfotoupdate" onerror="this.onerror=null;this.src='../img/Team/Logo/nopic.png';" style="margin-left:-15px"/>
                                    </div>
                            </div>
                    </form>
                    <script>
                        
                    </script>
                </div>
                <div class="modal-footer">
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-1">
                            <button class="btn btn-success btn-block" data-toggle="modal" data-target="#KonfirmasiUpdate"><span class="glyphicon glyphicon-floppy-save"></span> Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Update -->
    <!-- Modal Konfirmasi Update-->
    <div id="KonfirmasiUpdate" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size:30px;text-align:center;">Confirmation</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="ID_Team"/>
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="ubah()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Update-->	
    <!-- Modal Konfirmasi Nonaktif-->
    <div id="KonfirmasiNonaktif" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size:30px;text-align:center;">Confirmation Nonactive</h4>
                </div>
                <div class="modal-body">
                    <form action="../BackEnd/doFlagTeam" method="post" id="formnon">
                    <input type="hidden" name="ID_T" id="ID_T1"/>
                    <input type="hidden" name="Flag"id="Flag1"/>
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="nonaktif()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Nonaktif-->
    <!-- Modal Konfirmasi Aktif-->
    <div id="KonfirmasiAktif" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size:30px;text-align:center;">Confirmation Active</h4>
                </div>
                <div class="modal-body">
                    <form action="../BackEnd/doFlagTeam" method="post" id="formaktif">
                    <input type="hidden" name="ID_T" id="ID_T"/>
                    <input type="hidden" name="Flag" id="Flag"/>
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="aktif()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Aktif-->
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
            $('#tgl').datetimepicker({
                    format: 'YYYY-MM-DD'
                });
                
            jQuery('.scrollbar-macosx').scrollbar();
            
            $("#reset").click(function(){
                $("#nama").focus();
                $("#nama").val(null);
                $("#nick").val(null);
                $("#logo").val(null);
                $("#foto").val(null);
                $("#previewlogo").attr('src',"../img/Team/Logo/nopic.png");
                $("#previewfoto").attr('src',"../img/Team/Logo/nopic.png");
            });         
	});
        
          $('#nick').change(function () {
            var nick = $(this).val();
            $.ajax({
                type: 'POST',
                url: 'CekNick',
                data: {
                    'nick': nick
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
                    var result= data;
                    if(data=="Ok"){      
                        $('#loading').hide();
                        $("#error").hide();
                        $("#ok").show();  
                    }else if(data=="Error"){
                        $('#loading').hide();
                        $("#ok").hide();
                        //$("#nick").val("");
                        $("#error").show();                        
                        $("#nick").focus();
                        //$("#error").fadeTo(5000, 0);
                    }else if(data=="kosong"){
                        $('#loading').hide();
                        $("#error").hide();
                        $("#ok").hide();
                    }
                }
            });
        });
        
        function cekUpdate(){           
            if($('#UpdateId').val()===""){   
                return false;
            }else if($('#UpdateNama').val()===""){
                return false;
            }else if($('#Updatedivisi').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function ValidateAlpha(evt)
    {
        var keyCode = (evt.which) ? evt.which : evt.keyCode
        if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32)
         
        return false;
            return true;
    }
        function cekInput(){           
            if($('#nama').val()===""){   
                return false;
            }else if($('#nick').val()===""){
                return false;
            }else if($('#divisi').val()===""){
                return false;
            }else if($('#logo').val()===""){
                return false;
            }else if($('#foto').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function input(){
            if(cekInput()){
                $('#InputTeam').submit();
            }else{                
                $('#KonfirmasiInput').modal('hide');
                $('#ValidasiInput').modal('show');     
            }           
        }
        function ubah(){
            if(cekUpdate()){ 
                $('#formUpdate').submit();
            }else{
                $('#KonfirmasiUpdate').modal('hide');
                $('#ValidasiInput').modal('show'); 
            }  
        }
        function aktif(){
            var ID_Team = $("#ID_T").val();
             if(ID_Team === "" ){
                $('#KonfirmasiAktif').modal('hide');
                $('#ValidasiInput').modal('show'); 
               
            }else{
                 $('#formaktif').submit();
            }
        }
        function nonaktif(){
            var ID_Team = $("#ID_T1").val();
             if(ID_Team === "" ){
                $('#KonfirmasiNonaktif').modal('hide');
                $('#ValidasiInput').modal('show'); 
               
            }else{
                 $('#formnon').submit();
            }
        }
        function flagaktif(ID_Team,Flag){
                $('#ID_T').val(ID_Team);
                $('#Flag').val(Flag);
            }
        function flagnonaktif(ID_Team,Flag){
                $('#ID_T1').val(ID_Team);
                $('#Flag1').val(Flag);
            }
        function Update(id,nama_team,divisi,logo,gambar){
            $('#UpdateId').val(id);
            $('#UpdateNama').val(nama_team);
            $('#Updatedivisi').val(divisi);
            $('#previewlogoupdate').attr('src',"../img/Team/Logo/"+logo).width(135).height(140);
            $('#previewfotoupdate').attr('src',"../img/Team/Foto/"+gambar).width(135).height(140);  
        }
        function readlogo(input) {		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#previewlogo')
				.attr('src', e.target.result)
				.width(135)
				.height(140);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
        function readfoto(input) {		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#previewfoto')
				.attr('src', e.target.result)
				.width(135)
				.height(140);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
        function readlogoupdate(input) {		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#previewlogoupdate')
				.attr('src', e.target.result)
				.width(135)
				.height(140);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
        function readfotoupdate(input) {		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#previewfotoupdate')
				.attr('src', e.target.result)
				.width(135)
				.height(140);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
    </script>
</html>



