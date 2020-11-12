<%-- 
    Document   : ViewPost
    Created on : Sep 21, 2020, 11:37:32 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW POST PAGE</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
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
        <font style="color: blue; margin: 75px"> Welcome ${name} </font> 
        <c:set var="post" value="${requestScope.POST}" />

        <div class="card w-75" style="margin-left: 75px">
            <h4 class="card-header"> ${post.title}</h4>
            <h5 class="card-header"> <small class="text-muted">by ${post.email}</small></h5>
            <div class="card-body">
                <p class="card-text">${post.description}</p>
                <c:if test="${not empty post.image}">
                    <img class="card-img-top" src="file:///C:/Users/DELL/Pictures/Saved%20Pictures/ie.jpg" style="width: 400px">
                </c:if>
                <p class="card-text">${post.content}</p>
                <p class="card-text"><small class="text-muted">${post.dayPost}</small></p>
            </div>
        </div>

        <div style="margin-left: 75px">
            <a href="ServletDispatcher?btnAction=btnLike&reaction=like&txtPostID=${requestScope.POSTID}">
                <i class="far fa-thumbs-up" style="color: red"></i></a>
                ${requestScope.LIKE}
            <a href="ServletDispatcher?btnAction=btnDislike&reaction=dislike&txtPostID=${requestScope.POSTID}">
                <i class="far fa-thumbs-down" style="color: red"></i></a>
                ${requestScope.DISLIKE}
        </div>

        <form class="form-inline" action="ServletDispatcher" method="POST" style="margin-left: 75px">
            <input type="hidden" name="txtEmail" value="${post.email}" />
            <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
            <input type="hidden" name="txtPostID" value="${requestScope.POSTID}" />
            <div class="form-group mx-sm-3 mb-2">
                <label class="sr-only">Comment</label>
                <input type="text" class="form-control" placeholder="Write your comment..." name="txtComment" style="width: 300px">
            </div>
            <input class="btn btn-primary" type="submit" value="Comment" name="btnAction">
            <c:if test="${post.email eq sessionScope.EMAIL}">
                <input class="btn btn-primary" type="submit" value="Delete Your Post" name="btnAction" onclick="return confirmDelete()" 
                       style="margin-left: 30px"/>
            </c:if>
        </form>


        <h5 style="margin-left: 75px">Comment</h5>    
        <c:set var="listComment" value="${requestScope.COMMENT}"/>
        <c:if test="${empty listComment}">
            No one comment on this post
        </c:if>
        <c:forEach var="comment" items="${listComment}" varStatus="counter">
            <form action="ServletDispatcher" method="POST" >
                <input type="hidden" name="txtCommentID" value="${comment.commentID}" />
                <div class="card w-75" style="margin-left: 75px">
                    <h5 class="card-header">${comment.name} <input type="hidden" name="txtEmailComment" value="${comment.email}" /></h5>
                    <div class="card-body">
                        <input type="hidden" name="txtPostID" value="${requestScope.POSTID}" />                     
                        <p class="card-text">${comment.content}</p>
                        <c:if test="${sessionScope.EMAIL eq comment.email}">
                            <input class="btn btn-primary" type="submit" value="Delete Your Comment" name="btnAction" onclick="return confirmDelete()"/>
                        </c:if>
                    </div>
                </div>
            </form>
            <br/>           
        </c:forEach>

        <script>
                                function confirmDelete() {
                                    if (confirm("Are you sure you want to continue ?")) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }
        </script>

    </body>
</html>
