<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="container">
    <!-- TAB NAVIGATION -->
    <c:if test="${not empty messages}">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="col-xs-2">От кого</th>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <th class="col-xs-2">Кому</th>
                        </sec:authorize>
                        <th class="col-xs-2">Дата</th>
                        <th class="col-xs-7">Тема</th>
                        <th class="col-xs-1"></th>
                    </tr>
                    </thead>

                    <c:forEach var="msg" items="${messages}">
                        <tbody>
                        <tr>
                            <td>${msg.sender.username}</td>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <td>${msg.recipient.username}</td>
                            </sec:authorize>
                            <td>${msg.dateTime}</td>
                            <td>${msg.title}</td>
                            <td><a class="btn btn-danger" href="${pageContext.request.contextPath}/messages/del/${msg.id}">Удалить</a></td>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </c:if>
    <div class="row">
        <form:form method="post" action="${pageContext.request.contextPath}/" role="form" modelAttribute="message">
            <div class="row">
                <div class="form-group">
                    <div class="row">
                        <label for="recipientName" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Получатель:</label>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <input name="recipientName" id="recipientName" type="text" class="form-control"
                                   placeholder="Получатель" <c:if test="${not empty user}">value="${user}"</c:if>"
                                   aria-describedby="basic-addon1"/>
                            <c:if test="${not empty recipientError}"><span class="error">${recipientError}</span></c:if>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label for="title" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Тема:</label>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <form:input path="title" id="title" type="text" class="form-control"
                                        placeholder="Тема"
                                        aria-describedby="basic-addon1"/>
                            <form:errors path="title" cssClass="error"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <label for="text" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Имя:</label>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <form:textarea path="text" id="text" rows="4" cols="50" class="form-control"
                                           placeholder="Текст"
                                           aria-describedby="basic-addon1"/>
                            <form:errors path="text" cssClass="error"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <button type="submit" class="btn btn-info">Отправить</button>
                </div>
            </div>
        </form:form>
    </div>
</div>
<%@include file="footer.jsp" %>