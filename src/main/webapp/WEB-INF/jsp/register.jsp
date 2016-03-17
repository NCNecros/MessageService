<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
    <form:form method="post" action="${pageContext.request.contextPath}/register" role="form" modelAttribute="user">
        <div class="row">

            <div class="form-group">
                <div class="row">
                    <label for="lastName" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Фамилия:</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <form:input path="lastName" id="lastName" type="text" class="form-control"
                                    placeholder="Фамилия"
                                    aria-describedby="basic-addon1"/>
                        <form:errors path="lastName" cssClass="error"/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">


                    <label for="firstName" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Имя:</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">

                        <form:input path="firstName" id="firstName" type="text" class="form-control" placeholder="Имя"
                                    aria-describedby="basic-addon1"/>
                        <form:errors path="firstName" cssClass="error"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">


                    <label for="surName" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Отчество</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <form:input path="surName" id="surName" type="text" class="form-control" placeholder="Отчество"
                                    aria-describedby="basic-addon1"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">


                    <label for="username" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Логин</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <form:input path="username" id="username" type="text" class="form-control" placeholder="Логин"
                                    aria-describedby="basic-addon1"/>
                        <form:errors path="username" cssClass="error"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">


                    <label for="password" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Пароль</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <form:input path="password" id="password" type="password" class="form-control"
                                    placeholder="Пароль"
                                    aria-describedby="basic-addon1"/>
                        <form:errors path="password" cssClass="error"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <label for="email" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">E-mail</label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <form:input path="email" id="email" type="text" class="form-control" placeholder="E-Mail"
                                    aria-describedby="basic-addon1"/>
                        <form:errors path="email" cssClass="error"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <button type="submit" class="btn btn-info">Регистрация</button>

            </div>
        </div>
    </form:form>

</div>
<%@include file="footer.jsp" %>