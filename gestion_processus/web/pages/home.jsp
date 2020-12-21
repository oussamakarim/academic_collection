<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<c:set var="catalogue" value="${requestScope['catalogue']}"/>
<!DOCTYPE html>
<html>
<jsp:include page="../WEB-INF/views/inc/head-tag.jsp" >
    <jsp:param name="title" value="Home Page"/>
</jsp:include>

<body>
<!-- Navbar -->
<jsp:include page="../WEB-INF/views/inc/navbar.jsp"/>

<!-- content -->
<div class="container bg-light shadow border rounded py-4 mb-4">
    <div class="row">
        <div class="col text-center">
            <h1 class="text-info">GPAdmin</h1>
            <p>GPAdmin est une platforme de gestion de processus administrative. <br>
                Elle vour permet de suivre le deroulement de vos demande en temps reel, se communiquer avec nos
                services, fournir vos documents ...
            </p>
        </div>
    </div>
    <div id="cards" class="row mt-4">
        <!-- Les Boutton de choix -->
        <button id="createCard" type="button"
                class="card offset-sm-1 col-sm-4 shadow bg-success rounded-large text-light text-center">
            <h1>Creer Une Nouvelle Demande</h1>
        </button>

        <button id="followCard" type="button"
                class="card offset-sm-2 col-sm-4 shadow bg-danger rounded-large text-light text-center">
            <h1>Suivre Une Demande</h1>
        </button>
    </div>

    <!-- creer une demande  -->
    <div id="createInput" class="row mt-4">
        <div class="offset-1 col-10 bg-light shadow border border-success rounded py-4">
            <div class="row">
                <div class="col-10">
                    <h1>Nouvelle Demande</h1>
                </div>
                <div class="offset-1 col-1 btn center"><img class="backbutton" src="res/icons/back.png" alt="close"
                                                            class="btn"></div>
            </div>
            <div class="row">
                <!-- formulaire -->
                <div class="col">
                    <form action="create" method="POST" enctype="multipart/form-data">
                        <div class="from-group my-2 w-50 mx-auto">
                            <label>Nom <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" placeholder="Nom" name="nom">
                        </div>
                        <div class="form-group my-2 w-50 mx-auto">
                            <label>Prenom <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" placeholder="Prenom" name="prenom">
                        </div>
                        <div class="form-group my-2 w-50 mx-auto">
                            <label>CIN <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" placeholder="CIN" name="cin">
                        </div>
                        <div class="form-group my-2 w-50 mx-auto">
                            <label for="catalogue">Procedures: <span class="text-danger">*</span></label>
                            <select name="catalogue" id="catalogue" class="form-control">
                                <c:forEach var="cat" items="${catalogue}">
                                    <option value='<c:out value="${cat.getCatalogueProcessusEntity().getId()}" />'>
                                        <c:out value="${cat.getCatalogueProcessusEntity().getLibelle()}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group my-2 w-50 mx-auto">
                            <label>Documents:</label>
                            <input type="file" class="form-control-file" name="file" multiple>
                        </div>
                        <div class="d-flex">
                            <input type="submit" class="d-inline-block btn btn-success mx-auto w-50" value="valider">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- suivre une demande -->
    <div id="followInput" class="row mt-4">
        <div class="offset-1 col-10 bg-light shadow border border-danger rounded py-4">
            <div class="row">
                <div class="col-10">
                    <h1>Suivre Une Demande</h1>
                </div>
                <div class="offset-1 col-1 btn center"><img class="backbutton" src="res/icons/back.png" alt="close"
                                                            class="btn"></div>
            </div>
            <div class="row">
                <!-- formulaire -->
                <div class="col py-2">
                    <form action="follow" method="POST">
                        <div class="form-group w-50 mx-auto">
                            <label for="cin">Votre CIN: <span class="text-danger">*</span></label> <br>
                            <input type="text" id="cin" class="form-control" name="cin">
                        </div>
                        <div class="form-group w-50 mx-auto">
                            <label for="jeton">Entrer Le Jeton de votre demandes: <span
                                    class="text-danger">*</span></label>
                            <input id="jeton" type="text" name="jeton" class="form-control">
                        </div>
                        <div class="d-flex">
                            <input type="submit" class="d-inline-block btn btn-danger mx-auto w-50" value="chercher">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="../WEB-INF/views/inc/footer.jsp" />
</body>

</html>