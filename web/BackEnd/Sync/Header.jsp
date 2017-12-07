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
    .clock{
	border-radius:50%;
	height:30px;
	width:30px;
        background:transparent;
        border:transparent;
	background-image: url('../img/Clock.png');
	background-size:100%;
	background-position: 0;
	background-repeat: no-repeat;
    }
    .clock:hover{
        opacity:0.6;
    }
</style>
<script>
        var h = ${requestScope.hour};
	var m = ${requestScope.minute};
	var s = ${requestScope.second};
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
                        if(s < 10 && m < 10 && h < 10){
                            document.getElementById('hr').innerHTML =  "0"+h.toString() ;
                            document.getElementById('min').innerHTML = "0"+m.toString();
                            document.getElementById('sec').innerHTML = "0"+s.toString();
                        }else if(s >= 10 && m < 10 && h < 10){
                            document.getElementById('hr').innerHTML =  "0"+h.toString() ;
                            document.getElementById('min').innerHTML = "0"+m.toString();
                            document.getElementById('sec').innerHTML = s.toString();
                        }
                        else if(s < 10 && m >= 10 && h < 10){
                            document.getElementById('hr').innerHTML =  "0"+h.toString() ;
                            document.getElementById('min').innerHTML = m.toString();
                            document.getElementById('sec').innerHTML = "0"+s.toString();
                        }else if(s >= 10 && m >= 10 && h < 10){
                            document.getElementById('hr').innerHTML =  "0"+h.toString() ;
                            document.getElementById('min').innerHTML = m.toString();
                            document.getElementById('sec').innerHTML = s.toString();
                        }
                        else if(s < 10 && m < 10 && h >= 10){
                            document.getElementById('hr').innerHTML =  h.toString() ;
                            document.getElementById('min').innerHTML = "0"+m.toString();
                            document.getElementById('sec').innerHTML = "0"+s.toString();
                        }else if(s >= 10 && m < 10 && h >= 10){
                            document.getElementById('hr').innerHTML =  h.toString() ;
                            document.getElementById('min').innerHTML = "0"+m.toString();
                            document.getElementById('sec').innerHTML = s.toString();
                        }
                        else if(s < 10 && m >= 10 && h >= 10){
                            document.getElementById('hr').innerHTML =  h.toString() ;
                            document.getElementById('min').innerHTML = m.toString();
                            document.getElementById('sec').innerHTML = "0"+s.toString();
                        }else if(s >= 10 && m >= 10 && h >= 10){
                            document.getElementById('hr').innerHTML =  h.toString() ;
                            document.getElementById('min').innerHTML = m.toString();
                            document.getElementById('sec').innerHTML = s.toString();
                        }else{
                            document.getElementById('hr').innerHTML =  h.toString() ;
                            document.getElementById('min').innerHTML = m.toString();
                            document.getElementById('sec').innerHTML = s.toString();
                        }
                        
                        
                        s++;
                            var t = setTimeout(startTime, 980);
                }
                        function checkTime(i) {
                            var x;
                            if (i < 10) {                                
                                i = "0" + i;
                                x = i.toString();
                            };  // add zero in front of numbers < 10
                            return x;
                        
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
             <span class="info">
                <a href="#" data-placement="bottom" data-popover-content="#clock" data-toggle="popover"  href="#" tabindex="0">
                    <button class="clock" type="button"></button>
                </a>
                 <div class="hidden" id="clock">
                    <div class="popover-body">
                        <span id="hr">00</span>
			<span> : </span>
			<span id="min">00</span>
			<span> : </span>
			<span id="sec">00</span>
                    </div>
                </div> 
            </span>
        </div>       
        