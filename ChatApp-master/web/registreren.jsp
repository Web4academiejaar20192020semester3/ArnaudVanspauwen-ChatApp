<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Registreren"/>
</jsp:include>
<body class="container" onload="openSocket();">
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Registreren"/>
</jsp:include>
<main>
    <c:if test="${errors.size()>0 }">
        <div class="danger">
            <ul>
                <c:forEach var="error" items="${errors }">
                    <li>${error }</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
        <form method="post" action="Controller?action=Registreren" class="login">
            <div class="form-group">
                <label for="email">Email </label>
                <input class="form-control" type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="firstname">Voornaam </label>
                <input class="form-control" type="text" id="firstname" name="firstname">
            </div>
            <div class="form-group">
                <label for="lastname">Familienaam </label>
                <input class="form-control" type="text" id="lastname" name="lastname">
            </div>
            <div class="form-group">
                <label for="age">Leeftijd</label>
                <input class="form-control" type="number" id="age" name="age">
            </div>
            <div class="form-group">
                <label for="gender">Geslacht</label>
                <input class="form-control" type="text" id="gender" name="gender">
            </div>
            <div class="form-group">
                <label for="password">paswoord</label>
                <input class="form-control" type="password" id="password" name="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Bevestig paswoord</label>
                <input class="form-control" type="password" id="confirm_password" name="confirm_password">
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit" id="registerbutton">Maak account aan</button>
            </div>
        </form>
</main>

<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

</body>
</html>