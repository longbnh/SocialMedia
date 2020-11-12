<%-- 
    Document   : verify
    Created on : Nov 12, 2020, 10:24:16 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VERIFY PAGE</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <form action="ServletDispatcher" method="POST" style="width: 90%;margin-left: 20px">
            <div class="form-group">
                <label for="exampleInputEmail1">Verify Code</label>
                <input type="text" class="form-control" placeholder="Your code in email"
                       name="txtCode">
            </div>
            <button type="submit" class="btn btn-primary" name="btnAction" value="Verify">Verify</button> 
            <c:if test="${not empty requestScope.ERR}">
                <div class="form-group">
                    <font color="red"> ${requestScope.ERR} </font> 
                </div>
            </c:if>
        </form>
    </body>
</html>
