<%-- 
    Document   : Homepage
    Created on : Sep 24, 2020, 10:03:44 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <c:set var="name" value="${sessionScope.NAME}"/>
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between" style="background-color: #e3f2fd;">
            <h3 class="navbar-brand">Mini Social Media</h3>

            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link" href="ServletDispatcher?btnAction=Notify">Home Page</a>
                    <a class="nav-item nav-link" href="PostArticlePage.jsp">Post your article</a>
                    <a class="nav-item nav-link" href="ServletDispatcher?btnAction=Logout">Log out</a>
                </div>
            </div>
            <form class="form-inline" action="ServletDispatcher">
                <input class="form-control mr-sm-2" type="text" placeholder="Search Content"
                       name="txtSearch" value="${param.txtSearch}">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search" name="btnAction">Search</button>
            </form>
        </nav>
        <h5 style="color: blue"> Welcome ${name} </h5>

        <c:set var="listNotify" value="${requestScope.NOTIFY}" />
        <c:forEach var="notify" items="${listNotify}" varStatus="counter">
            <form action="ServletDispatcher" method="POST">
                <input type="hidden" name="txtPostID" value="${notify.postID}" />
                <div class="card">
                    <h5 class="card-header">${notify.dayAction}</h5>
                    <div class="card-body">
                        <p class="card-text">${notify.name} has ${notify.typeName} your post</p>
                        <input class="btn btn-primary" type="submit" value="View Post" name="btnAction">
                    </div>
                </div>
            </form>            
        </c:forEach>

        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:forEach begin="1" end="${requestScope.TOTALPAGE}" varStatus="counter">
                    <li class="page-item">
                        <a class="page-link" href="ServletDispatcher?btnAction=Notify&currentPage=${counter.count}">${counter.count}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </body>
</html>
