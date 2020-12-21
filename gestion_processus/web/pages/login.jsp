<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="../WEB-INF/views/inc/head-tag.jsp">
    <jsp:param name="title" value="GPAdmin"/>
</jsp:include>
<c:set var="message" value='${requestScope["message"]}'/>
<body>

<div class="container">
    <div class="row mt-5 p-5">
        <div class="col d-flex justify-content-center">
            <form action="login" method="post" class="d-block p-5 bg-light shadow border rounded mt-4">
                <div class="form-group">
                    <label for="cin">CIN</label>
                    <input name="cin" type="text" class="form-control" id="cin" aria-describedby="cinHelp" required>
                    <small id="cinHelp" class="form-text text-muted">AD1234 1234 / QA7583 5482 / QA3997 6107</small>
                </div>
                <div class="form-group">
                    <label for="pin">PIN</label>
                    <input name="pin" type="password" class="form-control" id="pin" required>
                </div>
                <div class="form-group form-check">
                    <input name="rememberme" type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember</label>
                </div>
                <input type="submit" value="Login" class="btn btn-block btn-outline-info mx-auto">
            </form>
        </div>
    </div>
</div>

<%@ include file="../WEB-INF/views/inc/footer.jsp" %>
</body>
</html>
