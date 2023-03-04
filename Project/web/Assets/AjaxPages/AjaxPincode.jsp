<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%
    String disQry = "select * from tbl_place where place_id='" + request.getParameter("pid") + "'";
    ResultSet rs1 = con.selectCommand(disQry);
    rs1.next();
    out.println(rs1.getString("place_pincode"));
%>