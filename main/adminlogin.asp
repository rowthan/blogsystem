<%@Language="vbscript" Codepage="65001"%>
<%Response.Charset="utf-8"%>
<!--#include file="conn.asp"-->
<%
dim pwd
dim name

name=trim(request.Form("name2"))
pwd=trim(request.Form("pwd2"))
Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from userinfo where name='"&name&"' and flag>1"
rs.Open Sql,cn,3,3

Set rs2=server.CreateObject("ADODB.Recordset")
sql2="select * from userinfo where name='"&name&"' and pwd='"&pwd&"' and flag>1"
rs2.Open sql2,cn,3,3

if rs.bof or rs.eof then
response.Write "<script>alert('"&name&"不存在该账号管理员！请重新选择登录');history.go(-1);</script>"
response.End()

else if not rs2.eof then
response.Write"登录成功！"
session("name")=name

session("power")=rs2("flag")
rs("login_time")=now()
rs("visitcount")=rs("visitcount")+1
rs.update
response.Write("<Script language=JavaScript>location.replace('admin/admin.asp?boardid=1');</Script> ") 
response.End()
else
response.Write "<script>alert('"&name&"密码错误，请重新登录');history.go(-1);</script>"
end if
end if

rs.close
set rs=nothing
rs2.close
set rs2=nothing
cn.close
set cn=nothing


%>

