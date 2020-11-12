<%-- 
    Document   : ErrorPage
    Created on : Sep 22, 2020, 4:47:08 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR PAGE</title>
    </head>
    <body>
        <h1 style="color: red">SOMETHING WRONG, YOUR PAGE IS UNAVAILABLE</h1>
        <br/>
        <c:if test="${not empty sessionScope}">
            <a href="Homepage.jsp">Click here to return home page</a>
            <br/>
        </c:if>
            <a href="ServletDispatcher?btnAction=Logout">Click here to login</a> <br/>
            <a href="Registration.jsp">Don't have account, Click here to sign up</a>
    </body>
</html>
