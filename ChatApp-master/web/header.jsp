<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header" role="banner">
    <div class="banner">
        <img alt="banner" src="images/chat_banner.png">
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div id="navbarNav">
            <ul class="navbar-nav">
                <c:if test="${param.title=='Home'}">
                    <li class="nav-item active">
                        <a class="nav-link" href="Controller">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?action=Chat">Chat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registreren.jsp">Registreren</a>
                    </li>
                </c:if>
                <c:if test="${param.title=='Chat'}">
                    <li class="nav-item">
                        <a class="nav-link" href="Controller">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Controller?action=Chat">Chat <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registreren.jsp">Registreren</a>
                    </li>
                </c:if>
                <c:if test="${param.title=='Registreren'}">
                    <li class="nav-item">
                        <a class="nav-link" href="Controller">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Controller?action=Chat">Chat</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="registreren.jsp">Registreren <span class="sr-only">(current)</span></a>
                    </li>
                </c:if>

            </ul>
        </div>
    </nav>

    <h2 style="text-align: center" class="page-header">
        ${param.title}
    </h2>

</header>