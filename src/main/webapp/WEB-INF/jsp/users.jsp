<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="container">
    <c:if test="${not empty users}">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table class="table table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>Имя пользователя</th>
                        <th>Email</th>
                        <th>Логин</th>
                        <th>Роли</th>
                        <th>Админ</th>
                        <th>Удалить</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <c:set var="isAdmin" value="false"/>
                        <tr>
                            <td>${user.fio}</td>
                            <td>${user.email}</td>
                            <td>${user.username}</td>
                            <td>
                                <c:forEach var="role" items="${usersRoles[user.username]}">
                                    <c:if test="${role.userrole == 'ROLE_ADMIN'}"><c:set var="isAdmin"  value="true"/></c:if>
                                    <span class="label label-info">${role.userrole}</span>
                                </c:forEach>
                            </td>
                            <c:if test="${isAdmin==true}"><td><a class="btn btn-danger" href="${pageContext.request.contextPath}/rights/del/${user.username}">Удалить права</a></td></c:if>
                            <c:if test="${isAdmin==false}"><td><a class="btn btn-info" href="${pageContext.request.contextPath}/rights/add/${user.username}">Дать права</a></td></c:if>
                            <td></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>


    <%--<div class="row">--%>
    <%--<form:form method="post" action="/" role="form" modelAttribute="message">--%>
    <%--<div class="row">--%>
    <%--<div class="form-group">--%>

    <%--<div class="row">--%>
    <%--<label for="recipientName" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Получатель:</label>--%>
    <%--<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">--%>
    <%--<input name="recipientName" id="recipientName" type="text" class="form-control"--%>
    <%--placeholder="Получатель"--%>
    <%--aria-describedby="basic-addon1"/>--%>
    <%--<c:if test="${not empty recipientError}"><span class="error">${recipientError}</span></c:if>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--<div class="form-group">--%>
    <%--<div class="row">--%>
    <%--<label for="title" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Тема:</label>--%>
    <%--<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">--%>
    <%--<form:input path="title" id="title" type="text" class="form-control"--%>
    <%--placeholder="Тема"--%>
    <%--aria-describedby="basic-addon1"/>--%>
    <%--<form:errors path="title" cssClass="error"/>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<div class="row">--%>
    <%--<label for="text" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Имя:</label>--%>
    <%--<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">--%>

    <%--<form:textarea path="text" id="text" rows="4" cols="50" class="form-control"--%>
    <%--placeholder="Текст"--%>
    <%--aria-describedby="basic-addon1"/>--%>
    <%--<form:errors path="text" cssClass="error"/>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
    <%--<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">--%>
    <%--</div>--%>
    <%--<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">--%>
    <%--<button type="submit" class="btn btn-info">Отправить</button>--%>

    <%--</div>--%>
    <%--</div>--%>
    <%--</form:form>--%>
    <%--</div>--%>

</div>
<%@include file="footer.jsp" %>