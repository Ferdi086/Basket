<%-- 
    Document   : Header
    Created on : Nov 30, 2017, 9:40:04 AM
    Author     : meiiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
