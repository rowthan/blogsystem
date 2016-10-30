<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>允许发表</title>
</head>

<body>


<%
dim replyid
replyid=request("replyid")
Set rs2=server.CreateObject("ADODB.Recordset")
 Sql2="select * from replyinfo where replyid='"&replyid&"'" 
 rs2.Open Sql2,cn,3,3
 
 
 rs2("send")=1
 rs2.update
 cn.close
 set cn=nothing
 response.write"已允许回复，将出现在博客留言中！"
 %>
 <script language="javascript" type="text/javascript"> 
// 以下方式直接跳转
//window.location.href='hello.html';
// 以下方式定时跳转
setTimeout("javascript:location.href='user.asp'", 1000); 
</script>
</body>
</html>
