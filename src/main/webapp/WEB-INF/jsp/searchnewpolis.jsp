<%@include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>Поиск нового полиса по старому</title>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <ul class="nav navbar-nav">
        <li class="">
            <a href="/searchfio">Поиск по полису</a>
        </li>
        <li>
            <a href="/searchpolis">Поиск по ФИО</a>
        </li>
        <li class="active">
            <a href="/searchnewpolis">Поиск нового полиса по старому</a>
        </li>

        <li class="">
            <a href="/login?logout">Выход</a>
        </li>
    </ul>
</nav>

<div class="container">
    <div class="row">

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <form:form method="post" action="/searchnewpolis" modelAttribute="polis">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">Серия полиса</span>
                    <form:input path="serial" type="text" class="form-control" placeholder="Серия полиса"
                                aria-describedby="basic-addon1"/>
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">Номер полиса</span>
                    <form:input path="number" type="text" class="form-control" placeholder="Номер полиса"
                                aria-describedby="basic-addon1"/>
                </div>
                <input type="submit" value="Найти">
            </form:form>

            <c:if test="${not empty human}">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <h4>${human.fam}</h4>

                        <h4>${human.name}</h4>

                        <h4>${human.otch}</h4>

                        <h4>${human.birthDate}</h4>
                        <c:if test="${not empty correctPolis}">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>СМО</th>
                                            <th>Тип документа</th>
                                            <th>Серия</th>
                                            <th>Номер</th>
                                            <th>Начало действия</th>
                                            <th>Окончание действия</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr style="background-color: lightgreen ">
                                            <td>${correctPolis.smo}</td>
                                            <td>${correctPolis.type}</td>
                                            <td>${correctPolis.serial}</td>
                                            <td>${correctPolis.number}</td>
                                            <td>${correctPolis.date}</td>
                                            <td>${correctPolis.dateEnd}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty uncorrectPolisList}">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>СМО</th>
                                            <th>Тип документа</th>
                                            <th>Серия</th>
                                            <th>Номер</th>
                                            <th>Начало действия</th>
                                            <th>Окончание действия</th>
                                            <th>Причина погашения</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="polis" items="${uncorrectPolisList}">
                                            <tr STYLE="background-color: rgba(255, 0, 15, 0.27)">
                                                <td>${polis.smo}</td>
                                                <td>${polis.type}</td>
                                                <td>${polis.serial}</td>
                                                <td>${polis.number}</td>
                                                <td>${polis.date}</td>
                                                <td>${polis.dateEnd}</td>
                                                <td>${polis.prich}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>