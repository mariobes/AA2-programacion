

<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.GameDAO" %>
<%@ page import="com.svalero.domain.Game" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<main>
    <%
        int idGame= Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        Game game = Database.jdbi.withExtension(GameDAO.class, dao-> dao.getGame(idGame));

        String textGame_18;
        if (game.getGame_18() == '0') {
        textGame_18 = "No";
        } else {
        textGame_18 = "Si";
        }
    %>
    <div class="container details">
        <div class="card mb-3 w-25">
            <img src="../juegos_data/<%= game.getImage() %>" class="bd-placeholder-img card-img-top"/>
            <div class="card-body">
                <h2 class="card-title"><%= game.getName() %></h2>
                <h5 class="card-title"><%= game.getDeveloper() %></h5>
                <br/>
                <p class="card-text">Id juego: <b><%= game.getId() %></b></p>
                <p class="card-text">Juego +18: <b><%= textGame_18 %></b></p>
                <p class="card-text">Fecha de lanzamiento: <b><%= game.getRelease_date().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></b></p>
                <a href="game-form.jsp?id=<%= game.getId() %>&action=edit&name=<%= game.getName() %>&developer=<%= game.getDeveloper() %>"
                   class="btn btn-sm btn-outline-primary">Modificar</a>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/footer.jsp"%>