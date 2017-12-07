<%-- 
    Document   : Header
    Created on : Nov 30, 2017, 9:40:04 AM
    Author     : meiiko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .popover-content{
        font-size: 36px;
        font-weight: bold;
    }
</style>
<div class="top-menu">
    <span class="tl-menu"><a href="Home" style="text-decoration:none;"><div class="logo">IBL</div></a></span>
    <span class="tr-menu">                
        <a href="LogOut">
            <button class="round" type="button" title="Sign Out"></button>
            <label class="logout">Sign Out</label>
        </a>
    </span>
    <span id="vseparator"></span>
            
    <span class="info">  
        <a href="#" data-placement="bottom" data-popover-content="#clock" data-toggle="popover"  href="#" tabindex="0">
            <button class="clock" type="button" title="Time">efg</button>
        </a>

                <!-- Content for Popover #1 -->
                <div class="hidden" id="clock">
                    <div class="popover-body">
                        <span id="hr">00</span>
			<span> : </span>
			<span id="min">00</span>
			<span> : </span>
			<span id="sec">00</span>
                    </div>
                </div>            
                
                <img src="../img/User.png" width="30px;" style="margin-top:-7px">
                <label class="txt-info">Hi, ${requestScope.nama_usr}</label>
            </span>
        </div>        
        <script>
            var h = ${requestScope.hour}
            var m = ${requestScope.minute}
            var s = ${requestScope.second}
            function startTime() {
                if(s > 59){
                    m++;
                    s=0;
                }
                if(m > 59){
                    h++;
                    m=0;
                }
                if(h > 23){
                    h=0;
                }           
                h = checkTime(h);
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('hr').innerHTML = h ;
                document.getElementById('min').innerHTML = m;
                document.getElementById('sec').innerHTML = s;
                s++;
                var t = setTimeout(startTime, 800);
            }
            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                };  // add zero in front of numbers < 10
                return i;                        
            }
            $(function(){
                $("[data-toggle=popover]").popover({
                    html : true,
                    content: function() {
                      var content = $(this).attr("data-popover-content");
                      return $(content).children(".popover-body").html();
                    },
                    title: function() {
                      var title = $(this).attr("data-popover-content");
                      return $(title).children(".popover-heading").html();
                    }
                });
            });
        </script>