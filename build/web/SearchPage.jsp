<%-- 
    Document   : SearchPage
    Created on : Sep 16, 2020, 9:37:25 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
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

        <br/>

        <c:set var="listArticle" value="${requestScope.ARTICLE}"/>
        <c:if test="${not empty listArticle}">
            <c:forEach var="article" items="${listArticle}" varStatus="counter">
                <form action="ServletDispatcher" method="POST">
                    <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                    <input type="hidden" name="txtPostID" value="${article.postID}" />
                    <div class="card">
                        <h5 class="card-header">${article.title}</h5>
                        <div class="card-body">
                            <h5 class="card-title">${article.description}</h5>
                            <c:if test="${not empty article.image}">
                                <img class="card-img-top" src="${article.image}" style="width: 200px">
                            </c:if>
                            <p class="card-text">Day post : ${article.dayPost}</p>
                            <input class="btn btn-primary" type="submit" value="View Post" name="btnAction">
                        </div>
                    </div>
                </form>
                <br/>
            </c:forEach>
        </c:if>
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <c:forEach begin="1" end="${requestScope.TOTAL_PAGE}" varStatus="counter">
                    <li class="page-item">
                        <a class="page-link" href="ServletDispatcher?btnAction=Search&currentPage=${counter.count}&txtSearch=${param.txtSearch}">${counter.count} </a>
                    </li>
                </c:forEach>
            </ul>
        </nav>

    </body>
</html>
