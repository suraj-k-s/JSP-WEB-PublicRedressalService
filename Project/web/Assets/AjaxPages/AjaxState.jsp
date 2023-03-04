<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<option value="">Select</option>
<%
    String disQry = "select * from tbl_state where country_id='" + request.getParameter("cid") + "'";
    ResultSet rs1 = con.selectCommand(disQry);
    while (rs1.next()) {
%>
<option value="<%=rs1.getString("state_id")%>"><%=rs1.getString("state_name")%></option>

<%
    }

%>