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
	<div class="row">
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<form name='loginForm' action="${pageContext.request.contextPath}/login" method='POST'>
			<div class="row">
				<div class="form-group">
					<div class="row">
						<label for="username" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Имя пользователя:</label>
						<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
							<input name="username" id="username" type="text" class="form-control"
								   placeholder="Имя пользователя" aria-describedby="basic-addon1"/>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<label for="password" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Пароль:</label>
						<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
							<input name="password" id="password" type="password" class="form-control"
										placeholder="Пароль"
										aria-describedby="basic-addon1"/>
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
			<input type="hidden" name="${_csrf.parameterName}"
				   value="${_csrf.token}" />
		</form>
	</div>
</div>
<%@include file="footer.jsp" %>