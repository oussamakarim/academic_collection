<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="session" var="employe" value="${sessionScope['user']}"/>
<c:set var="catEtapes" value="${requestScope['catEtapes']}"/>
<c:set var="etapesMap" value="${requestScope['etapesMap']}"/>
<c:set var="procs" value="${requestScope['procs']}" />
<c:set var="catalogueEtape" value="${requestScope['catalogueEtape']}" />
<c:set var="employees" value="${requestScope['employees']}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${employe.getNom()} ${employe.getPrenom()}" /></title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="res/css/chef.css">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <svg class="bi bi-house-door mr-3" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                 xmlns="http://www.w3.org/2001/svg">
                <path fill-rule="evenodd"
                      d="M7.646 1.146a.5.5 0 01.708 0l6 6a.5.5 0 01.146.354v7a.5.5 0 01-.5.5H9.5a.5.5 0 01-.5-.5v-4H7v4a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-7a.5.5 0 01.146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 01.5-.5h3a.5.5 0 01.5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"
                      clip-rule="evenodd"/>
                <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 01.5-.5h1a.5.5 0 01.5.5z"
                      clip-rule="evenodd"/>
            </svg>
            GPAdmin
        </a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="nav-link text-light">Hi <c:out value="${employe.getFullName()}"/> !</span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid bg-gray">
    <div class="row">
        <div id="sidebar" class="col-sm-2 sticy-left p-0">
            <button id="profile-button" class="btn btn-block">
                <svg class="bi bi-person-plus mr-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 00.014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 00.022.004zm9.974.056v-.002.002zM6 7a2 2 0 100-4 2 2 0 000 4zm3-2a3 3 0 11-6 0 3 3 0 016 0zm4.5 0a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 010-1H13V5.5a.5.5 0 01.5-.5z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd" d="M13 7.5a.5.5 0 01.5-.5h2a.5.5 0 010 1H14v1.5a.5.5 0 01-1 0v-2z"
                          clip-rule="evenodd"/>
                </svg>
                Profile
            </button>
            <button id="etapes-button" class="btn btn-block">
                <svg class="bi bi-folder-plus mr-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M9.828 4H2.19a1 1 0 00-.996 1.09l.637 7a1 1 0 00.995.91H9v1H2.826a2 2 0 01-1.991-1.819l-.637-7a1.99 1.99 0 01.342-1.31L.5 3a2 2 0 012-2h3.672a2 2 0 011.414.586l.828.828A2 2 0 009.828 3h3.982a2 2 0 011.992 2.181L15.546 8H14.54l.265-2.91A1 1 0 0013.81 4H9.828zm-2.95-1.707L7.587 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 011-.98h3.672a1 1 0 01.707.293z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M13.5 10a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 010-1H13v-1.5a.5.5 0 01.5-.5z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd" d="M13 12.5a.5.5 0 01.5-.5h2a.5.5 0 010 1H14v1.5a.5.5 0 01-1 0v-2z"
                          clip-rule="evenodd"/>
                </svg>
                Gerer Etape
            </button>
            <button id="procedures-button" class="btn btn-block custom-btn sidebar-btn">
                <svg class="bi bi-bag" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M14 5H2v9a1 1 0 001 1h10a1 1 0 001-1V5zM1 4v10a2 2 0 002 2h10a2 2 0 002-2V4H1z"
                          clip-rule="evenodd"/>
                    <path d="M8 1.5A2.5 2.5 0 005.5 4h-1a3.5 3.5 0 117 0h-1A2.5 2.5 0 008 1.5z"/>
                </svg>
                Gerer Procedure
            </button>
            <button id="demandes-button" class="btn btn-block custom-btn sidebar-btn">
                <svg class="bi bi-envelope-open" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M.243 6.929l.514-.858L8 10.417l7.243-4.346.514.858L8 11.583.243 6.93z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M7.184 10.68L.752 14.432l-.504-.864L6.68 9.816l.504.864zm1.632 0l6.432 3.752.504-.864L9.32 9.816l-.504.864z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M8.47 1.318a1 1 0 00-.94 0l-6 3.2A1 1 0 001 5.4V14a1 1 0 001 1h12a1 1 0 001-1V5.4a1 1 0 00-.53-.882l-6-3.2zM7.06.435a2 2 0 011.882 0l6 3.2A2 2 0 0116 5.4V14a2 2 0 01-2 2H2a2 2 0 01-2-2V5.4a2 2 0 011.059-1.765l6-3.2z"
                          clip-rule="evenodd"/>
                </svg>
                Gerer demande
            </button>

            <button class="btn btn-block"><a class="unstyled-link" href='logout'>
                <svg class="bi bi-reply-all mr-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M8.002 5.013a.144.144 0 00-.202.134V6.3a.5.5 0 01-.5.5c-.667 0-2.013.005-3.3.822-.984.624-1.99 1.76-2.595 3.876C2.425 10.515 3.59 9.982 4.61 9.7a8.741 8.741 0 011.921-.306 7.403 7.403 0 01.798.008h.013l.005.001h.001L7.3 9.9l.05-.498a.5.5 0 01.45.498v1.153c0 .108.11.176.202.134l3.984-2.933a.494.494 0 01.042-.028.147.147 0 000-.252.494.494 0 01-.042-.028L8.002 5.013zM6.8 10.386a7.745 7.745 0 00-1.923.277c-1.326.368-2.896 1.201-3.94 3.08a.5.5 0 01-.933-.305c.464-3.71 1.886-5.662 3.46-6.66 1.245-.79 2.527-.942 3.336-.971v-.66a1.144 1.144 0 011.767-.96l3.994 2.94a1.147 1.147 0 010 1.946l-3.994 2.94a1.144 1.144 0 01-1.767-.96v-.667z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M10.868 4.293a.5.5 0 01.7-.106l3.993 2.94a1.147 1.147 0 010 1.946l-3.994 2.94a.5.5 0 01-.593-.805l4.012-2.954a.493.493 0 01.042-.028.147.147 0 000-.252.496.496 0 01-.042-.028l-4.012-2.954a.5.5 0 01-.106-.699z"
                          clip-rule="evenodd"/>
                </svg>
                Logout
            </a></button>
        </div>
        <div class="col-sm-10">
            <div class="container mt-3 py-0 bg-gray">

                <div id="profile-section" class="row">
                    <div class="col-sm-4">
                        <div class="card border rounded shadow">
                            <img src="res/img/user.png" alt="profile image" class="card-img-top">
                            <div class="card-body">
                                <h4 class="font-weight-bold text-center"><c:out value="${employe.getFullName()}"/></h4>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Nom</span>
                                    <span class="text-center"><c:out value="${employe.getNom()}"/> </span>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Prenom</span>
                                    <span class="text-center"><c:out value="${employe.getPrenom()}"/></span>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Cin</span>
                                    <span class="text-center"><c:out value="${employe.getCin()}"/></span>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Poste</span>
                                    <span class="text-center">Chef</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="offset-sm-1 col-sm-6 rounded">
                        <div class="card shadow border">
                            <c:choose>
                                <c:when test="${catEtapes.size() > 0}">
                                    <div class="card-header bg-gray text-primary text-center">
                                        <div>
                                            <span class="badge badge-primary float-right">Total: <c:out
                                                    value="${catEtapes.size()}"/></span>
                                            <p class="font-weight-bold">Le Catalogue des etapes qui vous sont
                                                affecte</p>
                                            <p class="text-dark">(Basculez pour voir plus)</p>
                                        </div>
                                    </div>
                                    <div class="card-body bg-transparent p-0">
                                        <ul id="liste-etape" class="list-group bg-transparent m-0">
                                            <c:forEach items="${catEtapes}" var="catEtape">
                                                <li class="list-group-item text-center bg-transparent"><c:out
                                                        value="${catEtape.getLibelle()}"/></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-header">
                                        <h4 class="text-danger">L'Admin n'as pas assigner aucune etape pour vous</h4>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>

                <div id="etapes-section" class="row m-0">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <div class="d-flex justify-content-center">
                                    <div class="card">
                                        <div class="card-header bg-white">
                                            <p class="text-dark"><span
                                                    class="font-weight-bold text-primary">Hint:</span>
                                                Selectionnez une Etape puis une instance d'un client (Faites les
                                                modifications necessaire)
                                            </p>
                                            <p class="text-primary" id="connection">Connecting .....</p>
                                            <p class="text-danger" id="error">Error Getting Data !!!</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row mt-3">

                            <c:choose>
                                <c:when test="${etapesMap.size() > 0}">
                                    <!-- etape side bar -->
                                    <div class="col-sm-3 m-0 p-0">
                                        <nav id="etapes-sidbar" class="nav flex-column m-0 p-0 border shadow bg-white">
                                            <div id="nav-header" class="p-2 text-primary bg-gray">
                                                <h4>Ensemble des Etapes</h4>
                                            </div>
                                            <ul class="list-unstyled">
                                                <c:forEach var="entry" items="${etapesMap}">
                                                    <li>
                                                        <a href="#${entry.key}"
                                                           class="btn btn-block text-dark"
                                                           data-toggle="collapse">
                                                            <c:out value="${entry.key}"/>
                                                            <span class="badge badge-primary">
                                                        <c:out value="${entry.value.size()}"/>
                                                    </span>
                                                        </a>
                                                        <nav id="${entry.key}" class="nav flex-column collapse"
                                                             data-toggle="collapse" role="tablist">
                                                            <c:forEach var="item" items="${entry.value}">
                                                                <a id="<c:out value='${item.getId()}' /> "
                                                                   class="btn btn-block nav-item nav-link text-dark">
                                                                    Etape numero: <b><c:out
                                                                        value="${item.getId()}"/></b>

                                                                </a>
                                                            </c:forEach>
                                                        </nav>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </nav>
                                    </div>

                                    <!-- etape content -->
                                    <div class="col-sm-9 px-1 m-0 shadow bg-gray" id="etape-content">
                                        <div class="fade show">
                                            <div class="row my-4">
                                                <div class="offset-md-1 col-md-5 label-box">
                                                    <span class="font-weight-bold label-box-key">Procedure:</span><span
                                                        id="proc_name" class="label-box-value"></span>
                                                </div>
                                                <div class="offset-md-1 col-md-3 label-box">
                                                    <span class="font-weight-bold label-box-key">Etape: </span><span
                                                        id="etape_name" class="label-box-value"></span>
                                                </div>
                                            </div>

                                            <div class="row mt-4">
                                                <div class="offset-sm-1 col-sm-6">
                                                    <div class="card">
                                                        <div class="card-header d-flex flex-column">
                                                            <div class="d-flex justify-content-around">
                                                                <span class="text-right font-weight-bold">Etape ID:</span>
                                                                <span id="etape_id" class="text-left"></span>
                                                            </div>
                                                            <div class="d-flex justify-content-around">
                                                                <span class="text-right font-weight-bold">Etat: </span>
                                                                <span id="etape_etat" class="text-left"></span>
                                                            </div>
                                                            <div class="d-flex justify-content-around">
                                                                <span class="text-right font-weight-bold">Ouverture</span>
                                                                <span id="etape_ouverture" class="text-left"></span>
                                                            </div>
                                                            <div class="d-flex justify-content-around">
                                                                <span class="text-right font-weight-bold">Fermeture</span>
                                                                <span id="etape_fermeture" class="text-left"></span>
                                                            </div>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="d-flex justify-content-around">
                                                                <button id="validate" class="btn btn-outline-success"
                                                                        data-toggle="modal" data-target="#change-state">
                                                                    Valider
                                                                </button>
                                                                <button id="refuse" class="btn btn-outline-warning"
                                                                        data-toggle="modal" data-target="#change-state">
                                                                    Refuser
                                                                </button>
                                                                <button id="reject" class="btn btn-outline-danger"
                                                                        data-toggle="modal" data-target="#change-state">
                                                                    Rejeter
                                                                </button>
                                                            </div>


                                                            <div id="change-state" class="modal fade" tabindex="-1"
                                                                 role="dialog">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title">Un Rapport</h5>
                                                                            <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form action="" method="post">
                                                                                <p class="text-primary font-weight-bold">
                                                                                    Justifier votre decision
                                                                                    par un rappot</p>
                                                                                <label class="text-primary">
                                                                                    <input type="file"
                                                                                           class="input-control-file"
                                                                                           name="files" multiple
                                                                                           required>
                                                                                </label>
                                                                                <input class="none" type="text"
                                                                                       name="id">
                                                                                <input type="submit"
                                                                                       class="btn btn-primary d-block mx-auto"
                                                                                       value="Justifier">
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-footer">
                                                            <h4 class="text-left font-weight-bold">Rapports</h4>
                                                            <div class="d-flex flex-column">
                                                                <ul id="rapports" class="list-group unstyled-list">
                                                                    <!-- Filled with jquery -->
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="py-4 col-sm-4 offset-sd-1 mt-0 pt-0">
                                                    <table class="table table-hover">
                                                        <thead class="label-box-key text-center">
                                                        <tr>
                                                            <th>Documents</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="docs">
                                                        <tr>
                                                            <td class="text-center">doc_01.pdf</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">doc_02.pdf</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">doc_03.pdf</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">doc_04.pdf</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">doc_05.pdf</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">doc_06.pdf</td>
                                                        </tr>
                                                        <tr>
                                                            <td class="text-center">doc_07.pdf</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="fifth-tab" class="tab-pane fade" role="tabpanel">
                                            <p>fifth tab</p>
                                        </div>
                                        <div id="second-tab" class="tab-pane fade" role="tabpanel">
                                            <p>second tabe</p>
                                        </div>
                                        <div id="third-tab" class="tab-pane fade" role="tabpanel">
                                            <p>third tab</p>
                                        </div>
                                        <div id="fourth-tab" class="tab-pane fade" role="tabpanel">
                                            <p>fourth tab</p>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col">
                                        <div class="card w-70 mx-auto">
                                            <div class="card-header">
                                                <h6 class="text-danger">
                                                    Aucun Etape disponible ce moment !!!
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>


                <div id="procedures-section" class="row">
                    <div class="col">
                        <div class="row">
                            <div class="offset-sm-2 col-sm-8">
                                <div class="card">
                                    <div class="card-body">
                                        <p>
                                            <b class="text-primary">Hint: </b>
                                            Avant de traiter les demandes des clients, veuillez verifiez les
                                            documents fournit.
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4">
                            <div class="col-sm-7">
                                <table class="table table-hover">
                                    <thead class="bg-primary">
                                    <tr>
                                        <th class="text-center">Procedures</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <c:choose>
                                            <c:when test="${procs.size() > 0}">
                                                <c:forEach var="proc" items="${procs}">
                                                    <td data-toggle="collapse" data-target="#proc_<c:out value="${proc.getId()}" />">
                                                        <p class="text-primary">
                                                            <c:out value="${proc.getLibelle()}" /> (<c:out value="${proc.getId()}" />)
                                                            <span class="badge badge-primary float-right">
                                                                <c:out value="${proc.getEtat()}" />
                                                            </span>
                                                        </p>
                                                        <div id="proc_<c:out value="${proc.getId()}"/>" class="collapse">
                                                            <ul class="list-group">
                                                                <c:forEach var="etape" items="${proc.getEtapes()}">
                                                                    <c:choose>
                                                                        <c:when test="${etape.getEtatString().equals('TERMINE')}">
                                                                            <li class="list-group-item">
                                                                                <c:out value="${etape.getLibelle()}" /> (<c:out value="${etape.getId()}" />)
                                                                                <i>Ferme le: <c:out value="${etape.getDateFin()}" /></i>
                                                                                <span class="badge badge-success float-right">Termine</span>
                                                                            </li>
                                                                        </c:when>
                                                                        <c:when test="${etape.equals(proc.getEtapeCourante())}">
                                                                            <li class="list-group-item">
                                                                                <c:out value="${etape.getLibelle()}" /> (<c:out value="${etape.getId()}" />)
                                                                                <i>Ouvert le: <c:out value="${etape.getDateDebut()}" /></i>
                                                                                <span class="badge badge-warning float-right">Cours</span>
                                                                            </li>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <li class="list-group-item bg-gray">
                                                                                <c:out value="${etape.getLibelle()}" /> (<c:out value="${etape.getId()}" />)
                                                                            </li>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </ul>
                                                        </div>
                                                    </td>
                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <td><h3 class="text-danger">Aucun procedure disponible pour le moments</h3></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>

                            </div>
                            <div class="col-sm-4 pl-4">
                                <div class="card">
                                    <div class="card-header">
                                        <p>Choisissez une etapes parmi les etapes qui appartient a l'une de vos
                                            procedures et l'affecter a un employee</p>
                                    </div>
                                    <div id="assignment" class="card body p-4">
                                        <span id="msg" class="text-center"></span>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="catalogue">Cat
                                                    Etape:</label>
                                            </div>
                                            <select class="custom-select" id="catalogue">
                                                <option value="0" selected>Choose...</option>
                                                <c:forEach var="cat" items="${catalogueEtape}">
                                                    <option value="<c:out value="${cat.getId()}" />">
                                                        <c:out value="${cat.getLibelle()}" />
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text"
                                                       for="employees">Employee</label>
                                            </div>
                                            <select class="custom-select" id="employees">
                                                <option value="0" selected>Choose...</option>
                                                <c:forEach var="emp" items="${employees}" >
                                                    <option value="<c:out value="${emp.getId()}" />">
                                                        <c:out value="${emp.getNom()}" />
                                                    </option>
                                                </c:forEach>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                        </div>
                                        <button class="btn d-inline-block mx-auto btn-outline-success">Assigner</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="demandes-section" class="row">
                    <div class="col">
                        <div class="row">
                            <div class="offset-sm-2 col-sm-8">
                                <div class="card">
                                    <div class="card-body">
                                        <p>
                                            <b class="text-primary">Hint: </b>
                                            Avant de traiter les demandes des clients, veuillez verifiez les
                                            documents fournit.
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <span id="validation-msg"></span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col px-5">
                                <ul class="list-group">
                                    <c:forEach items="${employe.getDemandeEnAttente()}" var="demande">
                                        <li id="<c:out value="${demande.getJeton()}" />" class="list-group-item">
                                            <div class="d-flex justify-content-around align-items-center">
                                                <p class="my-auto"><b class="text-primary">
                                                    <c:out value="${demande.getLibelle()}"/></b>(<c:out value="${demande.getJeton()}"/>)</p>
                                                <p class="my-auto"><b class="text-primary">Ouvert: </b> <c:out
                                                        value="${demande.getDateOuverture()}"/></p>
                                                <button class="accepter btn btn-outline-success">Accepter</button>
                                                <button class="refuser btn btn-outline-danger">Refuser</button>
                                                <button class="btn btn-outline-secondary" type="button"
                                                        data-toggle="collapse"
                                                        data-target="<c:out value="#docs${demande.getJeton()}" />"
                                                        aria-expanded="false"
                                                        aria-controls="collapseExample">
                                                    Voir Docs
                                                </button>
                                            </div>
                                            <div id="<c:out value="docs${demande.getJeton()}" />" class="collapse">
                                                <hr>
                                                <div class="d-flex justify-content-around">
                                                    <c:forEach items="${demande.getDocs()}" var="doc">
                                                        <a href="#"><c:out value="${doc.getFileName()}"/></a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>

                                    <%--                                    <li class="list-group-item">--%>
                                    <%--                                        <div class="d-flex justify-content-around align-items-center">--%>
                                    <%--                                            <p class="my-auto"><b class="text-primary">Nom de la--%>
                                    <%--                                                Demande</b>(alkjdflkjasdlfkjlaksjdf)</p>--%>
                                    <%--                                            <p class="my-auto"><b class="text-primary">Ouvert: </b> 2020-20-20></p>--%>
                                    <%--                                            <button class="btn btn-outline-success">Accepter</button>--%>
                                    <%--                                            <button class="btn btn-outline-danger">Refuser</button>--%>
                                    <%--                                            <button class="btn btn-outline-secondary" type="button"--%>
                                    <%--                                                    data-toggle="collapse" data-target="#docs" aria-expanded="false"--%>
                                    <%--                                                    aria-controls="collapseExample">--%>
                                    <%--                                                Voir Docs--%>
                                    <%--                                            </button>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div id="docs" class="collapse">--%>
                                    <%--                                            <hr>--%>
                                    <%--                                            <div class="d-flex justify-content-around">--%>
                                    <%--                                                <a href="#">Doc.pdf</a>--%>
                                    <%--                                                <a href="#">Doc.pdf</a>--%>
                                    <%--                                                <a href="#">Doc.pdf</a>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </li>--%>
                                    <%--                                    <li class="list-group-item">--%>
                                    <%--                                        <div class="d-flex justify-content-around align-items-center">--%>
                                    <%--                                            <p class="my-auto"><b class="text-primary">Nom de la--%>
                                    <%--                                                Demande</b>(alkjdflkjasdlfkjlaksjdf)</p>--%>
                                    <%--                                            <p class="my-auto"><b class="text-primary">Ouvert: </b> 2020-20-20></p>--%>
                                    <%--                                            <button class="btn btn-outline-success">Accepter</button>--%>
                                    <%--                                            <button class="btn btn-outline-danger">Refuser</button>--%>
                                    <%--                                            <button class="btn btn-outline-secondary" type="button"--%>
                                    <%--                                                    data-toggle="collapse" data-target="#docs" aria-expanded="false"--%>
                                    <%--                                                    aria-controls="collapseExample">--%>
                                    <%--                                                Voir Docs--%>
                                    <%--                                            </button>--%>
                                    <%--                                        </div>--%>
                                    <%--                                        <div id="docs" class="collapse">--%>
                                    <%--                                            <hr>--%>
                                    <%--                                            <div class="d-flex justify-content-around">--%>
                                    <%--                                                <a href="#">Doc.pdf</a>--%>
                                    <%--                                                <a href="#">Doc.pdf</a>--%>
                                    <%--                                                <a href="#">Doc.pdf</a>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </div>--%>
                                    <%--                                    </li>--%>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="py-1 bg-dark text-white fixed-bottom">
    <div class="container text-center">
        <small>Copyright &copy; GPAdmin </small>
    </div>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

<script src="res/js/chef.js"></script>
</body>

</html>