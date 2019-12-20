<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<jsp:include page="head.jsp">
    <jsp:param name="title" value="Chat App"/>
</jsp:include>

<jsp:include page="header.jsp">
    <jsp:param name="title" value="Chat"/>
</jsp:include>

<body class="container" onload="run()">

<main>
    <c:if test="${errors.size()>0 }">
        <div class="danger">
            <ul>
                <c:forEach var="error" items="${errors}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
    <div>
        <div class="form-group">
        <p>STATUS:</p>
        <p id="stateDiv" style="font-size: 40px; color: #007BFF"></p>
        </div>
        <br>
        <p>VRIENDEN:</p>
        <table class="table-sm table-striped table-bordered table-hover" id="friendlist"></table>
        <div id="messages"></div>
        <div class="form-group">
            <label for="stateText">Change State</label>
            <input type="text" class="form-control" id="stateText">
            <br>
            <button type="submit" class="btn btn-primary" id="statebutton">Change</button>
        </div>
        <br>
        <div class="form-group">
            <label for="friendText">Add Friend</label>
            <input type="text" class="form-control" id="friendText">
            <br>
            <button type="submit" class="btn btn-primary" id="friendbutton">Add</button>
        </div>
    </div>


</main>
<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/chat.js"></script>
<script type="text/javascript" src="js/chatten.js"></script>
</body>
</html>