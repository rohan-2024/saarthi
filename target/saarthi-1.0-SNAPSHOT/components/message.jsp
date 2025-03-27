<%-- 
    Document   : message
    Created on : May 5, 2022, 9:01:38 PM
    Author     : Swastik Computer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String message=(String)session.getAttribute("message");
    if(message!=null)
    {

%>
<div class="alert alert-success alert-dismissible fade show" role="alert" aria-hidden="true">
    <strong><%=message%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="close">
        <span aria-hidden="true">&times;</span>
    </button>
    
</div>
    <%
        session.removeAttribute("message");
        }
        %>