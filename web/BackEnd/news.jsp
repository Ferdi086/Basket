<%-- 
    Document   : news
    Created on : Nov 10, 2017, 10:34:28 AM
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
                position:relative;
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
               <div class="col-md-12" style="padding-right:120px;">
                    <div class="form">
                    <center><h2 style="margin-bottom:40px;"><b>News</b></h2></center>
           
			<form class="form-horizontal" method="post" action="doInsertNews" id="inputnews" enctype = "multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-sm-2 " >Title News</label>
                                    <div class="col-sm-3">
                                        <input id="judul" type="text" name="judul" class="form-control" required/>
                                    </div>
                                    <label class="control-label col-sm-2 " >Date News</label>
                                    <div class="col-sm-3">
                                        <input id="tgl" type="text" name="tgl" class="form-control" required/>
                                    </div>
                                                       
                                </div>	
                            
                            <div class="form-group">
                                   <label class="control-label col-sm-2" >Image News</label>
                                   <div class="col-sm-3">
                                       <input type="file" name="file" id="file" accept=".jpg, .jpeg, .png" onchange="readURL(this);" required/>
                                   </div> 
                                   <label class="col-sm-2 control-label">Preview</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="preview" style="margin-left:-15px" src="../img/nopic.png" width="135px" height="140px"/>
                                    </div>
                                  
                            </div>
                            <div class="form-group">
                                   <label class="control-label col-sm-2" >News Content</label>
                                   <div class="col-sm-3">
                                       <textarea name="isi" id="isi" required rows="7" cols="100"></textarea>
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
                
                <div class="col-md-12" style="padding-right:120px;padding-bottom:20px;margin-top: 20px;">
                    <hr/>
                    <center><h2><b>News List</b></h2></center>
                    <table id="player" class="table table-condensed table-striped" data-toggle="table" data-search="true" data-page-list="[20, 25, 50, 100, ALL]" data-pagination="true">
                        <thead>
                            <tr style="font-size:18px;">
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>No</center></b></th>
                                <th data-align="center" data-valign="middle"><b><center>Judul</center><b></th>           
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Tanggal</center><b></th>
                                <th data-align="center" data-valign="middle" ><b><center>Deskripsi</center></b></th>
                                <th data-align="center" data-valign="middle" ><b><center>Foto</center></b></th>
                                <th data-align="center" data-valign="middle"><b><center>Action</center></b></th>
                            </tr>
                        </thead>      
                            <c:forEach var="item" varStatus="loopCounter" items="${requestScope.News}">
                                <c:set var="idnews" value="${item.value.idnews}"/>
                                <c:set var="judul" value="${item.value.judul}"/>
                                <c:set var="tanggal" value="${item.value.tanggal}"/>
                                <c:set var="isi" value="${item.value.deskripsi}" />
                                <c:set var="foto" value="${item.value.foto}"/>
                                <c:set var="flagactive" value="${item.value.flagactive}" />
                            <tr>
                                <td style="vertical-align: middle;text-align: center"> ${loopCounter.count}</td>
                                <td style="vertical-align: middle;text-align: center"> ${judul} </td>
                                <td style="vertical-align: middle;text-align: center"> ${tanggal} </td>
                                <td style="vertical-align: middle;text-align: center"> ${isi}</td>
                                <td style="vertical-align: middle;text-align: center"> <img src="../img/News/${foto}" onerror="this.onerror=null;this.src='../img/Players/nopics.png';" width="80px" height="80px"/> </td>
                                <td style="vertical-align: middle;text-align: center"> 
                                    <button class="btn btn-warning button" data-target="#updatemodal" data-toggle="modal" onclick="Update('${idnews}','${judul}','${tanggal}','${isi}','${foto}')"><span class="glyphicon glyphicon-edit"></span></button>
                                        <c:choose>
                                            <c:when test="${flagactive=='Y'}">
                                                <button class="btn" data-target="#KonfirmasiNonaktif" data-toggle="modal" onclick="flagnonaktif('${idnews}','${flagactive}')" >Disable</button>
                                                <br />
                                            </c:when>   
                                            <c:when test="${flagactive=='N'}">
                                                <button class="btn" data-target="#KonfirmasiAktif" data-toggle="modal" onclick="flagaktif('${idnews}','${flagactive}')" >Enable</button>
                                                <br />
                                            </c:when>  
                                        </c:choose>                                                
                                </td>
                            </tr>                                                 
                            </c:forEach>
                    </table>        
                  
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
    <div class="modal" id="updatemodal" role="dialog">
        <div class="modal-dialog"  style="margin-top:118px;width:70%">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title"><center>Change of News Data</center></h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="doUpdatePlayer" id="formUpdate" enctype = "multipart/form-data" >
                        <div class="form-group ">
                            <input type="hidden" id="updateidnews" name="uidnews"/>
                            <label class="control-label col-sm-2 col-sm-offset-1" for="News Title">News Title</label>
                                <div class="col-sm-3">
                                    <input type="text" name="ujudul" id="updatejudul" class="form-control" required>
                                </div>
                            <label class="control-label col-sm-2 " >Date News</label>
                                <div class="col-sm-3"> 
                                    <input  type="text" name="utgl" id="updatetgl" class="form-control" required/>
                                </div>
                        </div>
                        <div class="form-group">
                                   <label class="control-label col-sm-2" >Image News</label>
                                   <div class="col-sm-3">
                                       <input type="file" name="ufile" id="updatefile" accept=".jpg, .jpeg, .png"  required/>
                                   </div> 
                                   <label class="col-sm-2 control-label">Preview</label>
                                    <div class="col-sm-4" style="background-color: whitesmoke;height:140px;width:135px;margin-left:50px">
                                        <img id="updatepreview" style="margin-left:-15px" src="../img/nopic.png" width="135px" height="140px" onchange="readURLUpdate(this);"/>                
                                    </div>
                        </div>
                            <div class="form-group">
                                   <label class="control-label col-sm-2" >News Content</label>
                                   <div class="col-sm-3">
                                       <textarea name="uisi" id="updateisi" required cols="100" rows="7"></textarea>
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
                    <input type="hidden" id="ID_Ne"/>
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
                    <form action="../BackEnd/doFlagNews" method="post" id="formnon">
                    <input type="hidden" name="ID_N" id="ID_N1"/>
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
                    <form action="../BackEnd/doFlagNews" method="post" id="formaktif">
                    <input type="hidden" name="ID_N" id="ID_N"/>
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
                    format: 'YYYY-MM-DD'
            }); 
            $('#updatetgl').datetimepicker({
                    format: 'YYYY-MM-DD'
            }); 
            $("#reset").click(function(){
                $("#judul").focus();
                $("#tgl").val(null);
                $("#file").val(null);
                $("#isi").val(null);
                $("#preview").attr('src',"../img/nopic.png");
            });    
            jQuery('.scrollbar-macosx').scrollbar();                
                     
	}); 
        function cekInput(){           
            if($('#judul').val()===""){   
                return false;
            }else if($('#tgl').val()===""){
                return false;
            }else if($('#file').val()===""){
                return false;
            }else if($('#isi').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function cekEdit(){                        
            if($('#updateidnews').val()===""){                
                return false;
            }else if($('#updatejudul').val()===""){
                return false;
            }else if($('#updatetgl').val()===""){
                return false;
            }else if($('#updateisi').val()===""){
                return false;
            }else if($('#updatefoto').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function input(){
            if(cekInput()){
                $('#inputnews').submit();
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
        function Update(idnews,judul,tanggal,isi,foto){  
        $("#updateidnews").val(idnews);
        $('#updatepreview').attr('src',"../img/Players/"+foto).width(135).height(140); 
            $('#updatejudul').val(judul);
            $('#updatetgl').val(tanggal);
            $('#updateisi').val(isi);
        }
        function aktif(){
            var ID_News = $("#ID_N").val();
             if(ID_News === "" ){
                $('#KonfirmasiAktif').modal('hide');
                $('#ValidasiInput').modal('show'); 
               
            }else{
                 $('#formaktif').submit();
            }
        }
        function nonaktif(){
            var ID_News = $("#ID_N1").val();
             if(ID_News === "" ){
                $('#KonfirmasiNonaktif').modal('hide');
                $('#ValidasiInput').modal('show'); 
               
            }else{
                 $('#formnon').submit();
            }
        }
        function flagaktif(Id_News,Flag){
                $('#ID_N').val(Id_News);
                $('#Flag').val(Flag);
            }
        function flagnonaktif(Id_News,Flag){
                $('#ID_N1').val(Id_News);
                $('#Flag1').val(Flag);
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

