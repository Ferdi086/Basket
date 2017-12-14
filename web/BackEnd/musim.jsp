<%-- 
    Document   : musim
    Created on : Nov 10, 2017, 10:34:44 AM
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
               <div class="col-md-12" style="padding-right:120px;">
                    <div class="form">
                    <center><h2 style="margin-bottom:40px;"><b>Season</b></h2></center>
           
			<form class="form-horizontal" method="post" action="doInsertMusim" id="InputMusim">
                                <div class="form-group">
                                    <label class="control-label col-sm-2 " >Season Name</label>
                                    <div class="col-sm-3">
                                        <input id="id_user" type="hidden" name="id_user" value="${requestScope.id_user}">
                                        <input id="musim" type="text" name="musim" class="form-control" required/>
                                    </div>
                                    <label class="control-label col-sm-2 " >Season Type</label>
                                    <div class="col-sm-3" >
                                        <select id="jenis"  name="jenis" class="form-control" required>
                                            <option value=""> Choose Season </option>
                                            <option value="PRESEASON"> PREASEASON </option>
                                            <option value="REGULAR"> REGULAR </option>
                                            <option value="PLAYOFF"> PLAYOFF </option>
                                        </select>
                                    </div>                               
                                </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2">Years Begin</label>
                                    <div class="col-sm-3">
                                        <input id="awal" type="text" name="awal"  class="form-control" required/>
                                    </div> 
                                   <label class="control-label col-sm-2">Years End</label>
                                   <div class="col-sm-3">
                                       <input id="akhir" type="text" name="akhir" class="form-control" required/>
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
                <div class="col-md-12" style="padding-right:120px;padding-bottom:100px;">
                    <hr/>
                    <center><h2><b>Season List</b></h2></center>
                    <table id="player" class="table table-condensed table-striped" data-toggle="table" data-search="true" data-pagination="true">
                        <thead>
                            <tr style="font-size:18px;">
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>No</center></b></th>
                                <!--<th data-align="center" data-valign="middle"><b><center>Id Pemain</center><b></th>-->
                                <th data-align="center" data-valign="middle"><b><center>Season Name</center><b></th>
                                <th data-align="center" data-valign="middle" data-sortable="true"><b><center>Season Type</center><b></th>            
                                <th data-align="center" data-valign="middle"><b><center>Period</center><b></th>
                                <th data-align="center" data-valign="middle"><b><center>Action</center></b></th>
                            </tr>
                            </thead>      
                            <c:forEach var="item" varStatus="loopCounter" items="${requestScope.musim}">
                                <c:set var="idMusim" value="${item.value.id_musim}"/>
                                <c:set var="namaMusim" value="${item.value.nama_musim}"/>
                                <c:set var="jenisMusim" value="${item.value.jenis_musim}"/>
                                <c:set var="awal" value="${item.value.tgl_awal}"/>
                                <c:set var="akhir" value="${item.value.tgl_akhir}" />
                                <c:set var="status" value="${item.value.flagactive}" />
                               
                            <tr>
                                <td style="vertical-align: middle;text-align: center"> ${loopCounter.count}</td>
                                <td style="vertical-align: middle;text-align: center"> ${namaMusim} </td>
                                <td style="vertical-align: middle;text-align: center"> ${jenisMusim} </td>
                                <td style="vertical-align: middle;text-align: center"> ${awal}-${akhir} </td>
                                <td style="vertical-align: middle;text-align: center"> 
                                    <button class="btn btn-warning button" data-target="#updatemodal" data-toggle="modal" onclick="Update('${idMusim}','${namaMusim}','${jenisMusim}','${awal}','${akhir}')"><span class="glyphicon glyphicon-edit"></span></button>
                                    <c:choose>
                                        <c:when test="${status == 'Y'}">
                                            <button class="btn btn-danger button" data-target="#KonfirmasiLock" data-toggle="modal" onclick="lockval('${idMusim}')">Lock</button>
                                        </c:when>
                                        <c:otherwise> 
                                            <button class="btn btn-success button" data-target="#KonfirmasiUnlock" data-toggle="modal" onclick="unlockval('${idMusim}')" >Unlock</button>
                                        </c:otherwise> 
                                    </c:choose> 
                                </td>
                            </tr>                                                 
                            </c:forEach>
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
                    <h3 class="modal-title"><center>Change of Season's Data</center></h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="post" action="doUpdateMusim" id="formUpdate">
                        <div class="form-group">
                                    <label class="control-label col-sm-2 " >Season Name</label>
                                    <div class="col-sm-3">
                                        <input id="Uid" type="hidden" name="id" class="form-control" required/>
                                        <input id="Umusim" type="text" name="musim" class="form-control" required/>
                                    </div>
                                    <label class="control-label col-sm-2 " >Season Type</label>
                                    <div class="col-sm-3" >
                                        <select id="Ujenis"  name="jenis" class="form-control" required>
                                            <option value=""> Choose Season </option>
                                            <option value="PRESEASON"> PREASEASON </option>
                                            <option value="REGULAR"> REGULAR </option>
                                            <option value="PLAYOFF"> PLAYOFF </option>
                                        </select>
                                    </div>                               
                                </div>	
                            <div class="form-group">
                                    <label class="control-label col-sm-2">Years Begin</label>
                                    <div class="col-sm-3">
                                        <input id="Uawal" type="text" name="awal"  class="form-control" required/>
                                    </div> 
                                   <label class="control-label col-sm-2">Years End</label>
                                   <div class="col-sm-3">
                                       <input id="Uakhir" type="text" name="akhir" class="form-control" required/>
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
                    <input type="hidden" id="ID_Guest"/>
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="update()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Update--> 
    <!-- Modal Konfirmasi Lock-->
    <div id="KonfirmasiLock" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size:30px;text-align:center;">Confirmation</h4>
                </div>
                <div class="modal-body">
                    <form action="../BackEnd/LockUnlock" method="post" id="formlock">
                    <input type="hidden" name="ID_M" id="ID_M"/>
                    <input type="hidden" name="Flag" id="Flag" value="N"/>
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="lock()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Lock--> 
    <!-- Modal Konfirmasi Unlock-->
    <div id="KonfirmasiUnlock" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="font-size:30px;text-align:center;">Confirmation</h4>
                </div>
                <div class="modal-body">
                    <form action="../BackEnd/LockUnlock" method="post" id="formunlock">
                    <input type="hidden" name="ID_M" id="ID_M1"/>
                    <input type="hidden" name="Flag" id="Flag1" value="Y"/>
                        <p style="font-size:20px;color:red;font-weight:bold;text-align:center;">Are You Sure ?</p>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" onclick="unlock()">Yes</button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Konfirmasi Unlock--> 
    </body>
    <script>
        $(document).ready(function(){ 
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
            $('#awal').datetimepicker({
                    format: 'YYYY'
                });
            $('#akhir').datetimepicker({
                    format: 'YYYY',
                    useCurrent: false
                }); 
            $('#Uawal').datetimepicker({
                    format: 'YYYY'
                });
            $('#Uakhir').datetimepicker({
                    format: 'YYYY',
                    useCurrent: false
                }); 
        $("#awal").on("dp.change", function (e) {
            $('#akhir').data("DateTimePicker").minDate(e.date);
        });
        $("#akhir").on("dp.change", function (e) {
            $('#awal').data("DateTimePicker").maxDate(e.date);
        });
        $("#Uawal").on("dp.change", function (e) {
            $('#Uakhir').data("DateTimePicker").minDate(e.date);
        });
        $("#Uakhir").on("dp.change", function (e) {
            $('#Uawal').data("DateTimePicker").maxDate(e.date);
        });
        $("#reset").click(function(){
                $("#musim").focus();
                $("#musim").val(null);
                $("#jenis").val(null);
                $("#awal").val(null);
                $("#akhir").val(null);
            });    
            jQuery('.scrollbar-macosx').scrollbar();                
                     
	});    
        
        function cekInput(){           
            if($('#musim').val()===""){   
                return false;
            }else if($('#jenis').val()===""){
                return false;
            }else if($('#awal').val()===""){
                return false;
            }else if($('#akhir').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function cekUpdate(){           
            if($('#Uid').val()===""){   
                return false;
            }else if($('#Umusim').val()===""){   
                return false;
            }else if($('#Ujenis').val()===""){
                return false;
            }else if($('#Uawal').val()===""){
                return false;
            }else if($('#Uakhir').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function input(){
            if(cekInput()){
                $('#InputMusim').submit();
            }else{                
                $('#KonfirmasiInput').modal('hide');
                $('#ValidasiInput').modal('show');     
            }           
        }
        function update(){
            if(cekUpdate()){
                $('#formUpdate').submit();
            }else{                
                $('#KonfirmasiInput').modal('hide');
                $('#ValidasiInput').modal('show');     
            }           
        }
        function lockval(ID){
            $('#ID_M').val(ID);
        }
        function unlockval(ID){
            $('#ID_M1').val(ID);
        }
        function lock(){
            var ID_Musim = $("#ID_M").val();            
            if(ID_Musim === "" ){
                $('#KonfirmasiLock').modal('hide');               
            }else{
                 $('#formlock').submit();
            }
        }
        function unlock(){
            var ID_Musim = $("#ID_M1").val();            
            if(ID_Musim === "" ){
                $('#KonfirmasiUnock').modal('hide');               
            }else{
                 $('#formunlock').submit();
            }
        }
        function Update(idMusim,namaMusim,jenisMusim,awal,akhir){
            $('#Uid').val(idMusim);
            $('#Umusim').val(namaMusim);
            $('#Ujenis').val(jenisMusim);
            $('#Uawal').val(awal);
            $('#Uakhir').val(akhir);
        }
    </script>
</html>


