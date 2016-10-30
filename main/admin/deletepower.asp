<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发文保存</title>
</head>

<body>
<%if not session("power")=3 then %>
<%
 response.Write("<Script language=JavaScript>alert('你无权进行此操作');location.replace(document.referrer);</Script> ")
  response.End()
 %>
<%
else
dim name

name=request("name")


Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from userinfo where name='"&name&"' "
rs.Open Sql,cn,3,3
if not rs.eof then
rs("flag")=1
rs.update
rs.close
set rs=nothing
response.Write"审核中！"
 response.Write("<Script language=JavaScript>alert('成功撤销管理员！');location.replace(document.referrer);</Script> ") 
response.End()

else

 response.Write("<Script language=JavaScript>alert('升级过程出错！');location.replace(document.referrer);</Script> ") 

end if
cn.close
set cn=nothing

%>
<%end if %>
</body>
</html>
