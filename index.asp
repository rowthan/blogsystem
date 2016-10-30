<!DOCTYPE html>
<%@Language="vbscript" Codepage="65001"%>
<%Response.Charset="utf-8"%>
<!--#include file="main/conn.asp"-->
<html lang="en">
<head>
<title>首页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<link rel="stylesheet" href="css/style.css" media="screen">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<link rel="stylesheet" href="css/ie.css"> 
	<![endif]-->
</head>

<script language="javascript">
function check(){
 if (document.login.name.value ==""|document.login.name.value=="Your Name"){
  alert("用户名不能为空!请重新填写！");
  document.login.name.focus();
  return false;
 	}
 if (document.login.pwd.value ==""|document.login.pwd.value=="******"){
  alert("密码不能为空!请重新填写！");
  document.login.pwd.focus();
  return false;
 	}
}

function check2() {
    if (document.login2.name2.value == "" | document.login2.name2.value == "Your Name") {
        alert("用户名不能为空!请重新填写！");
        document.login2.name2.focus();
        return false;
    }
    if (document.login2.pwd2.value == "" | document.login.pwd2.value == "******") {
        alert("密码不能为空!请重新填写！");
        document.login2.pwd2.focus();
        return false;
    }
}
 </script>



<body id="page1">
<!-- header -->
<header>
  <div class="row-1">
    <div class="container_12">
      <div class="grid_12">
        <div class="logo fleft">
          <h1><a href="index.asp">Gro-spa - Responsive Creative Theme</a></h1>
          <div class="slogan">博文主页</div>
        </div>
        <div class="call"> <img src="images/icons/icon-phone.png" alt=""/> <span>Call Me: 18314437524</span> </div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="row-3">
    <div class="container_12">
      <div class="grid_12">
        <!-- menu -->
        <nav  id = "main-nav-menu">
          <ul class="sf-menu">
            <li class="active"><a href="index.asp">Home</a></li>
            <li><a href="#">About</a>
              <ul>
               
                <li><a href="http://www.ynu.edu.cn" target="_blank">Yunnan university</a></li>     
                <li><a href="#">Study</a>
                  <ul>
                    <li><a href="http://www.3school.com">HTML</a></li>
                    <li><a href="http://www.w3school.com.cn/xml/">XML</a></li>
                    <li><a href="http://www.w3.org/">W3C</a></li>
                  </ul>
                </li>
              </ul>
            </li>
          
            <li ><a href="#">Blog</a>
              <ul>
                <li><a href="main/blog.asp">Blog homepage</a></li>
                
              </ul>
            </li>
            
            
          
            <%if session("name")<>"" then %>
            <li><a href="main/logout.asp">logout</a></li>
	<li><a href="main/user/personal.asp" class="color" style="color:#0F0;"><%=session("name")%></a></li>
		<%else%>
        	
             	<li><a href="main/register/register.html" target="_blank">register</a></li>
<%end if%>
          </ul>
        </nav>
        <!-- end menu -->
        <%if session("name")<>"" then%>
        <a href="main/admin/admin.asp?boardid=1" class="spa-packages button-yellow"><img alt="" src="images/icons/offer-icon.png">管理</a>
        <%end if%>
        <select id = "responsive-main-nav-menu" onchange = "javascript:window.location.replace(this.value);">
        </select>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</header>


<!-- end header -->
<div class="row-2">
  <div class="container_12">
    <div class="grid_12">
      <div class="flexslider">
        <ul class="slides">
        <%if session("name")="" then%>
          <li> <img src="images/slider/slide-1.png" alt="">
            <div class="flex-caption">
              <div class="flex-bg">
                <div class="flex-border">
                  <div class="slide-text-1 ident-bot-1">登录</div>
                  <div class="slide-text-2">登录后可以进入博客系统，可以发言等。如没有账号，点击 <a href="main/register/register.html">Click Here</a>注册</div>
                  <div class="signup-form-ctnr">
                    <form action="main/login.asp" method="post" class="home-form" id="signup-form" name="login" onSubmit="return check()">
                      <fieldset>
                      <div class="field">
                        <input type="text" value="Your Name" name="name" class="itext smart_input" onBlur="this.value=!this.value?'Your Name':this.value;"  onclick="this.value='';" >
                      </div>
                      <div class="field">
                        <input type="password" value="******" name="pwd" class="itext smart_input" onBlur="this.value=!this.value?'Email :':this.value;"  onclick="this.value='';" >
                      </div>
                      </fieldset>
                      <input type="submit" class="button-green home-form-btn" value="登录">                    
                      <div class="no-engagement"> 注册登录会有更多特权。 </div>
                    </form>
                    
                    <input type="button" class="button-green home-form-btn" value="我要以游客身份进入"  />
                  </div>
                </div>
              </div>
            </div>
          </li>
          <%end if%>
          
          <li> <img src="images/slider/slide-2.png" alt="">
            <div class="flex-caption">
              <div class="flex-bg">
                <div class="flex-border-1">
                  <div class="slide-text-1 ident-bot-1">进入到我的个人主页</div>
                  <div class="slide-text-2">除了来到博客系统看到所有人的发言外，还可以进入我的个人主页，更多的了解我。<a class="button-4" href="#">Click Here</a></div>
                </div>
              </div>
            </div>
          </li>
          
          <%if session("name")="" then%>
<li> <img src="images/slider/slide-3.png" alt="">
            <div class="flex-caption">
              <div class="flex-bg">
                <div class="flex-border">
                  <div class="slide-text-1 ident-bot-1">管理员登录系统</div>
                  <div class="slide-text-2">此登录接口用作后台管理，不对一般用户开放。了解更多关于管理员 <a href="#">Click Here</a>。</div>
                  <div class="signup-form-ctnr">
                    <form action="main/adminlogin.asp" method="post" class="home-form" id="login" onSubmit="return check2()" name="login2"">
                      <fieldset>
                      <div class="field">
                        <input type="text" value="Your Name" name="name2" class="itext smart_input" onBlur="this.value=!this.value?'Your Name':this.value;"  onclick="this.value='';" >
                      </div>
                      <div class="field">
                        <input type="password" value="******" name="pwd2" class="itext smart_input" onBlur="this.value=!this.value?'Email :':this.value;"  onclick="this.value='';" >
                      </div>
                      </fieldset>
                      <input type="submit" class="button-green home-form-btn" value="登录"/>
                      <div class="no-engagement"> 管理员拥有更多特权。能够对整个博客系统进行管理。 </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <%end if%>
    </div>          
         
           
    </div>
</div>


<!-- content -->
<section id="content">
  <div class="container_12">
    <div class="wrapper">
    
      
         <%
 Set rs=server.CreateObject("ADODB.Recordset")
 Sql="select * from postinfo  order by posttime desc" 
 rs.Open Sql,cn,3,3
 if not rs.eof then
%>

<%
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs.pagesize=3
 mypagesize=rs.pagesize
 rs.absolutepage=page
 
 do while not rs.eof and mypagesize>0
  %>
  <div class="grid_4"> <a href="main/blog-single.asp?postid=<%=rs("postid")%>">
        <div class="box1">
          <div class="imgs"> <img src="images/icons/1page_img1.png" alt="" class="img-1"/> <img src="images/icons/1page_img1-hover.png" alt="" class="img-2"/> </div>
  
  
   <h3><%=rs("posttitle")%></h3>
          <p><%=rs("postabstract")%></p>
        </div>
        </a> </div>
        
     
  
  <%
  mypagesize=mypagesize-1
  i=i+1
  rs.movenext
  loop
  %>
 
<%
rs.close
set rs=nothing
%>
<%end if %>
   
   
<div class="wrapper">
      <div class="grid_12">
        <div class="box2">
          <div class="quotes">
            <div class="flexslider2">
              <ul class="slides">
              
                <%
 Set rs2=server.CreateObject("ADODB.Recordset")
 Sql2="select * from message  order by Time desc" 
 rs2.Open Sql2,cn,3,3
%>

<%
 
 do while not rs2.eof
  %>
                <li>
                  <blockquote><%=rs2("Message") %> &nbsp;&nbsp;<span><%=rs2("Time") %></span></blockquote>
                </li>
              <%
  rs2.movenext
  loop
  %>
 
<%
rs2.close
set rs2=nothing
cn.close
set cn=nothing
%>
              </ul>
            </div>
          </div>
          <div class="search-ft">
            <form id="search-ft" action="savemessage.asp" method="post">
              <input name="message" value="匿名留言" onBlur="if(this.value=='') this.value='e-mail address'" onFocus="if(this.value =='匿名留言' ) this.value=''" type="text"/>
              <a class="newsletter-button">
              <input name="submit" value="留言" type="submit" style="background:none; width:0px; height:0px;" class="newsletter-button" />
               </a>
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</section>
<!-- end content -->
<!-- footer -->
<footer>
          <!--Tag Cloud-->
  <div class="footer-2">
    <div class="container_12">
      <div class="wrapper">
        <div class="grid_12">
          <div class="policy">&copy; Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">THAN</a> 冉荣华小组 <a href="#" target="_blank">yunnan university</a></div>
        </div>
      </div>
    </div>
  </div>
</footer>
<script src="js/custom.js"></script>

</body>
</html>
