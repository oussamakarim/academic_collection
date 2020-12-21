<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="typeMessage" value='${requestScope["typeMessage"]}'/>
<c:set var="msg" value="${requestScope[\"msg\"]}"/>
<!doctype html>
<html lang="en">
<jsp:include page="../WEB-INF/views/inc/head-tag.jsp">
    <jsp:param name="title" value="Message"/>
</jsp:include>
<body>
<c:choose>
    <c:when test='${typeMessage.equals("success")}'>
        <div class="container-fluid bg-success text-light center">
            <div class="jumbotron bg-success text-center text-light">
                <h1>Succes</h1>
                <h2 class="text-light">
                    <c:out value="${msg}"/>
                </h2>
            </div>
        </div>
    </c:when>

    <c:otherwise>
        <div class="container-fluid bg-danger text-light center">
            <div class="jumbotron bg-danger text-center text-light">
                <h1>Error</h1>
                <p>Sorry An Error Has Occured <br> Try Revisiting The Website</p>
                <h2 class="text-light">
                    <c:out value="${msg}"/>
                </h2>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="../WEB-INF/views/inc/footer.jsp"/>

</body>
</html>