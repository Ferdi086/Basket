<%-- 
    Document   : Dashboard
    Created on : Nov 22, 2017, 11:17:50 AM
    Author     : Ferdinand
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
                .logo_kcl{
                    max-width: 30px;
                    max-height: 30px;
                    margin-right:2%;
                    margin-left:1%;
                }
	</style>
    </head>
    <body>
        <%@include file="Sync/Header.jsp" %>
        <%@include file="Sync/Sidebar.jsp" %>
	<div style="height:49px;"></div>
        <div class="msg alert ${requestScope.alert}">${requestScope.ErrMess}</div>
        <script>
            $(".alert-success").delay(5000).fadeOut(2000, function () { $(this).remove(); });
            $(".alert-danger").delay(6000).fadeOut(3000, function () { $(this).remove(); });
        </script> 
       <div class="isi container" style="overflow: auto;">
            <div class="news-content scrollbar-macosx">
                <h1 style="text-align:center;margin-bottom:50px;"><b>Dashboard</b></h1><br/>
                <center><h3><b>Current Season Match List</b></h3></center>
                <div id="tbl_match" style="margin-right:25px;padding-bottom: 100px;">
                    <table id="player" class="table table-condensed table-striped" data-toggle="table" data-search="true" data-page-list="[10, 25, 50, 100, ALL]" data-pagination="true">
                        <thead>
                            <tr style="font-size:18px;">
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>No</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Date Match</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Team</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>W/L</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Points</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Team</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>W/L</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Points</center></b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var='item' varStatus="loopCounter" items='${requestScope.statistik}'>
                                <tr>
                                    <td style="vertical-align: middle;text-align: center">${loopCounter.count}</td>
                                    <td style="vertical-align: middle;text-align: center">${item.value.tgl}</td>
                                    <td style="vertical-align: middle;text-align: center"><img src='../img/Team/Logo/${item.value.logo1}' class='logo_kcl'>${item.value.team1}</td>
                                    <td style="vertical-align: middle;text-align: center">${item.value.wl1}</td>
                                    <td style="vertical-align: middle;text-align: center">${item.value.pts1}</td>
                                    <td style="vertical-align: middle;text-align: center"><img src='../img/Team/Logo/${item.value.logo2}' class='logo_kcl'>${item.value.team2}</td>
                                    <td style="vertical-align: middle;text-align: center">${item.value.wl2}</td>
                                    <td style="vertical-align: middle;text-align: center">${item.value.pts2}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </div>
            </div>
                <%@include file="Sync/Footer.jsp"%>
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
    <div class="modal" id="updatemodal" role="dialog">
        <div class="modal-dialog"  style="margin-top:118px;width:70%">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title"><center>Change of Players Data</center></h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="doUpdatePlayer" id="formUpdate" enctype = "multipart/form-data" >
                        <div class="form-group e">
                            <input type="hidden" id="updateid_pemain" name="uid_pemain"/>
                            <label class="control-label col-sm-2 col-sm-offset-1" for="pemain">Players Name</label>
                            <div class="col-sm-3">
                                <input type="text" name="upemain" id="updatepemain" class="form-control" required>
                            </div>
                            <label class="control-label col-sm-2" for="Team">Team</label>
                            <div class="col-sm-3">
                              <select  name="uteam" class="form-control" id="updateteam">
                                <option value=""> Choose One Team </option>
                                <c:forEach var="item" items="${requestScope.team}">
                                    <option value="${item.value.id}"> ${item.value.id} - ${item.value.nama_team} </option>
                                </c:forEach>
                             </select>
                            </div>
                        </div>
                        <div class="form-group e">
                                    <label class="control-label col-sm-2 col-sm-offset-1">Position</label>
                                    <div class="col-sm-3">
                                       <select name="uposisi" class="form-control" id="updateposisi">
                                            <option value=""> Choose One Position </option>
                                            <c:forEach var="item" items="${requestScope.posisi}">
                                                <option value="${item.value.kd_pos}"> ${item.value.kd_pos} - ${item.value.nama_pos} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                    <label class="control-label col-sm-2">Jersey Number</label>
                                    <div class="col-sm-3">
                                    	<input id="updateno" type="text" name="uno_punggung" class="form-control" maxlength="2" onkeypress="return isNumber(event)" required >
                                    </div>                                  
                                </div>	
                            <div class="form-group e">
                                    <label class="control-label col-sm-2 col-sm-offset-1">Height</label>
                                    <div class="col-sm-3">
                                        <input id="updatetinggi" type="text" name="utinggi" maxlength="3" class="form-control" onkeypress="return isNumber(event)" required/>
                                    </div>
                                    
                                    <label class="control-label col-sm-2">Weight</label>
                                    <div class="col-sm-3">
                                    	<input id="updateberat" type="text" name="uberat" maxlength="3" class="form-control" onkeypress="return isNumber(event)" >
                                    </div>                                  
                                </div>	
                        
                            <div class="form-group e">
                                    <label class="control-label col-sm-2 col-sm-offset-1">Birth Date</label>
                                    <div class="col-sm-3">
                                        <input id="updatetgl" type="text" name="utgl" class="form-control" placeholder="YYYY-MM-DD" required/>
                                    </div>
                                   
                                                              
                            </div>	
                            
                            <div class="form-group ">
                                   <label class="control-label col-sm-2 col-sm-offset-1">Foto</label>
                                   <div class="col-sm-3">
                                       <input type="file" name="fileupdate" id="updatefile" accept=".jpg, .jpeg, .png" onchange="readURLUpdate(this);" required/>
                                   </div> 
                                   <label class="col-sm-2 control-label">Preview</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="updatepreview" style="margin-left:-15px"/>
                                    </div>    
                            </div>
                    </form>
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
                    <input type="hidden" id="ID_Pe"/>
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
                    <form action="../BackEnd/doFlagPlayer" method="post" id="formnon">
                    <input type="hidden" name="ID_P" id="ID_P1"/>
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
                    <form action="../BackEnd/doFlagPlayer" method="post" id="formaktif">
                    <input type="hidden" name="ID_P" id="ID_P"/>
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
        function cekInput(){           
            if($('#pemain').val()===""){   
                return false;
            }else if($('#team').val()===""){
                return false;
            }else if($('#posisi').val()===""){
                return false;
            }else if($('#no_punggung').val()===""){
                return false;
            }else if($('#tinggi').val()===""){
                return false;
            }else if($('#berat').val()===""){
                return false;
            }else if($('#tgl').val()===""){
                return false;
            }else if($('#tangan').val()===""){
                return false;
            }else if($('#file').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function cekEdit(){                        
            if($('#updateid_pemain').val()===""){                
                return false;
            }else if($('#updatepemain').val()===""){
                return false;
            }else if($('#updateteam').val()===""){
                return false;
            }else if($('#updateposisi').val()===""){
                return false;
            }else if($('#updateno').val()===""){
                return false;
            }else if($('#updatetinggi').val()===""){
                return false;
            }else if($('#updateberat').val()===""){
                return false;
            //}//else if($('#updatetangan').val()===""){
                //return false;
           // }else if($('#updatefile').val()===""){
              //  return false;
            }else{
                return true;
            }
        }
        function input(){
            if(cekInput()){
                $('#inputplayer').submit();
            }else{                
                $('#KonfirmasiInput').modal('hide');
                $('#ValidasiInput').modal('show');     
            }           
        }
         function ubah(){
            if(cekEdit()){ 
                $('#formUpdate').submit();
            }else{
                $('#KonfirmasiUpdate').modal('hide');
                $('#ValidasiInput').modal('show'); 
            }  
        }    
        function Update(idPemain,namaPemain,tgl,tinggi,foto,berat,pos,idTeam,noPunggung){     
        $("#updateid_pemain").val(idPemain);
        $('#updatepreview').attr('src',"../img/Players/"+foto).width(135).height(140); 
            $('#updatepemain').val(namaPemain);
            $('#updateteam').val(idTeam);
            $('#updateposisi').val(pos);
            $('#updateno').val(noPunggung);
            $('#updatetinggi').val(tinggi);  
            $('#updateberat').val(berat);  
            $('#updatetgl').val(tgl);  
        }
        function aktif(){
            var ID_Team = $("#ID_P").val();
             if(ID_Team === "" ){
                $('#KonfirmasiAktif').modal('hide');
                $('#ValidasiInput').modal('show'); 
               
            }else{
                 $('#formaktif').submit();
            }
        }
        function nonaktif(){
            var ID_Team = $("#ID_P1").val();
             if(ID_Team === "" ){
                $('#KonfirmasiNonaktif').modal('hide');
                $('#ValidasiInput').modal('show'); 
               
            }else{
                 $('#formnon').submit();
            }
        }
        function flagaktif(ID_Pemain,Flag){
                $('#ID_P').val(ID_Pemain);
                $('#Flag').val(Flag);
            }
        function flagnonaktif(ID_Pemain,Flag){
                $('#ID_P1').val(ID_Pemain);
                $('#Flag1').val(Flag);
            }
        $(document).ready(function(){ 
           // $('table.package').highchartTable();
           // $('table.IdCard').highchartTable();
            //$("#loading").hide();
            //$('#sub').hide();
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
            $("#reset").click(function(){
                $("#pemain").focus();
                $("#pemain").val(null);
                $("#team").val(null);
                $("#posisi").val(null);
                $("#no_punggung").val(null);
                $("#tinggi").val(null);
                $("#berat").val(null);
                $("#tgl").val(null);
                $("#tangan").val(null);
                $("#preview").attr('src',"../img/nopic.png");
                $("#file").val(null);
            });    
            jQuery('.scrollbar-macosx').scrollbar();                
                     
	}); 
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
        function readURL(input) {		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#preview')
				.attr('src', e.target.result)
				.width(135)
				.height(140);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
        function readURLUpdate(input) {		
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#updatepreview')
				.attr('src', e.target.result)
				.width(135)
				.height(140);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
    </script>
</html>



