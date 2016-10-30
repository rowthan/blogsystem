<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>回复</title>
</head>

<body>
<%
dim postid
dim postid2
dim replycontent
dim replytime
dim replyname
dim replyid
replytime=now()

Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from replyinfo where postid='"&postid&"'"
rs.Open Sql,cn,3,3

postid2=session("postid")
Set rs2=server.CreateObject("ADODB.Recordset")
Sql2="select * from postinfo where postid='"&postid2&"'"
rs2.Open Sql2,cn,3,3


if session("name")<>"" then
replyname=session("name")
rs.AddNew
rs("replyname")=replyname
rs("replytime")=replytime
rs("replycontent")=trim(request.Form("replycontent"))
rs("postid")=session("postid")
rs("send")=trim(request.Form("send"))
rs.update
rs.close
set rs=nothing


rs2("replycount")=rs2("replycount")+1
rs2("replytime")=now()
rs2("replyname")=replyname
rs2("postclick")=rs2("postclick")-1
rs2.update
rs2.close
set rs2=nothing
end if

if session("name")="" then
replyname="匿名用户"+trim(request.Form("nonename"))
rs.AddNew
rs("replyname")=replyname
rs("replytime")=replytime
rs("replyemail")=trim(request.Form("email"))
rs("replycontent")=trim(request.Form("replycontent"))
rs("postid")=session("postid")
rs("send")=trim(request.Form("send"))

rs.update
rs.close
set rs=nothing


rs2("replycount")=rs2("replycount")+1
rs2("replytime")=now()
rs2("replyname")=replyname
rs2("postclick")=rs2("postclick")-1

rs2.update
rs2.close
set rs2=nothing
end if


cn.close
set cn=nothing
Response.Redirect "blog-single.asp?postid="&session("postid")&"" 
%>




</body>
</html>
