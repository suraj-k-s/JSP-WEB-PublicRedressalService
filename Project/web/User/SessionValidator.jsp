<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("uid") == null)
        {
            response.sendRedirect("../");
        }
    %>