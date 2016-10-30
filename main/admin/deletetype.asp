<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>删除类别</title>
</head>

<body>


<%
dim boardid
boardid=request("boardid")
Set rs=server.CreateObject("ADODB.Recordset")
 Sql="select * from boardinfo where boardid='"&boardid&"'" 
 rs.Open Sql,cn,3,3

 if not rs.eof  then
  rs.delete
  rs.update
 response.write"帖子删除中！"
  response.Write("<Script language=JavaScript>alert('该类别已经删除');location.replace(document.referrer);</Script> ") 
  response.End()

 %>
 
 <%
else 
 response.Write("<Script language=JavaScript>alert('删除失败！');location.replace(document.referrer);</Script> ") 
response.End()

 end if
  rs.close
 set rs=nothing
 cn.close
 set cn=nothing
  %>
  
</body>
</html>
