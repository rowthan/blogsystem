<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>contact</title>
<!-- InstanceEndEditable -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0"/>
<link rel="stylesheet" href="../../css/style.css" media="screen"/>
<link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
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
<% If (IsEmpty(Session("name"))) then%> 
<%response.Redirect("../../index.asp") %>
<%end if %>
<header>
  <div class="row-1">
    <div class="container_12">
      <div class="grid_12">
        <div class="logo fleft">
          <h1><a href="index.html">Responsive Creative Theme</a></h1>
          <div class="slogan">博文主页</div>
        </div>
        <div class="call"> <img src="../images/icons/icon-phone.png" alt=""> <span>Call Me: 18314437524</span> </div>
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
            <li><a href="#">About</a></li><li><!-- InstanceBeginEditable name="active" -->
             
                <li ><a href="../blog.asp">Blog</a></li>
             <li>
            <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" -->
            <li ><a href="#">Contact</a></li>
            <!-- InstanceEndEditable -->
            <%if session("name")<>"" then%>
             <li><a href="../logout.asp">logout</a></li>
             <li class="active"><a href="#" class="color" style="color:#0F0;"><%=session("name")%></a></li>
             <%end if%>
             <%if session("name")="" then%>
             <li><a href="../../index.asp">login</a></li>
             <li><a href="../register/register.html" target="_blank">register</a></li>
             <%end if%>
          </ul>
        </nav>
        <!-- end menu -->
        <%if session("name")<>"" then%>
        <a href="../post.asp" class="spa-packages button-yellow"><img alt="" src="../images/icons/offer-icon.png">发文</a>
        <%end if%>
        <select id = "responsive-main-nav-menu" onchange = "javascript:window.location.replace(this.value);">
        </select>
      </div>
      
      <div class="clear"></div>
    </div>
  </div>
</header>
<script language="javascript">
    function checkpwd() {
        if (document.changepwd.pwd.value == "") {
            alert("原密码不能为空!请重新填写！");
            document.changepwd.pwd.focus();
            return false;
        }
        if (document.changepwd.newpwd.length<6) {
            alert("新密码长度不能小于6位");
            document.changepwd.newpwd.focus();
            return false;
        }
        if (document.changepwd.newpwd.value != document.changepwd.newpwd1.value) {
            alert("两次密码不一样！");
            document.changepwd.newpwd.focus();
            return false;
        }
       
    }
    
 </script>
<!--end header-->

<!-- content --><!-- InstanceBeginEditable name="editcontent" -->


<section id="content">
  <div class="container_12">
    <div class="grid_12">
      <div class="breadcrumbs">
        <p><span class="bread-home"><a href="../main/index.html">Home</a></span><a href="main/contact.html">Contact</a>联系博主</p>
      </div>
    </div>
    
    
     <div class="grid_12"><h1 class="text-t-big ident-bot-0">您有所有发表博文</h1></div>
    <%
	
  Set rs2=server.CreateObject("ADODB.Recordset")
Sql2="select * from postinfo where postname='"&Session("name")&"' "  
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
 do while not rs2.eof 
 
 dim postid
 postid = rs2("postid")
 
 Set rs3 = server.CreateObject("ADODB.Recordset")
 Sql3 = "select count(*) as noneniming from replyinfo where send=0 and postid='"&postid&"'" 
 rs3.Open Sql3,cn,3,3
 
 Set rs4 = server.CreateObject("ADODB.Recordset")
 Sql4 = "select count(*) as admitshow from replyinfo where send=1 and postid='"&postid&"'" 
 rs4.Open Sql4,cn,3,3
 
   Set rs5=server.CreateObject("ADODB.Recordset")
   Sql5="select * from replyinfo where postid='"&postid&"' order by replytime desc" 
   rs5.Open Sql5,cn,3,3
%>    

    
    <div class="clear"></div>
    <div class="separator"></div>
    <div class="wrapper">
        <div class="grid_12">
            <h3> <a href="../blog-single.asp?postid=<%=rs2("postid")%>"><span style="color:Blue"> <%=rs2("posttitle")%></span></a> 共有<%=rs3("noneniming")+rs4("admitshow")%>条回帖 &nbsp;&nbsp;&nbsp;<span style="color:Red"><%=rs3("noneniming") %></span>条回复在等待您审核&nbsp;&nbsp;&nbsp; <%=rs4("admitshow") %>已经显示&nbsp;&nbsp;&nbsp; 点击率为：<%=rs2("postclick") %>&nbsp;&nbsp;&nbsp;
            <a class="newsletter-button" href="deleteblog.asp?postid=<%=rs2("postid")%>">删除该贴</a></h3>  
         <a href="../blog-single.asp?postid=<%=rs2("postid")%>"> 摘要： <%=rs2("postabstract")%></a>
           <p>全部回帖如下：</p>
          <%
           if rs5.eof or rs5.bof then
           response.Write("<p style='color:red'>该帖子还没有任何回复！</p>")
           else
          do while not rs5.eof 
           %>
        <p>
        <%if rs5("send")=1 then %>
        <span style="color:Green"><%=rs5("replyname") %></span>&nbsp;&nbsp;&nbsp;说：<%=rs5("replycontent")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span > <a  class="newsletter-button" href="deletereply.asp?replyid=<%=rs5("replyid")%>">删除回复</a></span>
        <%end if %>
        <%if rs5("send")=0 then %>
        &nbsp;&nbsp;
        <span style="color:Green"><%=rs5("replyname") %></span>&nbsp;&nbsp;&nbsp;说：<%=rs5("replycontent")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span> 
       <span style="color:Red"> 等待您的审核</span>&nbsp;&nbsp;&nbsp;<span> <a  class="newsletter-button" href="admitreply.asp?replyid=<%=rs5("replyid") %>">审核通过</a></span>&nbsp;&nbsp;&nbsp;&nbsp;<span> <a  class="newsletter-button" href="deletereply.asp?replyid=<%=rs5("replyid")%>">删除回复</a></span>
        <%end if %>
        </p>
          <%
          rs5.movenext
          loop 
          end if%>

    
    </div>
    </div>
    
      <%
  rs2.movenext
  	loop
  %>
  
  <%
   rs3.close
  set rs3=nothing
  rs4.close
  set rs4=nothing
  rs5.close
  set rs5=nothing
  end if
  rs2.close
  set rs2=nothing
 
 
  %>
    
    
    <div class="clear"></div>
     <div class="separator"></div>
    <div class="grid_5">
      <div class="block-ident-4">
        <h2>个人信息管理</h2>
        <form action="updateinfo.asp" method="post">
        <dl>
        <%
         Set rs6=server.CreateObject("ADODB.Recordset")
   Sql6="select * from userinfo where name='"&session("name")&"'" 
   rs6.Open Sql6,cn,3,3
         %>
          <dt class="ident-bot-2"><strong><input readonly="readonly" name="name" value="<%=session("name") %>"/><input name="reallname" value="<%=rs6("reallname") %>"/> <br />
            真实姓名</strong></dt>
            <dt class="ident-bot-2"><strong>电话<input name="tel" value="<%=rs6("tel") %>"/> 
            </strong></dt>
             <dt class="ident-bot-2"><strong>QQ<input name="qq" value="<%=rs6("qq") %>"/> 
            </strong></dt>
             <dt class="ident-bot-2"><strong>email<input name="email" value="<%=rs6("email") %>"/> 
            </strong></dt>
            <input type="submit" value="更新"/>
        </dl>
        </form>
        <%
        rs6.close
        set rs6=nothing
         cn.close
        set cn=nothing
         %>
      </div>
    </div>
    
       <div class="grid_5">
      <div class="block-ident-4">
        <h2>修改密码</h2>
        <form name="changepwd" action="updatepwd.asp" method="post" onsubmit="return checkpwd()">
        <dl>
       <dt class="ident-bot-2"><strong>原始密码<input value="" name="pwd" type="password"/> 
            </strong></dt>
          <dt class="ident-bot-2"><strong>
          <input value="" name="newpwd" type="password" />
          <input value="" name="newpwd1" type="password"/> 
          <br />
            新密码-确认新密码</strong></dt>
          
            
             
            <input type="submit" value="更新"/>
        </dl>
        </form>
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

</body>
<!-- InstanceEnd --></html>

