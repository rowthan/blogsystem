<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更新信息</title>
</head>

<body>
<%


dim qq
dim tel
dim email
dim reallname
dim name
name=trim(request.Form("name"))
qq=trim(request.Form("qq"))
tel=trim(request.Form("tel"))
email=trim(request.Form("email"))
reallname=trim(request.Form("reallname"))

Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from userinfo where name='"&name&"'"
rs.Open Sql,cn,3,3
 rs("tel")=tel
rs("qq")=qq
rs("email")=email
rs("reallname")=reallname
rs.update
 response.Write("<Script language=JavaScript>alert('成功修改信息');location.replace(document.referrer);</Script> ")

response.End()

rs.close
set rs=nothing
cn.close
set cn=nothing




%>

</body>
</html>