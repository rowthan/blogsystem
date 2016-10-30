<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>contact</title>
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
          <h1><a href="index.asp">Responsive Creative Theme</a></h1>
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
             
                <li ><a href="blog.asp">Blog</a></li>
             <li>
            <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" -->
            <li class="active"><a href="#">Contact</a></li>
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
        <p><span class="bread-home"><a href="main/index.html">Home</a></span><a href="main/contact.html">Contact</a>联系博主</p>
      </div>
    </div>
    
    
     <div class="grid_12"><h1 class="text-t-big ident-bot-0">所有发表博文</h1></div>
    <%
	
  Set rs2=server.CreateObject("ADODB.Recordset")
Sql2="select * from postinfo where postname='"&request("postname")&"' "  
rs2.Open Sql2,cn,3,3
 
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs2.pagesize=30
 if rs2.eof or rs2.bof then
 response.Write"没有博文"
 else
 mypagesize=rs2.pagesize
 rs2.absolutepage=page
 do while not rs2.eof and mypagesize>0
%>    

    
    <div class="clear"></div>
    <div class="separator"></div>
    <div class="wrapper">
        <div class="grid_12">
         <a href="blog-single.asp?postid=<%=rs2("postid")%>"> <h1><%=rs2("posttitle")%></h1></a>
      <p><%=rs2("postabstract")%></p>
    
    </div>
    </div>
    
      <%
  mypagesize=mypagesize-1
  i=i+1
  rs2.movenext
  	loop
  %>
  <%
  end if
  rs2.close
  set rs2=nothing

  %>
    
    
    
    <div class="grid_5">
      <div class="block-ident-4">
        <h2>博主信息</h2>
        <%	
  Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from userinfo where name='"&request("postname")&"' "  
rs.Open Sql,cn,3,3 %>
        <dl>
          <dt class="ident-bot-2"><strong><%=rs("name") %> <br />
           <%=rs("sign") %></strong></dt>
          <dd><span><%=rs("tel") %></span>电话:</dd>
          <dd><span><%=rs("qq") %></span>qq:</dd>
          <dd><span><%=rs("email") %></span>email:</dd>
        </dl>
        <%
          cn.close
         set cn=nothing
         %>
      </div>
    </div>
 
    <div class="clear"></div>
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

