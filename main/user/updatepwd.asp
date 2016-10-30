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


dim pwd
dim newpwd
dim name
name=session("name")
pwd=trim(request.Form("pwd"))
newpwd=trim(request.Form("newpwd"))

Set rs=server.CreateObject("ADODB.Recordset")
Sql="select pwd from userinfo where name='"&name&"'"
rs.Open Sql,cn,3,3
if rs("pwd")=pwd then 

rs("pwd")=newpwd
rs.update
 response.Write("<Script language=JavaScript>alert('成功修改密码');location.replace(document.referrer);</Script> ")
else
 response.Write("<Script language=JavaScript>alert('原始密码错误！修改失败');location.replace(document.referrer);</Script> ")
response.End()
end if
rs.close
set rs=nothing
cn.close
set cn=nothing




%>

</body>
</html>