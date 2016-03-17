<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="container">
    <c:if test="${not empty addressBooks}">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table class="table table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>Имя пользователя</th>
                        <th>Примечание</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${addressBooks}">
                        <tr>
                            <td>${user.user.username}</td>
                            <td>${user.description}</td>
                            <td><a class="btn btn-info" href="${pageContext.request.contextPath}/?user=${user.user.username}">Написать</a></td>
                            <td><a class="btn btn-danger"href="${pageContext.request.contextPath}/addressbook/del/${user.id}">Удалить</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <form:form method="post" action="${pageContext.request.contextPath}/addressbook/add" role="form">
                <div class="row">

                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <div class="row">
                            <label for="user" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">Имя
                                пользователя:</label>
                            <c:if test="${not empty userError}"><span class="error">${userError}</span></c:if>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="row">
                            <label for="description"
                                   class="col-xs-12 col-sm-12 col-md-12 col-lg-12">Примечание:</label>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input name="user" id="user" type="text" class="form-control"
                               placeholder="Имя пользователя"
                               aria-describedby="basic-addon1"/>

                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <input name="description" id="description" type="text" class="form-control"
                               placeholder="Примечание"
                               aria-describedby="basic-addon1"/>

                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <button type="submit" class="btn btn-info">Отправить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

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