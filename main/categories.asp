<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>categories</title>
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
              <ul class="sf-menu">
                <li class="active"><a href="blog.asp">Blog</a></li>
              </ul>
            <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" -->
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
        <p><span class="bread-home"><a href="../../index.asp">Home</a></span>板块目录</p>
      </div>
    </div>
    <!--SITE CONTENTS-->
    <div class="clear"></div>
   
    <!-- Divider -->
    <div class="grid_12">
      <div class="project-divider"></div>
    </div>
    <div class="grid_12">
      <!-- start Filter categories -->
      <ul id="filter">
        
         <%
		 dim boardid
		 boardid=request("boardid")
  Set rs6=server.CreateObject("ADODB.Recordset")
 Sql6="select * from boardinfo order by boardid" 
 rs6.Open Sql6,cn,3,3
 
 if rs6.eof or rs6.bof then
 response.Write"<tr><td>该博客还没有板块</td></tr>"
 else
 %>
 <%
 do while not rs6.eof 
  %>
  
   <li class="active"><a href="categories.asp?boardid=<%=rs6("boardid")%>"><%=rs6("boardname")%></a></li>
 
  
  <%
  rs6.movenext
  	loop
  %>
  
  <%
  end if
  rs6.close
  set rs6=nothing
  %>
      </ul>
      <!-- End Filter categories -->
    </div>
    <!-- Divider -->
    <div class="grid_12">
      <div class="project-divider"></div>
    </div>
    <!-- End divider -->
    
    
    <div class="wrapper">
    <ul id="stage" class="portfolio-4column">
    <%
  Set rs7=server.CreateObject("ADODB.Recordset")
 Sql7="select * from postinfo where boardid="&request("boardid")&" order by posttime" 
 rs7.Open Sql7,cn,3,3
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs7.pagesize=30
 
 if rs7.eof or rs7.bof then
 response.Write"有板块没有博文"
 else
 mypagesize=rs7.pagesize
 rs7.absolutepage=page
 do while not rs7.eof and mypagesize>0
  %>
  
  
  
        <li data-id="id-1" data-type="business">
          <div class="img-border-port"><img src="../../images/portfolio/port-1.jpg" class="img-border max-image" alt="" />
            <div class="cover boxcaption box_2">
              <div class="project-name">
               <a href="blog-single.asp?postid=<%=rs7("postid")%>"> <h5><%=rs7("posttitle")%></h5>
              </div>
              <div class="project-text">
                <p><%=rs7("postabstract")%></p></a>
                <a href="blog-single.asp?postid=<%=rs7("postid")%>" class="textlink">Detail</a></div>
            </div>
          </div>
        </li>
     
      
   <%
  mypagesize=mypagesize-1
  i=i+1
  rs7.movenext
  	loop
  %>
  <%
  end if
  rs7.close
  set rs7=nothing
  cn.close
  set cn=nothing
  %>
       </ul>
      
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

