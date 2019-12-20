<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>
<body class="container" onload="openSocket();">
<jsp:include page="header.jsp">
    <jsp:param name="title" value="Home"/>
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
    </c:if> <c:choose>
    <c:when test="${user!=null}">
        <p style="text-align: center">Welcome ${user.getFirstName()}!</p>
        <form method="post" action="Controller?action=LogOut">
            <p>
                <button class="btn btn-primary" type="submit" id="logoutbutton" onclick="openSocket()">Log uit</button>
            </p>
        </form>
    </c:when>
    <c:otherwise>
        <form method="post" action="Controller?action=LogIn" class="form">
            <div class="form-group">
                <label for="email">Email </label>
                <input type="text" class="form-control" id="email" name="email" value="jan@ucll.be">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="t">
            </div>
            <div>
                <button class="btn btn-primary" type="submit" id="loginbutton" onclick="closeSocket()">Log in</button>
            </div>
            <br>
        </form>
        <div>
            <a href="registreren.jsp">Registreer als nieuwe gebruiker</a>
        </div>
        <br>
        <!------------------BLOG------------------->
        <div class="blog">
            <section>
                <h3>Was het een interresante projectweek?</h3>
                <div id="messages1"></div>
                <input type="text" placeholder="naam" id="nameinput1"/>
                <input type="text" placeholder="opmerking" id="messageinput1"/>
                <input type="number" min="0" max="10" placeholder="score" id="scoreinput1"/>
                <p></p>
                <button class="btn btn-primary" type="button" onclick="send1();">Send</button>
            </section>

            <section>
                <h3>Wat ben je van plan te doen vandaag?</h3>
                <div id="messages2"></div>
                <input type="text" placeholder="naam" id="nameinput2"/>
                <input type="text" placeholder="opmerking" id="messageinput2"/>
                <input type="number" min="0" max="10" placeholder="score" id="scoreinput2"/>
                <p></p>
                <button class="btn btn-primary" type="button" onclick="send2();">Send</button>
            </section>

            <section>
                <h3>Wat is je favoriete nummer?</h3>
                <div id="messages3"></div>
                <input type="text" placeholder="naam" id="nameinput3"/>
                <input type="text" placeholder="opmerking" id="messageinput3"/>
                <input type="number" min="0" max="10" placeholder="score" id="scoreinput3"/>
                <p></p>
                <button class="btn btn-primary" type="button" onclick="send3();">Send</button>
            </section>

            <section>
                <h3>Wat is je favoriete kleur?</h3>
                <div id="messages4"></div>
                <input type="text" placeholder="naam" id="nameinput4"/>
                <input type="text" placeholder="opmerking" id="messageinput4"/>
                <input type="number" min="0" max="10" placeholder="score" id="scoreinput4"/>
                <p></p>
                <button class="btn btn-primary" type="button" onclick="send4();">Send</button>
            </section>

            <section>
                <h3>Wat zijn de examenvragen van web4?</h3>
                <div id="messages5"></div>
                <input type="text" placeholder="naam" id="nameinput5"/>
                <input type="text" placeholder="opmerking" id="messageinput5"/>
                <input type="number" min="0" max="10" placeholder="score" id="scoreinput5"/>
                <p></p>
                <button class="btn btn-primary" type="button" onclick="send5();">Send</button>
            </section>
        </div>
        <!------------------BLOG SCRIPT------------------->
        <script type="text/javascript" src="js/blog.js"></script>
        <!------------------BLOG SCRIPT------------------->

        <!------------------BLOG END------------------->

    </c:otherwise>
</c:choose></main>

<jsp:include page="footer.jsp">
    <jsp:param name="title" value="Home"/>
</jsp:include>

</body>
</html>