<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <ul class="nav navbar-nav">
        <li class="active">
            <a href="/searchfio">Поиск по полису</a>
        </li>
        <li>
            <a href="/searchpolis">Поиск по ФИО</a>
        </li>
        <li>
            <a href="/searchnewpolis">Поиск нового полиса по старому</a>
        </li>

        <li class="">
            <a href="/logout">Выход</a>
        </li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li>Пользователи</li>
        </sec:authorize>
    </ul>
</nav>

<div class="container">
    <!-- TAB NAVIGATION -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#tab1" role="tab" data-toggle="tab">Сообщения</a></li>
        <li><a href="#tab2" role="tab" data-toggle="tab">Адресная книга</a></li>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="#tab3" role="tab" data-toggle="tab">Пользователи</a></li>
        </sec:authorize>
    </ul>
    <!-- TAB CONTENT -->
    <div class="tab-content">
        <div class="active tab-pane fade in" id="tab1">
            <c:if test="${not empty messages}">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Тема</th>
                                <th>Отправитель</th>
                            </tr>
                            </thead>

                            <c:forEach var="msg" items="${messages}">
                                <tbody>
                                <tr>
                                    <td>${msg.title}</td>
                                    <td>${msg.sender.username}</td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>

            </c:if>
        </div>
        <div class="tab-pane fade" id="tab2">
            <h2>Tab2</h2>
            <p>Lorem ipsum.</p>
        </div>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <div class="tab-pane fade" id="tab3">
                <h2>Tab3</h2>
                <p>Lorem ipsum.</p>
            </div>
        </sec:authorize>
    </div>

    <form:form method="post" action="/" role="form" modelAttribute="message">


        <div class="row">
            <div class="form-group">

                <div class="row">
                    <label for="recipientName" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Получатель:</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <input name="recipientName" id="recipientName" type="text" class="form-control"
                               placeholder="Получатель"
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

                        <form:textarea path="text" id="text" rows="4" cols="50" class="form-control" placeholder="Текст"
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
<%@include file="footer.jsp" %>