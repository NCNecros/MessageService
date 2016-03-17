<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="modal_form">
    <div class="row">
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
            <span>Сменить пароль</span>
        </div>
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
            <span id="modal_close">X</span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="form-group">
                    <div class="row">
                        <label for="oldPassword" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Старый пароль:</label>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <input name="oldPassword" id="oldPassword" type="text" class="form-control"
                                   placeholder="Старый пароль" aria-describedby="basic-addon1"/>
                            <span class="error"></span>
                        </div>
                    </div>
                    <div class="row">
                        <label for="newPassword" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Новый пароль:</label>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <input name="newPassword" id="newPassword" type="text" class="form-control"
                                   placeholder="Новый пароль" aria-describedby="basic-addon1"/>
                            <span class="error"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5"></div>
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <a href="#" class="btn btn-info">Отправить</a>
                        </div>
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5"></div>
                    </div>
                    <input id="_csrf_token" type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />
                </div>

        </div>
    </div>
</div>
<div id="overlay"></div>

</body>
</html>