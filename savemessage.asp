
<%@Language="vbscript" Codepage="65001"%>
<%Response.Charset="utf-8"%>
<!--#include file="main/conn.asp"-->
<%
dim message
message=trim(request.Form("message"))
Set rs=server.CreateObject("ADODB.Recordset")
Sql="select * from message"
rs.Open Sql,cn,3,3
rs.AddNew
rs("Message")=message
rs("Type")=0
rs("Time")=now()
rs.update
rs.close
set rs=nothing
cn.close
set cn=nothing
 %>
 
 <%
response.Write "<script>alert('留言成功！');location.replace(document.referrer);</script>"  %>