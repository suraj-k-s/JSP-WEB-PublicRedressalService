<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<option value="">Select</option>
<%
    String disQry = "select * from tbl_district where state_id='" + request.getParameter("sid") + "'";
    ResultSet rs1 = con.selectCommand(disQry);
    while (rs1.next()) {
%>
<option value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%></option>

<%
    }

%>