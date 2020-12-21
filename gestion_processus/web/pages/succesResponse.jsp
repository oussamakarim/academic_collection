<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="errorMessage" value="${requestScope[\"errorMessage\"]}"/>
<!doctype html>
<html lang="en">
<jsp:include page="../WEB-INF/views/inc/head-tag.jsp">
    <jsp:param name="title" value="Jeton"/>
</jsp:include>
<body>
<div class="container-fluid bg-sucess text-light center">
    <div class="jumbotron bg-danger text-center text-light">
        <h1>Error</h1>
        <p>Sorry An Error Has Occured <br> Try Revisiting The Website</p>
        <h2 class="text-light">
            <c:out value="${errorMessage}"/>
        </h2>
    </div>
</div>
<jsp:include page="../WEB-INF/views/inc/footer.jsp"/>
</body>
</html>