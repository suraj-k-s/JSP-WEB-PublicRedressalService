<%-- 
    Document   : ViewCollegeComplaint
    Created on : May 13, 2021, 3:07:52 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grievance</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String upQry = "update tbl_grievance set grievance_reply='" + request.getParameter("txt_reply") + "',grievance_status='1' where grievance_id='" + request.getParameter("hid") + "'";
            con.executeCommand(upQry);
            response.sendRedirect("ViewGrievance .jsp");
        }


    %>
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <%                                    if (request.getParameter("up") != null) {
                                %>

                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Send Reply</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_district">Reply</label>
                                                    <input required="" type="text" class="form-control" id="txt_reply" name="txt_reply">
                                                    <input type="hidden" name="hid" value="<%=request.getParameter("up")%>">
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                                <h1>New Grievance</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Title</td>
                                                <td align="center" scope="col">Department</td>
                                                <td align="center" scope="col">Type</td>
                                                <td align="center" scope="col">File</td>
                                                <td align="center" scope="col">Details</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_grievance g inner join tbl_departmenttype dt on dt.departmenttype_id=g.departmenttype_id inner join tbl_grievancetype gt on gt.grievancetype_id=g.grievancetype_id inner join tbl_user u on u.user_id=g.user_id   where grievance_status='0'";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("user_name")%></td>
                                                <td align="center"><%=rs.getString("grievance_name")%></td>
                                                <td align="center"><%=rs.getString("departmenttype_name")%></td>
                                                <td align="center"><%=rs.getString("grievancetype_name")%></td>
                                                <td align="center"><a href="../Assets/Files/Grievance/<%=rs.getString("grievance_file")%>" download>Download</a></td>
                                                <td align="center"><%=rs.getString("grievance_details")%></td>
                                                <td align="center"><a href="ViewGrievance .jsp?up=<%=rs.getString("grievance_id")%>" class="status_btn">Reply</a> </td>
                                            </tr>
                                            <%
                                                }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                                <h1>Replied Grievance</h1>
                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Name</td>
                                                <td align="center" scope="col">Title</td>
                                                <td align="center" scope="col">Department</td>
                                                <td align="center" scope="col">Type</td>
                                                <td align="center" scope="col">File</td>
                                                <td align="center" scope="col">Details</td>
                                                <td align="center" scope="col">Reply</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int j = 0;
                                                String selQry1 = "select * from tbl_grievance g inner join tbl_departmenttype dt on dt.departmenttype_id=g.departmenttype_id inner join tbl_grievancetype gt on gt.grievancetype_id=g.grievancetype_id inner join tbl_user u on u.user_id=g.user_id   where grievance_status='1'";
                                                ResultSet rs1 = con.selectCommand(selQry1);
                                                while (rs1.next()) {

                                                    j++;

                                            %>
                                            <tr>
                                                <td align="center"><%=j%></td>
                                                <td align="center"><%=rs1.getString("user_name")%></td>
                                                <td align="center"><%=rs1.getString("grievance_name")%></td>
                                                <td align="center"><%=rs1.getString("departmenttype_name")%></td>
                                                <td align="center"><%=rs1.getString("grievancetype_name")%></td>
                                                <td align="center"><a href="../Assets/Files/Grievance/<%=rs1.getString("grievance_file")%>" download>Download</a></td>
                                                <td align="center"><%=rs1.getString("grievance_details")%></td>
                                                <td align="center"><%=rs1.getString("grievance_reply")%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>
