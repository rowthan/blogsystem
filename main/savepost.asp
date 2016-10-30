<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发文保存</title>
</head>

<body>

<%
dim boardid
dim posttime
dim postname
dim postcontent
dim posttitle

boardid=request.Form("boardid")
posttime=now()
postname=session("name")
postcontent=trim(request.Form("postcontent"))
posttitle=trim(request.Form("title"))

Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from postinfo "
rs.Open Sql,cn,3,3
rs.AddNew
rs("postname")=postname
rs("posttime")=posttime
rs("postcontent")=postcontent
rs("boardid")=request.Form("boardid")
rs("posttitle")=posttitle
rs("postclick")=0
rs("replycount")=0
rs("postabstract")=trim(request.Form("postabstract"))
rs.update
rs.close
set rs=nothing
response.Write"成功发帖！"
%>
<script language="javascript" type="text/javascript"> 
// 以下方式直接跳转
//window.location.href='hello.html';
// 以下方式定时跳转
setTimeout("javascript:location.href='blog.asp'", 1000); 
</script>
</body>
</html>
