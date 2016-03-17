<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.mask.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/my.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/my.css" rel="stylesheet"/>
<body>
<script>
    var contextPath = "<%=request.getContextPath()%>";
</script>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <ul class="nav navbar-nav">
        <sec:authorize access="isAuthenticated()">
            <li class="">
                <a href="${pageContext.request.contextPath}/">Сообщения</a>
            </li>
            <li class="">
                <a href="${pageContext.request.contextPath}/addressbook">Адресная книга</a>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li class="">
                <a href="${pageContext.request.contextPath}/user">Пользователи</a>
            </li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <li class="">
                <a href="${pageContext.request.contextPath}/logout">Выход</a>
            </li>
            <li class="">
                <a id="go" href="#">Сменить пароль</a>
            </li>
        </sec:authorize>
        <sec:authorize access="isAnonymous()">
            <li class="">
                <a href="${pageContext.request.contextPath}/register">Регистрация</a>
            </li>
            <li class="">
                <a href="${pageContext.request.contextPath}/login">Вход</a>
            </li>
        </sec:authorize>
    </ul>
</nav>