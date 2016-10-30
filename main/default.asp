<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <link href="css.css" rel="stylesheet" type="text/css" />
<title>首页</title>
</head>

<body>
<div id="top">
</div>
<%if session("name")<>"" then %>
<%=session("name")%>恭喜你已经登录成功！
<%else%>
<span>您现在是游客！</span>
<%end if%>
<br>

<div class="bander">
<a href="default.asp">首页</a> &nbsp;&nbsp;<a href="register.html">注册</a>&nbsp;&nbsp;
<%if session("name")<>"" then %>
<a href="logout.asp">退出</a>
<a href="modifyuserinfo.asp">修改用户资料</a>&nbsp;&nbsp;
</a>&nbsp;&nbsp;<a href="post.asp">发文</a>&nbsp;&nbsp;
<a href="mypost.asp">我的帖子</a>&nbsp;&nbsp;
<%else%><a href="login.html">登录</a><%end if%>&nbsp;&nbsp;<a href="admin.html">管理</a>
</div>
<div id="top">
</div>
<table width="100%" border="1" cellspacing="2" cellpadding="1">
  <tr>
    <td>板块名称</td>
    <td>板块描述</td>
    <td>发帖数目</td>
  </tr>
  <%
  Set rs=server.CreateObject("ADODB.Recordset")
 Sql="select * from boardinfo order by boardid" 
 rs.Open Sql,cn,3,3
 if IsNumeric(request("page"))=false or request("page")="" then
 page=1
 else 
 page=cint(request("page"))
 end if
 rs.pagesize=10
 
 if rs.eof or rs.bof then
 response.Write"<tr><td>该博客还没有板块</td></tr>"
 else
 mypagesize=rs.pagesize
 rs.absolutepage=page
 do while not rs.eof and mypagesize>0
  %>
  
  <tr>
  <td>
  <a href="list.asp?boardid=<%=rs("boardid")%>"><%=rs("boardname")%></a>
  </td>
   <td>
   <a href="list.asp?boardid=<%=rs("boardid")%>"> <%=rs("boarddescription")%></a>
  </td>
  <%
 Set rs1=server.CreateObject("ADODB.Recordset")
 Sql1="select * from postinfo where boardid="&rs("boardid")
 rs1.Open Sql1,cn,3,3
 %>
 <td>
 <%=rs1.recordcount%>
 </td>
 </tr>
    <%
  rs1.close
  set rs1=nothing
  %>
  <%
  mypagesize=mypagesize-1
  i=i+1
  rs.movenext
  	loop
  %>
  
  <%
  end if
  rs.close
  set rs=nothing
  cn.close
  set cn=nothing
  %>
</table>
</body>
</html>
