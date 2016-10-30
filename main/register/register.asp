<%@Language="vbscript" Codepage="65001"%>
<%Response.Charset="utf-8"%>
<!--#include file="../conn.asp"-->
<%
dim pwd
dim name 
dim gender
dim qq
dim tel
dim email
dim reg_time
dim reallname
dim school
dim address
name=trim(request.Form("name"))
qq=trim(request.Form("qq"))
tel=trim(request.Form("tel"))
pwd=trim(request.Form("pwd"))
email=trim(request.Form("email"))
reallname=trim(request.Form("reallname"))
gender=trim(request.Form("gender"))
school=trim(request.Form("school"))
address=trim(request.Form("address"))
Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from userinfo where name='"&name&"'"
rs.Open Sql,cn,3,3
if not rs.EOF then
response.Write "<script>alert('"&name&"该账号已经被注册！请重新选择注册名');history.go(-1);</script>"
response.End()
else 
rs.AddNew
rs("name")=name
rs("tel")=tel
rs("pwd")=pwd
rs("qq")=qq
rs("email")=email
rs("gender")=gender
rs("reallname")=reallname
rs("flag")=1
rs("address")=address
rs("school")=school
rs("reg_time")=now()
rs.update
end if
rs.close
set rs=nothing
cn.close
set cn=nothing

session("power")=1
session("name")=name
response.Redirect "../../index.asp"
%>

