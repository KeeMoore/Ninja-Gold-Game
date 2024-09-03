<%--
  Created by IntelliJ IDEA.
  User: keimh
  Date: 9/3/2024
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="x-UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ninja Gold</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg ">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNav">

            <div class="d-flex">
                <div class="card mb-3 me-3">
                    <div class="card-header">
                        Your Gold
                    </div>
                    <div class="card-body">
                        <input type="text" class="form-control" id="gold-count" name="gold-count" value="${gold}" readonly>
                    </div>
                </div>
                <form action="/process" method="POST" class="d-flex align-items-center">
                    <input type="hidden" name="place" value="reset">
                    <button type="submit" class="btn btn-danger">Reset</button>
                </form>
            </div>
        </div>
    </div>
</nav>


    <!-- Flowchart Section -->
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-header">
                            Farm
                        </div>
                        <div class="card-body">
                            <p>(Earns 10-20 gold)</p>
                            <form action="/process" method="POST">
                                <input type="hidden" name="place" value="farm">
                                <button type="submit" class="btn btn-primary">Find Gold</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-header">
                            Cave
                        </div>
                        <div class="card-body">
                            <p>(Earns 5-10 gold)</p>
                            <form action="/process" method="POST">
                                <input type="hidden" name="place" value="cave">
                                <button type="submit" class="btn btn-primary">Find Gold</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-header">
                            House
                        </div>
                        <div class="card-body">
                            <p>(Earns 2-5 gold)</p>
                            <form action="/process" method="POST">
                                <input type="hidden" name="place" value="house">
                                <button type="submit" class="btn btn-primary">Find Gold</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-header">
                            Quest
                        </div>
                        <div class="card-body">
                            <p>(Earns/Takes 0-50 gold)</p>
                            <form action="/process" method="POST">
                                <input type="hidden" name="place" value="quest">
                                <button type="submit" class="btn btn-primary">Find Gold</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card mb-3">
                        <div class="card-header">
                            Spa
                        </div>
                        <div class="card-body">
                            <p>Loses 5-20 gold</p>
                            <form action="/process" method="POST">
                                <input type="hidden" name="place" value="spa">
                                <button type="submit" class="btn btn-primary">Visit Spa</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Entries Section -->
    <div class="card mb-3">
        <div class="card-header">
            Activities
        </div>
        <div class="card-body">
            <ul class="list-group">
                <c:forEach var="activity" items="${activities}">
                    <li class=" text-success list-group-item">${activity}</li>
                </c:forEach>
            </ul>
<%--            <ul class="list-group">--%>
<%--                <!-- Entries list would go here -->--%>
<%--                <li class="list-group-item">You entered a farm and earned 15 gold (September 3rd 2021 6:15 pm)</li>--%>
<%--                <li class="list-group-item">You entered a cave and earned 7 gold (September 3rd 2021 4:15 pm)</li>--%>
<%--                <li class="list-group-item">You entered a house and earned 8 gold (September 3rd 2021 2:00 pm)</li>--%>
<%--                <li class="list-group-item">You completed a quest and earned 27 gold (September 3rd 2021 12:00 pm)</li>--%>
<%--                <li class="list-group-item">You failed a quest and lost 60 gold. Ouch! (September 3rd 2021 11:00 am)</li>--%>
<%--            </ul>--%>
        </div>
    </div>
</div>
</body>
</html>

