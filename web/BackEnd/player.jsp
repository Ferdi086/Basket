<%-- 
    Document   : player
    Created on : Nov 2, 2017, 9:30:43 AM
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
        <link rel="stylesheet" href="../css/style.css">
        <style>
            .news-content{
                height:620px;
            }
            .copyright{
                margin:0;
            }
        </style>
    </head>
    <body onload="startTime()">
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
               <div class="col-md-12" style="padding-left: 10px;">
                    <div class="form">
                    <center><h2 style="margin-bottom:40px;"><b>Player</b></h2></center>
           
			<form class="form-horizontal" method="post" action="doInsertPlayer" id="inputplayer" enctype = "multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-sm-2 " >Player</label>
                                    <div class="col-sm-3">
                                        <input id="pemain" type="text" name="pemain" class="form-control" required/>
                                    </div>
                                 
                                    <label class="control-label col-sm-2">Team</label>
                                    <div class="col-sm-3">
                                        <select  name="team" class="form-control" id="team">
                                            <option value=""> Choose One Team </option>
                                            <c:forEach var="item" items="${requestScope.team}">
                                                <option value="${item.value.id}"> ${item.value.id} - ${item.value.namateam} </option>
                                            </c:forEach>
                                        </select>
                                    </div>                                  
                                </div>	
                          
                                <div class="form-group">
                                    <label class="control-label col-sm-2" >Position</label>
                                    <div class="col-sm-3">
                                       <select name="posisi" class="form-control" id="posisi">
                                            <option value=""> Choose One Position </option>
                                            <c:forEach var="item" items="${requestScope.posisi}">
                                                <option value="${item.value.kd_pos}"> ${item.value.kd_pos} - ${item.value.nama_pos} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    
                                    <label class="control-label col-sm-2">Jersey Number</label>
                                    <div class="col-sm-3">
                                    	<input id="no_punggung" type="text" name="no_punggung" class="form-control" maxlength="2" onkeypress="return isNumber(event)" required >
                                    </div>                                  
                                </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2" >Height</label>
                                    <div class="col-sm-3">
                                        <input id="tinggi" type="text" name="tinggi" maxlength="3" class="form-control" onkeypress="return isNumber(event)" required/>
                                    </div>
                                    
                                    <label class="control-label col-sm-2">Weight</label>
                                    <div class="col-sm-3">
                                    	<input id="berat" type="text" name="berat" maxlength="3" class="form-control" onkeypress="return isNumber(event)" >
                                    </div>                                  
                                </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2" >Birth Date</label>
                                    <div class="col-sm-3">
                                        <input id="tgl" type="text" name="tgl" class="form-control" placeholder="YYYY-MM-DD" required/>
                                    </div>
                                   
                                    <label class="control-label col-sm-2">Hand's Position</label>
                                    <div class="col-sm-3">
                                        <select id="tangan" type="text" name="tangan" class="form-control" required>
                                            <option value=""> Choose One Hand's Position </option>
                                            <option value="Kanan">Right</option>
                                            <option value="Kiri">Left</option>
                                            <option value="N/A">Unknown</option>
                                        </select>
                                    </div>                                  
                                </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2">Region</label>
                                    <div class="col-sm-3">
                                        <select id="region" type="text" name="region" class="form-control" required>
                                           <option value=""> Choose One Region </option>
                                            <option value="Lokal">Local</option>
                                            <option value="Asing">Import</option>
                                        </select>
                                        <input id="id_user" type="hidden" name="id_user" value="${requestScope.id_user}">
                                    </div>                                  
                                </div>	
                            <div class="form-group">
                                   <label class="control-label col-sm-2" >Foto</label>
                                   <div class="col-sm-3">
                                       <input type="file" name="file" id="file" accept=".jpg, .jpeg, .png" onchange="readURL(this);" required/>
                                   </div> 
                                   <label class="col-sm-2 control-label">Preview</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="preview" style="margin-left:-15px" src="../img/nopic.png" width="135px" height="140px"/>
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
                
                <div class="col-md-12" style="padding-right:75px;padding-bottom:100px;margin-top: 20px;">
                    <hr/>
                    <center><h2><b>Player List</b></h2></center>
                    <table id="player" class="table table-condensed table-striped" data-toggle="table" data-search="true" data-page-list="[10, 25, 50, 100, ALL]" data-pagination="true">
                        <thead>
                            <tr style="font-size:18px;">
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>No</center></b></th>
                                <!--<th data-align="center" data-valign="middle"><b><center>Id Pemain</center><b></th>-->
                                <th data-align="center" data-valign="middle"><b><center>Foto</center><b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Players Name</center><b></th>     
                                <th data-align="center" data-valign="middle" ><b><center>Region</center><b></th>          
                                <th data-align="center" data-valign="middle"><b><center>Birth Date</center><b></th>
                                <th data-align="center" data-valign="middle" ><b><center>Height</center></b></th>
                                <th data-align="center" data-valign="middle" ><b><center>Weight</center></b></th>
                                <th data-align="center" data-valign="middle" ><b><center>Hand's Position</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Position</center></b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Team</center><b></th>  
                                <th data-align="center" data-valign="middle"><b><center>Jersey Number</center><b></th>
                                <th data-align="center" data-valign="middle"><b><center>Action</center></b></th>
                            </tr>
                        </thead> 
                        <tbody>
                            <c:forEach var="item" varStatus="loopCounter" items="${requestScope.player}">
                                <c:set var="idPemain" value="${item.value.idPemain}"/>
                                <c:set var="namaPemain" value="${item.value.namaPemain}"/>
                                <c:set var="region" value="${item.value.region}"/>
                                <c:set var="tgl" value="${item.value.tgl}"/>
                                <c:set var="tangan" value="${item.value.tangan}"/>
                                <c:set var="tinggi" value="${item.value.tinggi}"/>
                                <c:set var="foto" value="${item.value.foto}" />
                                <c:set var="berat" value="${item.value.berat}" />
                                <c:set var="pos" value="${item.value.pos}"/>
                                <c:set var="namaPos" value="${item.value.namaPos}"/>
                                <c:set var="idTeam" value="${item.value.idTeam}"/>
                                <c:set var="team" value="${item.value.team}" />
                                <c:set var="noPunggung" value="${item.value.noPunggung}"/>
                                <c:set var="flagactive" value="${item.value.flagactive}" />
                            <tr>
                                <td style="vertical-align: middle;text-align: center"> ${loopCounter.count}</td>
                                <td style="vertical-align: middle;text-align: center"> <img src="../img/Players/${foto}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" width="80px" height="80px"/> </td>
                                <td style="vertical-align: middle;text-align: center"> ${namaPemain}</td>
                                <c:choose>
                                    <c:when test="${region=='Lokal'}">
                                        <td style="vertical-align: middle;text-align: center"> Local </td>
                                    </c:when>   
                                    <c:when test="${region=='Asing'}">
                                        <td style="vertical-align: middle;text-align: center"> Import </td>
                                    </c:when>  
                                </c:choose>  
                                <td style="vertical-align: middle;text-align: center"> ${tgl} </td>
                                <td style="vertical-align: middle;text-align: center"> ${tinggi} cm </td>
                                <td style="vertical-align: middle;text-align: center"> ${berat} kg </td>
                                <td style="vertical-align: middle;text-align: center"> ${tangan} </td>
                                <td style="vertical-align: middle;text-align: center"> ${pos} </td>
                                <td style="vertical-align: middle;text-align: center"> ${idTeam} </td>
                                <td style="vertical-align: middle;text-align: center"> ${noPunggung} </td>
                                <td style="vertical-align: middle;text-align: center"> 
                                    <div style="margin:auto;">                                                                          
                                        <button class="btn btn-warning button" data-target="#updatemodal" data-toggle="modal" onclick="Update('${idPemain}','${namaPemain}','${region}','${tgl}','${tinggi}','${foto}','${berat}','${pos}','${tangan}','${idTeam}','${noPunggung}')"><span class="glyphicon glyphicon-edit"></span></button>
                                        <c:choose>
                                            <c:when test="${flagactive=='Y'}">
                                                <button class="btn" data-target="#KonfirmasiNonaktif" data-toggle="modal" onclick="flagnonaktif('${idPemain}','${flagactive}')" >Disable</button>
                                            </c:when>   
                                            <c:when test="${flagactive=='N'}">
                                                <button class="btn" data-target="#KonfirmasiAktif" data-toggle="modal" onclick="flagaktif('${idPemain}','${flagactive}')" >Enable</button>
                                            </c:when>  
                                        </c:choose>   
                                    </div>
                                </td>
                            </tr>                                                 
                            </c:forEach>
                        </tbody>
                    </table>        
                  
                </div>    
                <%@include file="Sync/Footer.jsp" %>
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
                        <div class="form-group ">
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
                                    <option value="${item.value.id}"> ${item.value.id} - ${item.value.namateam} </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group ">
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
                            <div class="form-group ">
                                    <label class="control-label col-sm-2 col-sm-offset-1">Height</label>
                                    <div class="col-sm-3">
                                        <input id="updatetinggi" type="text" name="utinggi" maxlength="3" class="form-control" onkeypress="return isNumber(event)" required/>
                                    </div>
                                    
                                    <label class="control-label col-sm-2">Weight</label>
                                    <div class="col-sm-3">
                                    	<input id="updateberat" type="text" name="uberat" maxlength="3" class="form-control" onkeypress="return isNumber(event)" >
                                    </div>                                  
                                </div>	
                        
                            <div class="form-group ">
                                    <label class="control-label col-sm-2 col-sm-offset-1">Birth Date</label>
                                    <div class="col-sm-3">
                                        <input id="updatetgl" type="text" name="utgl" class="form-control" placeholder="YYYY-MM-DD" required/>
                                    </div>
                                    <label class="control-label col-sm-2">Hand's Position</label>
                                    <div class="col-sm-3">
                                        <select id="updatetangan" type="text" name="utangan" class="form-control" required>
                                            <option value=""> Choose One Hand's Position </option>
                                            <option value="Kanan">Right</option>
                                            <option value="Kiri">Left</option>
                                            <option value="N/A">Unknown</option>
                                        </select>
                                    </div>   
                            </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2 col-sm-offset-1">Region</label>
                                    <div class="col-sm-3">
                                        <select id="updateregion" type="text" name="uregion" class="form-control" required>
                                            <option value=""> Choose One Region </option>
                                            <option value="Lokal">Local</option>
                                            <option value="Asing">Import</option>
                                        </select>
                                    </div>                                  
                                </div>	
                            <div class="form-group ">
                                   <label class="control-label col-sm-2 col-sm-offset-1">Foto</label>
                                   <div class="col-sm-3">
                                       <input type="file" name="fileupdate" id="updatefile" accept=".jpg, .jpeg, .png" onchange="readURLUpdate(this);" required/>
                                   </div> 
                                   <label class="col-sm-2 control-label">Preview</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="updatepreview" style="margin-left:-15px" onerror="this.onerror=null;this.src='../img/Players/nopics.png';"/>
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
        
        $(document).ready(function(){ 
            //$("#loading").hide();
            $('#sub').hide();
            $('#togglebutton').click(function() {
		$('.text').toggle(300);
                $('#sub').hide();
            }); 
            $('.txt-toggle').click(function() {
		$('.text').toggle(300);
                $('#sub').hide();
            }); 
            $('#Statistik').click(function(){
               $('#sub').toggle(300);               
            });
            $('#tgl').datetimepicker({
                    format: 'YYYY-MM-DD',
                    viewMode: 'years',
                    defaultDate:'1990-01-01'
            }); 
            
            $("#reset").click(function(){
                $("#pemain").focus();
                $("#pemain").val(null);
                $("#region").val(null);
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
        function cekInput(){           
            if($('#pemain').val()===""){   
                return false;
            }else if($('#region').val()===""){
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
            }else if($('#updateregion').val()===""){
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
            }else if($('#updatetangan').val()===""){
                return false;
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
        function Update(idPemain,namaPemain,region,tgl,tinggi,foto,berat,pos,tangan,idTeam,noPunggung){ 
        $("#updateid_pemain").val(idPemain);
        $('#updatepreview').attr('src',"../img/Players/"+foto).width(135).height(140); 
            $('#updatepemain').val(namaPemain);
            $('#updateregion').val(region);
            $('#updateteam').val(idTeam);
            $('#updateposisi').val(pos);
            $('#updateno').val(noPunggung);
            $('#updatetinggi').val(tinggi);  
            $('#updateberat').val(berat);  
            $('#updatetgl').val(tgl);  
            $('#updatetangan').val(tangan);  
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


