<%-- 
    Document   : ViewGrievance
    Created on : 24 Mar, 2022, 6:36:43 AM
    Author     : Joseph Francis
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grievance</title>
        <%@include file="Header.jsp" %>
        <%@include file="SessionValidator.jsp"%>
    </head>
    <body>
        <div id="tab" align="center">
            <h1>Submitted Grievance</h1>
            <table border="1">
                <tr>
                    <td>SL.No</td>
                    <td>Department</td>
                    <td>Type</td>
                    <td>Subject</td>
                    <td>Details</td>
                    <td>Files</td>
                    <td>User</td>
                    <td>Status</td>
                </tr>
                <%
                int i = 0;
                String sel = "select * from tbl_grievance g inner join tbl_departmenttype dt on dt.departmenttype_id=g.departmenttype_id inner join tbl_grievancetype gt on gt.grievancetype_id=g.grievancetype_id inner join tbl_user u on u.user_id=g.user_id   where u.user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs = con.selectCommand(sel);
                while(rs.next())
                {
                    i++;
                
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("departmenttype_name")%></td>
                    <td><%=rs.getString("grievancetype_name")%></td>
                    <td><%=rs.getString("grievance_name")%></td>
                    <td><%=rs.getString("departmenttype_name")%></td>
                    <td><a href="../Assets/Files/GrievanceFile/<%=rs.getString("grievance_file")%>" download>download</a></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("grievance_reply")%></td>
                </tr>    
                <%
                }
                %>
            </table>
        </div>
    </body>
    <br><br><br><br><br><br><br><br>
    <%@include file="Footer.jsp" %>
</html>
