<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>categories</title>
<!-- InstanceEndEditable -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<link rel="stylesheet" href="../../css/style.css" media="screen">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
<script src="../../js/jquery-1.7.2.min.js"></script>
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
          <h1><a href="../../index.html">Responsive Creative Theme</a></h1>
          <div class="slogan">博文主页</div>
        </div>
        <div class="call"> <img src="../../images/icons/icon-phone.png" alt=""> <span>Call Me: 18314437524</span> </div>
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
            <li><a href="../../index.asp">Home</a></li>
           <li><!-- InstanceBeginEditable name="active" -->
       
            <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" -->
            <!-- InstanceEndEditable -->
            <%if session("name")<>"" then%>
             <li><a href="../logout.asp">logout</a></li>
             <li><a href="../user/personal.asp" class="color" style="color:#0F0;"><%=session("name")%></a></li>
             <%end if%>
             <%if session("name")="" then%>
             <li><a href="../../index.asp">login</a></li>
             <li><a href="../register/register.html" target="_blank">register</a></li>
             <%end if%>
          </ul>
        </nav>
        <!-- end menu -->
       
      </div>
      
      <div class="clear"></div>
    </div>
  </div>
</header>
<%if not session("power")>1 then %>
<script>    alert("非管理员 禁止强行访问！"); window.location.href ="../../index.asp";</script>
<%end if %>
<!--end header-->

<!-- content --><!-- InstanceBeginEditable name="editcontent" -->
<section id="content">
  <div class="container_12">
    <div class="grid_12">
      <div class="breadcrumbs">
        <p><span class="bread-home"><a href="../../index.asp">Home</a></span>管理员操作台</p>
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
  
   <li class="active"><a href="admin.asp?boardid=<%=rs6("boardid")%>"><%=rs6("boardname")%></a></li>
 
  
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
               <a href="../blog-single.asp?postid=<%=rs7("postid")%>"> <h5><%=rs7("posttitle")%>&nbsp;&nbsp;点击阅读该贴</h5>
               </a>
              </div>
              <div class="project-text">
                <span><%=rs7("postabstract")%></span> <span>作者：<%=rs7("postname") %></span>
                
               <span>发帖时间：<%=rs7("posttime") %></span>
               <a style="color:Red"  href="../user/deleteblog.asp?postid=<%=rs7("postid")%>" class="">删除该贴</a>
                </div>
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
  %>
       </ul>
      <div class="grid_12 ident-top-1">
      <h1>博客管理</h1>
    </div>
    <div class="clear"></div>
    <div class="grid_4 ident-bot-1">
      <div class="ident-right-1">
        <div class="tagline">
          <h3>博客信息</h3>
        </div>
        <ul class="list-rate ident-bot-2">
         <%
  Set rs8=server.CreateObject("ADODB.Recordset")
 Sql8="select * from boardinfo" 
 rs8.Open Sql8,cn,3,3
 do while not rs8.eof
 %>
 <%  Set rs9=server.CreateObject("ADODB.Recordset")
 Sql9="select count(*) as totalpost from postinfo where boardid="&rs8("boardid")&"" 
 rs9.Open Sql9,cn,3,3
 %>
 
          <li><a href="#"><%=rs8("boardname") %></a> <span><%=rs9("totalpost") %>贴</span>
          <%if rs9("totalpost")=0 then %>
          <a href="deletetype.asp?boardid=<%=rs8("boardid") %>" ><span style="color:Red">删除该类--</span></a></li>
          <%end if %>
       <%
  rs8.movenext
  	loop
  %>   
  
  <%
  rs8.close
  set rs8=nothing
   %>
        </ul>
      </div>
    </div>
    <div class="grid_4">
      <div class="ident-right-1">
        <div class="tagline">
          <h3>博文类别管理</h3>
        </div>
        <ul class=" ident-bot-1">
        <li>增加类别</li>
          <li>
          <form action="addtype.asp" method="post">
          <input type="text"  placeholder="名称" name="boardname"/>
               <input type="text"  placeholder="描述" name="boarddescription"/>
          <input type="submit" value="添加"/>
          </form>
          </li>
        </ul>
       </div>
    </div>
    <div class="grid_4 ident-bot-2">
      <div class="tagline">
        <h3>用户管理</h3>
      </div>
      <p>所有用户如下：</p>
      <ul class="list-1">
       <%  Set rs10=server.CreateObject("ADODB.Recordset")
 Sql10="select * from userinfo order by flag desc " 
 rs10.Open Sql10,cn,3,3
 do while not rs10.eof
 %>
        <li><a href="#"><%=rs10("name") %>--<%if rs10("flag")=3 then %>超级管理员<%end if %>
        <%if rs10("flag")=2 then %>
        管理员--<a href="deletepower.asp?name=<%=rs10("name") %>" style="color:Blue">撤销管理员</a><%end if %>
        <%if rs10("flag")=1 then %>
        一般用户--<a style="color:Blue" href="changepower.asp?name=<%=rs10("name") %>">设为管理员</a>
        <%end if %></a></li>
          <%
  rs10.movenext
  	loop
  %>   
  
  <%
  rs10.close
  set rs10=nothing
  cn.close
  set cn=nothing
   %>
      </ul>
    </div>
    
    <div class="clear"></div>
    <div class="separator"></div>
  
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
<script src="../../js/custom.js"></script>

<!--end footer-->
</body>
<!-- InstanceEnd --></html>

