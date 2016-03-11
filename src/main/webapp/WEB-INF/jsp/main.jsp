<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
    </ul>
</nav>

<div class="container">
    <div class="row">

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


        </div>
    </div>
</div>
<%@include file="footer.jsp" %>