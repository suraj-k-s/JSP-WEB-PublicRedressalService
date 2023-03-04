<%-- 
   Document   : Grievance
   Created on : 24 Mar, 2022, 6:36:28 AM
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
            <h1>Grievance Registration</h1>
            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/GrievanceActionPage.jsp">
                <table border="1">
                    <tr>
                        <td>
                            Title
                        </td>
                        <td> 
                            <input type="text" name="txt_name"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Department
                        </td>
                        <td>
                            <select name="sel_dep">
                                <option value="">--------Select---------</option>
                                <%
                                    String sel = "select * from tbl_departmenttype";
                                    ResultSet rs = con.selectCommand(sel);
                                    while (rs.next()) {

                                %>
                                <option value="<%=rs.getString("departmenttype_id")%>"><%=rs.getString("departmenttype_name")%></option>  
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Type
                        </td>
                        <td>
                            <select name="sel_type">
                                <option value="">--------Select---------</option>
                                <%
                                    String sel1 = "select * from tbl_grievancetype";
                                    ResultSet rs1 = con.selectCommand(sel1);
                                    while (rs1.next()) {

                                %>
                                <option value="<%=rs1.getString("grievancetype_id")%>"><%=rs1.getString("grievancetype_name")%></option>  
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            File
                        </td>
                        <td>
                            <input type="file" name="file_photo"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Details
                        </td>
                        <td>
                            <textarea name="txt_details"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" name="btn_save" value="Submit"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
    <%@include file="Footer.jsp" %>
</html>
