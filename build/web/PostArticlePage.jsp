<%-- 
    Document   : PostArticlePage
    Created on : Sep 19, 2020, 6:32:46 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POST YOUR ARTICLE</title>
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

        <c:set var="postError" value="${requestScope.POST_ERROR}"/>
        <div style="margin-left: 30px">
            <h2>Post</h2>
            <form action="ServletDispatcher" method="POST" style="width: 60%">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Title</span>
                    </div>
                    <input type="text" class="form-control" placeholder="Title" aria-describedby="basic-addon1" name="txtTitle">
                </div>

                <c:if test="${not empty postError.emptyTitle}">
                    <font color="red"> ${postError.emptyTitle} </font> 
                </c:if>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Description</span>
                    </div>
                    <input type="text" class="form-control" placeholder="Description" aria-describedby="basic-addon1" name="txtDescription">
                </div>

                <c:if test="${not empty postError.emptyDescription}">
                    <font color="red"> ${postError.emptyDescription} </font> 
                </c:if>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Image</span>
                    </div>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="inputGroupFile01" name="locationImage">
                        <label class="custom-file-label" for="inputGroupFile01">Choose your Image</label>
                    </div>
                </div>
                <div class="input-group">
                    <textarea class="form-control" aria-label="With textarea" name="txtContent" rows="7"
                              placeholder="Content"></textarea>
                </div>
                <c:if test="${not empty postError.emptyContent}">
                    <font color="red"> ${postError.emptyContent} </font> <br/>
                </c:if>
                <input class="btn btn-light" type="submit" value="Post" name="btnAction">
            </form>
        </div>
    </body>
</html>
