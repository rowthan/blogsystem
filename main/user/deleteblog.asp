<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>删除博文</title>
</head>

<body>


<%
dim postid
postid=request("postid")
Set rs=server.CreateObject("ADODB.Recordset")
 Sql="select * from replyinfo where postid='"&postid&"'" 
 rs.Open Sql,cn,3,3
 if not rs.eof  then
  rs.delete
  rs.update
 end if
 rs.close

Set rs2=server.CreateObject("ADODB.Recordset")
 Sql2="select * from postinfo where postid='"&postid&"'" 
 rs2.Open Sql2,cn,3,3
 
 
 rs2.delete
 rs2.update
 rs2.close
 

 set rs2=nothing
 set rs=nothing
 cn.close
 set cn=nothing
 response.write"帖子已经成功删除！"
 %>
 
 <%
 response.Write("<Script language=JavaScript>location.replace(document.referrer);</Script> ") 
response.End()
  %>
  
 
// 以下方式直接跳转
//window.location.href='hello.html';
// 以下方式定时跳转
//setTimeout("javascript:location.href='personal.asp'", 1000); 
</body>
</html>
