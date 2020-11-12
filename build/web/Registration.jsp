<%-- 
    Document   : registration
    Created on : Sep 14, 2020, 11:15:33 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION PAGE</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <c:set var="error" value="${requestScope.ERROR_REGISTER}"/>
        <h1 style="text-align:center">Mini Social Media</h1>
        <h3 style="margin-left: 20px">Register Account</h3>
        
        <form action="ServletDispatcher" method="POST" style="width: 90%; margin-left: 20px">
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"
                       name="txtID" value="${param.txtID}">
            </div>
            <c:if test="${not empty error.emailInvalid}">
                <div class="form-group">
                    <font color="red"> ${error.emailInvalid} </font> <br/>
                </div>
            </c:if>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="txtPassword">
            </div>
            <c:if test="${not empty error.passwordInvalid}">
                <div class="form-group">
                    <font color="red"> ${error.passwordInvalid} </font> <br/>
                </div>
            </c:if>
            <div class="form-group">
                <label for="exampleInputPassword1">Confirm your password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm your password" name="txtConfirmPassword">
            </div>
            <c:if test="${not empty error.confirmNotMatch}">
                <div class="form-group">
                    <font color="red"> ${error.confirmNotMatch} </font> 
                </div>
            </c:if>
            <div class="form-group">
                <label for="exampleInputPassword1">Name</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Name" name="txtName">
            </div>
            <c:if test="${not empty error.invalidName}">
                <div class="form-group">
                    <font color="red"> ${error.invalidName} </font> 
                </div>
            </c:if>
            <button type="submit" class="btn btn-primary" name="btnAction" value="Create an account">Sign up</button> 
            <c:if test="${not empty error.emailIsExisted}">
                <div class="form-group">
                    <font color="red"> ${error.emailIsExisted} </font>
                </div>
            </c:if>
            <a class="form-group" href="Login.jsp">Sign in</a>
        </form>

    </body>
</html>
