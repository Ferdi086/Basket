<%-- 
    Document   : StatistikPlayer
    Created on : Nov 7, 2017, 2:19:26 PM
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
        <script src="../js/moment.min.js"></script>
        <script src="../js/bootstrap-datetimepicker.js"></script>
        <script src="../js/excelexportjs.js"></script>
        <link href="../css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/scrollbar.css">
        <script src="../js/select2.min.js"></script>   
        <script src="../js/jquery.scrollbar.min.js"></script>
        <link rel="stylesheet" href="../css/style.css">
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
                    <center><h2 style="margin-bottom:40px;"><b>Statistic Player</b></h2></center>
                    <form class="form-horizontal" method="post" action="doInsertStatikPlayer" id="formInput" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-sm-2 " >Team</label>
                                    <div class="col-sm-3">
                                        <select name="team" class="form-control" id="team">
                                            <option value=""> Choose One Team </option>
                                            <c:forEach var="item" items="${requestScope.team}">
                                                <option value="${item.value.id}"> ${item.value.id} - ${item.value.namateam} </option>
                                              </c:forEach>
                                        </select>
                                    </div>
                                   
                                    <label class="control-label col-sm-2">Player Name</label>
                                    <div class="col-sm-3">
                                        <select name="pemain" id="pemain" class=" form-control">
                                        </select>
                                    </div>                                  
                                </div>	
                            <div class="form-group">
                                   <label class="control-label col-sm-2">Import File Excel</label>
                                   <div class="col-sm-3">
                                       <input id="file" type="file" name="excel" accept=".xlsx" required/>
                                   </div>
                                   <label class="control-label col-sm-2">Season</label>
                                   <div class="col-sm-3">
                                      <select name="musim" class="form-control" id="musim">
                                            <option value=""> Choose One Season </option>
                                            <c:forEach var="item" items="${requestScope.musim}">
                                                <option value="${item.value.id_musim}_${item.value.nama_musim}">${item.value.nama_musim} </option>
                                              </c:forEach>
                                        </select>
                                   </div>
                            </div>
                            <div class="form-group">
                                       <label class="control-label col-sm-2">Template Excel</label>
                                       <div class="col-sm-3">
                                           <img onclick="DownloadTemplate()" src="../img/download.png" height="60px" width="120px" style="cursor:pointer;">
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
                <%@include file="Sync/Footer.jsp" %>
                    
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
            jQuery('.scrollbar-macosx').scrollbar();
             $("#pemain").select2();
            $("#reset").click(function(){
                $("#team").focus();
                $("#team").val(null);
                $("#pemain").val(null);
                $("#file").val(null);
                $("#musim").val(null);
            });   
        });    
        
        function cekInput(){           
            if($('#team').val()===""){   
                return false;
            }else if($('#pemain').val()===""){
                return false;
            }else if($('#excel').val()===""){
                return false;
            }else if($('#musim').val()===""){
                return false;
            }else{
                return true;
            }
        }
        function input(){
            if(cekInput()){
                $('#formInput').submit();
            }else{                
                $('#KonfirmasiInput').modal('hide');
                $('#ValidasiInput').modal('show');     
            }           
        }
        function DownloadTemplate(){
                       location.href="DownloadTemplate"
        }
            $('#team').change(function () {
            var id = $(this).val();
            //alert(id); 
            $.ajax({
                type: 'POST',
                url: 'doSelectPlayer',
                data: {
                    'bagian': 1,
                    'category': id
                },
                beforeSend: function(){
                    $('#loading').show();
                },
                complete: function(){
                    $('#loading').hide();
                },
                success: function (data) {
                    $('#pemain').html(data);         
                }
            });

        });

    </script>
</html>



