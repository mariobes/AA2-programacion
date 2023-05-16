<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.GameDAO" %>
<%@ page import="com.svalero.domain.Game" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<div class="album py-4">
    <div class="container">

        <div class="text-center row pb-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <p>
                    <a href="game-form" class="btn btn-primary my-2">Registrar un juego</a>
                <p>
                <form action="searchTeam" method="post" class="form-inline mt-2 mt-md-0">
                    <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Buscar un juego" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Game> gameList = Database.jdbi.withExtension(GameDAO.class, GameDAO::getAllGames);
                for (Game game : gameList) {
            %>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <p class="card-text"><b><%= game.getName() %></b></p>
                        <p class="card-text"><%= game.getDeveloper() %></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="" class="btn btn-sm btn-outline-primary">Ver detalles</a>
                                <a href="" class="btn btn-sm btn-outline-danger">Eliminar</a>
                            </div>
                            <small class="text-body-secondary">Fecha de lanzamiento: <b><%= game.getRelease_date().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></b></small>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>