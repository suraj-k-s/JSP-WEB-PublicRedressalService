<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String selQry = "select * from tbl_chat c inner join tbl_user u on (u.user_id=c.chat_from_id) or (u.user_id=c.chat_to_id) where user_id='" + session.getAttribute("uid") + "' order by chat_date";
    System.out.println(selQry);
    ResultSet rs = con.selectCommand(selQry);
    while (rs.next()) {

        if (rs.getString("chat_from_id").equals(session.getAttribute("uid"))) {


%>

<div class="chat-message is-sent">
    <img src="../../Assets/Files/Photo/<%=rs.getString("user_photo")%>" alt="">
    <div class="message-block">
        <span><%=rs.getString("user_name")%></span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%

} else if (rs.getString("chat_to_id").equals(session.getAttribute("uid"))) {

%>
<div class="chat-message is-received">
    <img src="../../Assets/Files/Photo/<%=rs.getString("user_photo")%>" alt="">
    <div class="message-block">
        <span>Admin</span>
        <div class="message-text"><%=rs.getString("chat_content")%></div>
    </div>
</div>
<div class="chat-message" style="margin: 0px; padding: 0px" >

</div>

<%
        }
    }


%>