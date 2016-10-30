<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/blog.dwt.asp" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Blog-single</title>
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
<%
 dim postid
 postid=request("postid")
  Set rs=server.CreateObject("ADODB.Recordset")
  sql="select * from postinfo where postid='"&postid&"'"
  rs.Open Sql,cn,3,3
  session("postid")=postid
 rs("postclick")=rs("postclick")+1
 rs.update
 
 
  %>
  
     <%
 Set rs2=server.CreateObject("ADODB.Recordset")
 Sql2="select * from replyinfo where postid='"&postid&"' order by replytime desc" 
 rs2.Open Sql2,cn,3,3
 
 Set rs3=server.CreateObject("ADODB.Recordset")
 sql3="select count(*) as nimingshu from replyinfo where send<>1 and postid='"&postid&"'"
 rs3.Open Sql3,cn,3,3
 Set rs4=server.CreateObject("ADODB.Recordset")
 sql4="select count(*) as noneniming from replyinfo where send=1 and postid='"&postid&"'"
 rs4.Open Sql4,cn,3,3
%>      

<section class="grid_8 fleft">
      <div class="post-border-right">
        <article class="post-holder">
          <header>
            <h2 class="entry-title"><a href="#"><%=rs("posttitle")%></a></h2>
            <div class="post-meta">
              <div class="fleft">Posted in: <a href="#"><%=rs("postid")%></a> |
                <div class="time"><%=rs("posttime")%></div>
                , by <a href="#"><%=rs("postname")%></a></div>
              <div class="fright"><a href="#"><%=rs("postclick")%> click</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><%=rs4("noneniming")+rs3("nimingshu")%> comments</a></div>
            </div>
            <!--.post-meta-->
          </header>
         
          <p class="ident-bot-2"><%=rs("postcontent")%></p>
          <div class="addthis_toolbox addthis_pill_combo"> <a class="addthis_button_google_plusone" g:plusone:size="medium"></a> <a class="addthis_button_tweet" tw:count="horizontal"></a> <a class="addthis_button_facebook_like"></a> </div>
        </article>
        <div class="clear"></div>
        <div class="separator"></div>
       
        <!--COMMENTS-->
     


       <article class="comment-box">
       <h3><%=rs4("noneniming")%> Comments显示 &nbsp;&nbsp;&nbsp;|<%=rs3("nimingshu")%>条回复在等待博主审核</h3>  
       <%
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs2.pagesize=10
 if rs2.eof or rs2.bof then
 response.Write"<tr><td>该帖子没有回复</td></tr>"
 else
 mypagesize=rs2.pagesize
 rs2.absolutepage=page
 dim replyid
 replyid=rs2("replyid")
 do while not rs2.eof and mypagesize>0
  %>
       
         <%send=rs2("send")
		 if send=1 then
		 %>   
          <div class="parent">
            <div class="img-border-bg ident-right-2 fleft"><img class="img-border" src="images/mark.jpg" alt="" title="" /></div>
            <h5><a href="#"><%=rs2("replyname")%></a></h5>
            <span><%=rs("replytime")%></span> 
            <p><%=rs2("replycontent")%></p>
          </div>
          <%end if%>
         <%
  mypagesize=mypagesize-1
  i=i+1
  rs2.movenext
  loop
  %>
 
<%end if
rs2.close
set rs2=nothing
rs3.close
set rs3=nothing
rs4.close
set rs4=nothing
%>

        </article>
        
        
        
        <div class="clear"></div>
        <div class="separator"></div>
        <!-- Form -->
        <article>
          <div class="grid_7">
            <h2>Reply</h2>
            <!-- contact form -->
            
            <script language="javascript">
            function check(){
	if (document.reply.nonename.value =="Name:匿名留言必须填写临时用户名"){
  alert("请你取一个匿名名字！");
  document.reply.nonename.focus();
  return false;
  }
  
  if (document.reply.replycontent.value =="匿名用户留言不会出现在留言板中，只会被博主看见，请登录后再留言！"){
  alert("评论内容不合法！");
  document.reply.replycontent.focus();
  return false;  
 }
 if (document.reply.replycontent.value ==""){
  alert("评论内容不能为空！");
  document.reply.replycontent.focus();
  return false;  
 }
 
            }</script>
            
            
            
            <div id="confirm">
              <form id="form1" action="savereply.asp" method="post" name="reply" onSubmit="return check()" >
              <%if session("name")="" then%>
                <label class="name">
                <input type="text" value="Name:匿名留言必须填写临时用户名" name="nonename" onBlur="this.value=!this.value?'Name:匿名留言必须填写临时用户名！':this.value;" onclick="this.value='';"/>
                <span class="error">*This is not a valid name.</span> <span class="empty">*Please enter Full Name .</span> </label>
                <label class="email">
                <input type="email" value="Email:留下你的邮箱以便我们联系" name="email" onBlur="this.value=!this.value?'Email:留下你的邮箱以便我们联系！':this.value;" onclick="this.value='';" />
                <span class="error">*This is not a valid email address.</span> <span class="empty">*Please enter Email Address.</span> </label>
                
                <label class="message">
                <textarea onMouseOver="this.value='匿名用户留言不会出现在留言板中，只会被博主看见，请登录后再留言！'" onClick="this.value=''"name="replycontent"></textarea>
                <span class="error">*The message is too short.</span> <span class="empty">*Please enter Some Text .</span> </label>
                <div class="clear"></div>
                <div class="btns"><input name="submit" type="submit" class="button-yellow button-radius-50" data-type="submit"></div>
                <input name="send" type="hidden" value="0">
                </fieldset>
                <%end if%>
                
                <%if session("name")<>"" then %>
                <label class="message">
                <textarea name="replycontent"></textarea>
                <span class="error">*The message is too short.</span> <span class="empty">*Please enter Some Text .</span> </label>
                <div class="clear"></div>
                <div class="btns"><input name="submit" type="submit" class="button-yellow button-radius-50" data-type="submit">
               </div>
                <input name="send" type="hidden" value="1">
                </fieldset>
                <%end if%>
                
              </form>
            </div>
            <!-- end contact form -->
          </div>
        </article>
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
        
        <!--user info-->
        <%
		dim postname1
		postname1=rs("postname")
 		 Set rs8=server.CreateObject("ADODB.Recordset")
  		sql8="select * from userinfo where name='"&postname1&"'"
 		 rs8.Open Sql8,cn,3,3
		%>
         <div class="side-paragraph">
          <h5>博主信息:&nbsp;&nbsp;&nbsp;<a href="contact.asp?postname=<%=rs8("name")%>"><%=rs8("name")%></a></h5>
          <div> <a class="lightbox-image img-border-bg fleft" data-gal="prettyPhoto[pp_gal_1]" href="images/image-blank.png"> <img class="img-border" src="images/rc-img4.jpg" alt="" title="" /></a>
          
         
            <p class="ident-bot-0"> <%=rs8("sign")%> </p>
          </div>
        </div>
        <%
		rs8.close
		set rs8=nothing
		%>
        <!--end user info-->
        
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
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs5.pagesize=10
 mypagesize=rs5.pagesize
 rs5.absolutepage=page
 do while not rs5.eof and mypagesize>0
 %>
  <span class="smalldate"><%=rs5("posttime")%>&nbsp;&nbsp;&nbsp;&nbsp;totalclick：<%=rs5("postclick")%></span> 
  
          <div class="recent-post-block"> 
          <a href="blog-single.asp?postid=<%=rs5("postid")%>" class="link-name"> by <%=rs5("postname")%><br><%=rs5("posttitle")%> </a>
          </div>
           
          
   <%
  mypagesize=mypagesize-1
  i=i+1
  rs5.movenext
  loop
  %>
 
<%
rs.close
set rs=nothing
rs5.close
set rs5=nothing
cn.close
 set cn=nothing
%>
        </div>
       
       
       
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

