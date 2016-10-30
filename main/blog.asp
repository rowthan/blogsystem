<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Blog</title>
<!-- InstanceEndEditable -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<link rel="stylesheet" href="../css/style.css" media="screen">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<script src="../js/jquery-1.7.2.min.js"></script>
<!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<link rel="stylesheet" href="css/ie.css"> 
	<![endif]-->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>


<body id="page-inner">
<!-- InstanceBeginEditable name="edithead" --><!-- InstanceEndEditable --><!-- header -->
<header>
  <div class="row-1">
    <div class="container_12">
      <div class="grid_12">
        <div class="logo fleft">
          <h1><a href="index.html">Responsive Creative Theme</a></h1>
          <div class="slogan">博文主页</div>
        </div>
        <div class="call"> <img src="images/icons/icon-phone.png" alt=""> <span>Call Me: 18314437524</span> </div>
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
            <li><a href="../index.asp">Home</a></li>
            <li><a href="#">About</a></li><li><!-- InstanceBeginEditable name="active" -->
             
                <li class="active"><a href="blog.asp">Blog</a></li>
             
            <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" -->
            <li><a href="https://mail.qq.com/cgi-bin/loginpage">Contact</a></li>
            <!-- InstanceEndEditable -->
            <%if session("name")<>"" then%>
             <li><a href="logout.asp">logout</a></li>
             <li><a href="user/personal.asp" class="color" style="color:#0F0;"><%=session("name")%></a></li>
             <%end if%>
             <%if session("name")="" then%>
             <li><a href="../index.asp">login</a></li>
             <li><a href="register/register.html" target="_blank">register</a></li>
             <%end if%>
          </ul>
        </nav>
        <!-- end menu -->
        <%if session("name")<>"" then%>
        <a href="post.asp" class="spa-packages button-yellow"><img alt="" src="images/icons/offer-icon.png">发文</a>
        <%end if%>
        <select id = "responsive-main-nav-menu" onchange = "javascript:window.location.replace(this.value);">
        </select>
      </div>
      
      <div class="clear"></div>
    </div>
  </div>
</header>

<!--end header-->

<!-- content --><!-- InstanceBeginEditable name="editcontent" -->
<section id="content">
  <div class="container_12">
    <div class="grid_12">
      <div class="breadcrumbs">
        <p><span class="bread-home"><a href="blog.asp">Home</a></span>Blog</p>
      </div>
    </div>
    <!--SITE CONTENTS-->
    
    
    
    
    <section class="grid_8 fleft">
      <div class="post-border-right">
      
       <%
 Set rs=server.CreateObject("ADODB.Recordset")
 Sql="select * from postinfo  order by posttime desc" 
 rs.Open Sql,cn,3,3
%>

<%

 do while not rs.eof
  %>
      
      
        <article class="post-holder">
          <header>
            <h2 class="entry-title"><a href="blog-single.asp?postid=<%=rs("postid")%>"><%=rs("posttime")%> &nbsp;&nbsp;&nbsp;<%=rs("posttitle")%> </a></h2>
            <div class="post-meta">
              <div class="fleft">Posted in: <a href="#">分类</a> |
               by <a href="#"><%=rs("postname")%></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lastreply <a href="#"><%=rs("replyname")%></a> &nbsp;&nbsp;&nbsp; </div>
              <div class="fright"><a href="blog-single.asp?postid=<%=rs("postid")%>"><%=rs("postclick")%>click</a>  &nbsp;&nbsp;  <a href="blog-single.asp?postid=<%=rs("postid")%>"><%=rs("replycount")%>comments</a></div>
            </div>
            <!--
             <figure class="ident-bot-2"><a class="img-border-bg" href="blog-single.asp?postid=<%=rs("postid")%>">
          <img class="img-border attachment-post-thumbnail wp-post-image" alt=""  src="<%=trim(rs("postimages"))%>"></a></figure>
            .post-meta-->
          </header>
         
          <p class="ident-bot-2"><%=rs("postabstract")%></p>
          <a class="button ident-bot-2" href="blog-single.asp?postid=<%=rs("postid")%>">Continue Reading</a>
          <div class="addthis_toolbox addthis_pill_combo"> <a class="addthis_button_google_plusone" g:plusone:size="medium"></a> <a class="addthis_button_tweet" tw:count="horizontal"></a> <a class="addthis_button_facebook_like"></a></div>
        </article>
        
        <div class="clear"></div>
        <div class="separator"></div>
        
        
        <%
 
  rs.movenext
  loop
  %>
 
<%
rs.close
set rs=nothing
%>
        
        <div class="clear"></div>
        <div class="separator"></div>
      </div>
    </section>
    <aside class="grid_4 fright">
      <!--SIDEBAR-->
      <div class="sidebar-blog">
        <!--SEARCH-->
        <div class="search">
          <h5>Search</h5>
          <div>
            <form action="#" method="post">
              <p>
                <input type="text" name="search" onFocus="if(this.value=='Search keyword and hit enter'){this.value='';}" onBlur="if(this.value==''){this.value='Search keyword and hit enter';}" value="Search keyword and hit enter" />
              </p>
            </form>
          </div>
        </div>
        <!--SOCIABLE-->
        <div class="sociable sidebar-social">
          <h5>Connect with us</h5>
          <ul class="social">
            <li><a href="#"><img class="img-1" alt=""  src="images/icons/icon1.png"><img class="img-2" alt="" title="Facebook" src="images/icons/icon1-hover.png"></a></li>
            <li><a href="#"><img class="img-1" alt="" src="images/icons/icon2.png"><img class="img-2" alt="" title="Flickr" src="images/icons/icon2-hover.png"></a></li>
            <li><a href="#"><img class="img-1" alt="" src="images/icons/icon3.png"><img class="img-2" alt="" title="Twitter" src="images/icons/icon3-hover.png"></a></li>
            <li><a href="#"><img class="img-1" alt="" src="images/icons/icon4.png"><img class="img-2" alt="" title="RSS" src="images/icons/icon4-hover.png"></a></li>
            <li><a href="#"><img class="img-1" alt="" src="images/icons/icon5.png"><img class="img-2" alt="" title="Technorati" src="images/icons/icon5-hover.png"></a></li>
          </ul>
        </div>
        <!--CATEGORIES-->
        <div class="categories">
          <h5>Categories</h5>
          <ul>
           <%
  Set rs6=server.CreateObject("ADODB.Recordset")
 Sql6="select * from boardinfo order by boardid" 
 rs6.Open Sql6,cn,3,3
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs6.pagesize=10
 
 if rs6.eof or rs6.bof then
 response.Write"<tr><td>该博客还没有板块</td></tr>"
 else
 mypagesize=rs6.pagesize
 rs6.absolutepage=page
 do while not rs6.eof and mypagesize>0
  %>
   <li><a href="categories.asp?boardid=<%=rs6("boardid")%>"><%=rs6("boardname")%></a></li>
  <%
  mypagesize=mypagesize-1
  i=i+1
  rs6.movenext
  	loop
  %>
  
  <%
  end if
  rs6.close
  set rs6=nothing
  %>
          </ul>
        </div>
        <!--RECENT POST-->
        
        <div class="recent-post">
          <h5>Most Click</h5>
 <%
 Set rs5=server.CreateObject("ADODB.Recordset")
 Sql5="select * from postinfo order by postclick desc" 
 rs5.Open Sql5,cn,3,3
%>

<%

 do while not rs5.eof 
 %>
  <span class="smalldate"><%=rs5("posttime")%>&nbsp;&nbsp;&nbsp;&nbsp;totalclick：<%=rs5("postclick")%></span> 
  
          <div class="recent-post-block"> 
          <a href="blog-single.asp?postid=<%=rs5("postid")%>" class="link-name"> by <%=rs5("postname")%><br><%=rs5("posttitle")%> </a>
          </div>
           
          
   <%
  rs5.movenext
  loop
  %>
 
<%
rs5.close
set rs5=nothing
cn.close
 set cn=nothing
%>
        </div>
    </aside>
  </div>
</section>
<!-- InstanceEndEditable --><!-- end content -->

<!-- footer -->
<footer>
          <!--Tag Cloud-->
  <div class="footer-2">
    <div class="container_12">
      <div class="wrapper">
        <div class="grid_12">
          <div class="policy">&copy; Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">THAN</a> 冉荣华 <a href="#" target="_blank">yunnan university</a></div>
        </div>
      </div>
    </div>
  </div>
</footer>
<script src="../js/custom.js"></script>
<!--end footer-->
</body>
<!-- InstanceEnd --></html>

