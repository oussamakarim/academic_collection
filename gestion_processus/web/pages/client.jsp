<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="metier.enumeration.EtatDemande" %>
<c:set var="client" value='${requestScope["client"]}' />
<c:set var="demande" value='${requestScope["demande"]}' />
<html>
<jsp:include page="../WEB-INF/views/inc/head-tag.jsp">
    <jsp:param name="title" value="Suivi De Demande"/>
</jsp:include>
<body>
    <!-- Navbar -->
    <jsp:include page="../WEB-INF/views/inc/navbar.jsp"/>

    <div class="container bg-light shadow border rounded">
        <div class="row py-4">
            <!-- Client Information -->
            <div class="col-sm-3">
                <div class="card shadow rounded">
                    <div class="card-header w-100 bg-dark text-light">
                        <h4>Client Information</h4>
                    </div>
                    <div class="card-body w-100">
                        <p><b>Cin: </b><c:out value="${client.getCin()}"/></p>
                        <p><b>Nom: </b><c:out value="${client.getNom()}"/></p>
                        <p><b>Prenom:</b><c:out value="${client.getPrenom()}" /></p>
                        <p><b>Demande: </b><c:out value="${client.getNombreDemande()}" /> Demandes</p>
                    </div>
                </div>
            </div>
            <!-- demande information -->
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-4">
                        <p><span class="badge badge-success">Demande</span>
                            <c:out value="${demande.getJeton()}" /></p>
                    </div>
                    <div class="col-4">
                        <p><span class="badge badge-success">Procedure</span>
                            <c:out value="${demande.getLibelle()}" /></p>
                    </div>
                    <div class="col-4">
                        <p><span class="badge badge-success">Date Ouverture</span>
                            <c:out value="${demande.getDateOuverture()}" /></p>
                    </div>
                </div>

                <!-- demande content -->
                <c:choose>

                    <c:when test='${demande.getEtat().toString().equals("ACCEPTE")}'>
                        <c:set var="processus" value="${demande.getProcessus()}" />

                        <!-- etape courante -->
                        <div class="row">
                            <div class="col">
                                <h4 class="text-info">Etape En Cours</h4>
                                <br>
                                <div class="progress">
                                    <c:set var="avancement" value="${processus.getAvancementRatio()}" />
                                    <div class="progress-bar" style="width:<c:out value="${avancement}" />%">
                                        Avancement <c:out value="${avancement}" /> %
                                    </div>
                                </div>
                                <br>
                                <c:choose>
                                    <c:when test="${processus.getEtapeCourante() != null}">
                                        <p><b class="text-secondary">Nom: </b>
                                            <c:out value="${processus.getEtapeCourante().getLibelle()}"/>
                                        </p>
                                        <p><b class="text-secondary">Etat: </b>
                                            <c:out value="${processus.getEtapeCourante().getEtat()}"/>
                                        </p>
                                        <p><b class="text-secondary">Date Debut:
                                        </b><c:out value="${processus.getEtapeCourante().getDateDebut()}"/>
                                        </p>
                                        <br>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-danger"><span class="badge badge-warning">Avertissement</span>
                                            Le Deroulement de votre processus est bloque, veuillez ajouter les documents necessaire.
                                        </p>
                                        <form action="uploadfile" method="post" enctype='multipart/form-data'>
                                            <div class="form-group d-inline-block">
                                                <input type="text" class="d-none" name="jeton" value="<c:out value="${demande.getJeton()}" />">
                                                <label for="uploadfile">Uploader une fichier</label>
                                                <input type="file" class="form-control-file" id="uploadfile">
                                            </div>
                                            <input type="submit" value="upload" class="btn btn-outline-dark px-4">
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-5">
                                <table class="table table-hover shadow rounded">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th>Etape Valide</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${processus.getFinishedEtape()}" var="etape">
                                        <tr>
                                            <td>
                                                <b>Nom: </b> <c:out value="${etape.getLibelle()}" /> <br>
                                                <b>Debut: </b> <c:out value="${etape.getDateDebut()}" /> <br>
                                                <b>Fin: </b> <c:out value="${etape.getDateFin()}" /> <br>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>


                            <div class="offset-1 col-5">
                                <table class="table table-hover shadow rounded">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th>Etape Non Valide</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${processus.getInactiveEtape()}" var="etape">
                                            <tr>
                                                <td>
                                                    <b>Nom: </b> <c:out value="${etape.getLibelle()}" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>

                    <c:when test='${demande.getEtat().toString().equals("REFUSE")}'>
                        <h2>Desole, votre demande a ete <b class="text-danger">refuse</b> par nos administrateurs</h2>
                        <h3>Merci pour votre comprehension</h3>
                        <p class="text-info">Le Jeton de cette demande sera inaccissible apres 07 jours</p>
                    </c:when>

                    <c:when test='${demande.getEtat().toString().equals("ATTENTE")}'>
                        <h2>Votre demande est <b>en cours de revision</b> par nos administrateurs</h2>
                        <h3>Merci pour votre patience</h3>
                    </c:when>

                    <c:otherwise>
                        <c:redirect url="msg.jsp" />
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="../WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
