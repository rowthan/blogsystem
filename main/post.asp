<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>post</title>
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
            <li><a href="#">Contact</a></li>
            <!-- InstanceEndEditable -->
            <%if session("name")<>"" then%>
             <li><a href="logout.asp">logout</a></li>
             <li><a href="后台/user.asp" class="color" style="color:#0F0;"><%=session("name")%></a></li>
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
        <p><span class="bread-home"><a href="blog.asp">Home</a></span><a href="#">发表博文</a>编写</p>
      </div>
    </div>
    
    
     
    
    
    
    <div class="grid_5">
      <div class="block-ident-4">
        <h2>Find Us</h2>
        <div class="map img-border-2 ident-bot-2">
          <iframe src="https://maps.google.co.in/maps?f=d&amp;source=s_d&amp;saddr=Envato+Level+13,+2+Elizabeth+St,+Melbourne+Victoria+3000+Australia&amp;daddr=&amp;hl=en&amp;geocode=FZQHv_0d_AykCCGxVRMNIz_D7Q&amp;aq=t&amp;sll=-37.812332,144.968956&amp;sspn=0.012087,0.022724&amp;mra=prev&amp;ie=UTF8&amp;t=m&amp;iwloc=ddw0&amp;ll=-37.812332,144.968956&amp;spn=0.012087,0.022724&amp;output=embed"></iframe>
        </div>
        <dl>
          <dt class="ident-bot-2"><strong>Envato Melbourne, <br />
            Little Lonsdale St, Melbourne</strong></dt>
          <dd><span>+1 100 123 6580</span>Freephone:</dd>
          <dd><span>+1 200 123 6035</span>Telephone:</dd>
          <dd><span>+1 300 123 9898</span>FAX:</dd>
          <dd>E-mail: <a class="link-1" href="#">ranronghuano1@163.com</a></dd>
        </dl>
      </div>
    </div>
    <div class="grid_7">
      <h2>发表博文</h2>
      <!-- contact form -->
      <div id="confirm">
      
      <script language="javascript">
function check(){
 
 if (document.postinfo.title.value =="标题"){
  alert("必须要有一个标题！");
  document.postinfo.title.focus();
  return false;
 }
 if (document.postinfo.title.value ==""){
  alert("必须要有一个标题！");
  document.postinfo.title.focus();
  return false;
 }
 if (document.postinfo.postcontent.value =="Message:"){
  alert("内容不能为空！");
  document.postinfo.postcontent.focus();
  return false;
 }
 if (document.postinfo.postcontent.value ==""){
  alert("内容不能为空！");
  document.postinfo.postcontent.focus();
  return false;
 }
 }
</script>

<form  id="form1" action="savepost.asp" method="post" onsubmit="return check()" name="postinfo">
          <fieldset>
          <span>所属板块</span>
             <select name="boardid">
      <%
	  Set rs=server.CreateObject("ADODB.Recordset")
		Sql="select * from boardinfo"
		rs.Open Sql,cn,3,3
		
		 do while not rs.eof
		 response.Write"<option value="&rs("boardid")&">"&rs("boardname")&"</option>"
		 rs.movenext
		 loop
		 rs.close
		 set rs=nothing	
	  %>
      </select>
      <label class="name">
          <input type="text" name="title" value="标题"/>
          </label>
          <textarea name="postabstract">摘要</textarea>
          <label class="message">
          <textarea name="postcontent">Message:</textarea>
          <span class="error">*The message is too short.</span> <span class="empty">*Please enter Some Text .</span> </label>
         
          <div class="clear"></div>
          
          </fieldset>
          <div class="btns"><input name="submit" type="submit" class="button-yellow button-radius-50" data-type="submit">
        </form>
      </div>
      <!-- end contact form -->
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

