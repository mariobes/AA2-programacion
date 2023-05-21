

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
        Game game= Database.jdbi.withExtension(GameDAO.class, dao-> dao.getGame(idGame));
    %>
    <div class="container ">
        <div class="card mb-3 w-25">
            <img src="../juegos_data/<%= game.getImage() %>" class="bd-placeholder-img card-img-top"/>
            <div class="card-body">
                <h2 class="card-title"><%= game.getName() %></h2>
                <h5 class="card-title"><%= game.getDeveloper() %></h5>
                <p class="card-text"><%= game.getGame_18() %></p>
                <p class="card-text"><%= game.getRelease_date().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></p>
                <a href="game-form.jsp?id=<%=game.getId() %>&action=edit&name=<%= game.getName() %>&developer=<%= game.getDeveloper() %>"
                   class="btn btn-sm btn-outline-primary">Modificar</a>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/footer.jsp"%>