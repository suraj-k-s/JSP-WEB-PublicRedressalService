<%-- 
    Document   : District
    Created on : May 5, 2021, 2:10:08 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {

            String insQry = "insert into tbl_district(district_name,state_id)values('" + request.getParameter("txt_district") + "','" + request.getParameter("sel_state") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("District.jsp");

        }

        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_district where district_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("District.jsp");
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
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table District</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="sel_country">Select Country</label>
                                                    <select onchange="getState(this.value)" required="" class="form-control" name="sel_country" id="sel_country">
                                                        <option value="" >Select</option>
                                                        <%                                                            String conQry = "select * from tbl_country";
                                                            ResultSet rs1 = con.selectCommand(conQry);
                                                            while (rs1.next()) {
                                                        %>
                                                        <option value="<%=rs1.getString("country_id")%>"><%=rs1.getString("country_name")%></option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_state">Select State</label>
                                                    <select required="" class="form-control" name="sel_state" id="sel_state">
                                                        <option value="" >Select</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_district">District</label>
                                                    <input required="" type="text" class="form-control" id="txt_district" name="txt_district" >
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Country</td>
                                                <td align="center" scope="col">State</td>
                                                <td align="center" scope="col">District</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                int i = 0;
                                                String selQry = "select * from tbl_district d inner join tbl_state s on s.state_id=d.state_id inner join tbl_country c on c.country_id=s.country_id";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("country_name")%></td>
                                                <td align="center"><%=rs.getString("state_name")%></td>
                                                <td align="center"><%=rs.getString("district_name")%></td>
                                                <td align="center"><a href="District.jsp?del=<%=rs.getString("district_id")%>" class="status_btn">Delete</a> 
                                            </tr>
                                            <%                      }


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
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
        function getState(cid)
        {

            $.ajax({url: "../Assets/AjaxPages/AjaxState.jsp?cid=" + cid,
                success: function(result) {

                    $("#sel_state").html(result);
                }});
        }

    </script>
    <%@include file="Footer.jsp" %>
</html>
