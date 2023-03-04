<%-- 
    Document   : EditProfile
    Created on : May 5, 2021, 2:15:04 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <%
    
        if(request.getParameter("btn_update")!=null)
        {
            
            String upQry = "update tbl_user set "
                    + "user_name='"+request.getParameter("txt_name")+"', "
                    + "user_contact_1='"+request.getParameter("txt_number")+"',"
                    + "user_email_1='"+request.getParameter("txt_email")+"',"
                    + "user_address='"+request.getParameter("txt_address")+"'"
                    + "where user_id='"+session.getAttribute("uid")+"'";
            con.executeCommand(upQry);
            response.sendRedirect("ViewProfile.jsp");
            
        }
    
    
    %>
    <body>
        <div id="tab" align="center">
        <h1>Edit Profile</h1>
        <form method="post">
        <table border="1">
            <%
                String selQry = "select * from tbl_user where user_id='"+session.getAttribute("uid")+"'";
                ResultSet rs = con.selectCommand(selQry);
                if(rs.next())
                {
            %>
           
                <td>Name</td>
                <td><input type="text" name="txt_name" value="<%=rs.getString("user_name")%>"></td>
            </tr>
             <tr>
                <td>Contact</td>
                <td><input type="text" name="txt_number" value="<%=rs.getString("user_contact_1")%>"></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><input type="email" name="txt_email" value="<%=rs.getString("user_email_1")%>"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><textarea name="txt_address"><%=rs.getString("user_address")%></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Update" name="btn_update"></td>
            </tr>
            <%
                }
            %>
        </table>
        </form>
        </div>
            <%@include file="Footer.jsp" %>
            
    </body>
</html>
