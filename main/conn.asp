 
<%Response.Charset="utf-8"%>
<%
dim cn
set cn=server.createobject("adodb.connection")
cn.connectionstring="driver={SQL server};server=K\SQLEXPRESS;datebase=blogdb;uid=bloguser;pwd=123456"
cn.open
%>