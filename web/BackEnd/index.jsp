<%-- 
    Document   : index
    Created on : Nov 3, 2017, 1:52:05 PM
    Author     : Ferdinand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IBL | Admin</title>
        <script src="../js/jquery.min.js"></script>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <script src="../js/bootstrap.min.js"></script>
        <style>
            body{
                background-color:lightgoldenrodyellow;
            }
        </style>
    </head>
    <body>
    <center>
        <form id="form" action="doLogin" method="post">
            <div class="form-inline" style="width: 400px; height:250px; background: rgba(25,25,112 , .6);margin-top: 125px; border:1.5px solid white; border-top:none;border-radius:5px ">
                <div class='row' style='background-color:black; width: 400px; border:1.5px solid white; border-radius:5px'>
                    <h2 style="text-align: center;  color:white">Sign in to Basket Apps</h2>
                </div>
              <div class="col-lg-12" style="padding-top: 10px; margin-top: 15px; ">
                <div class="input-group mb-2 mb-sm-0" style="width:300px;">
                    <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                  <input type="text" name="UserName" class="form-control" id="user" placeholder="User ID">
                </div>
              </div>
              <div class="col-lg-12" style="padding-top: 10px; ">
                <div class="input-group mb-2 mb-sm-0" style="width:300px;">
                    <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                  <input type="Password" name="Password" class="form-control" id="pass" placeholder="Password">
                </div>
              </div>
              <div class="col-lg-12" style="margin-top:20px; padding:0 115px;">
                  <button type="submit" class="btn btn-success btn-block" onclick="Javascript:document.getElementById('form').submit()" style="font-size:18px;"><b><span class="glyphicon glyphicon-log-in"></span> Login</b></button>
              </div>

            </div>
        </form>
    </center>
    </body>
</html>
