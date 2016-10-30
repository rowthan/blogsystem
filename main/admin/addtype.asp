<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发文保存</title>
</head>

<body>

<%
dim time
dim boardname
dim boarddescription


boardname=request.Form("boardname")
time=now()
boarddescription=trim(request.Form("boarddescription"))

Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from boardinfo "
rs.Open Sql,cn,3,3
rs.AddNew
rs("boardname")=boardname
rs("boardtime")=time
rs("boarddescription")=boarddescription
rs.update
rs.close
set rs=nothing
cn.close
set cn=nothing
response.Write"成功发帖！"
 response.Write("<Script language=JavaScript>location.replace(document.referrer);</Script> ") 
response.End()
%>
</body>
</html>
