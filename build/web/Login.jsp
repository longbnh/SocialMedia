<%-- 
    Document   : login
    Created on : Sep 15, 2020, 11:36:06 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN PAGE</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <c:set var="error" value="${requestScope.ERROR}" />
        <c:if test="${not empty sessionScope.NAME}">
            <c:redirect url="Homepage.jsp"/>
        </c:if>
        <h1 style="text-align:center">Mini Social Media</h1>
        <h3 style="margin-left: 20px">Login form</h3>

        <form action="ServletDispatcher" method="POST" style="width: 90%;margin-left: 20px">
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"
                       name="txtID">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="txtPassword">
            </div>

            <c:if test="${not empty error}">
                <div class="form-group">
                    <font color="red">${error}</font> 
                </div>
            </c:if>

            <button type="submit" class="btn btn-primary" name="btnAction" value="Login">Submit</button> 
            <a class="form-group" href="Registration.jsp">Sign up</a>
        </form>
    </body>
</html>
