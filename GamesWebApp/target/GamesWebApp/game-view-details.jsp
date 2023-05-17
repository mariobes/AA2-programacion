

<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.GameDAO" %>
<%@ page import="com.svalero.domain.Game" %>

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
    <div class="container">
        <div class="card mb-3">
<!--            <img src="..." class="card-img-top" alt="...">-->
            <div class="card-body">
                <h2 class="card-title"><%= game.getName() %></h2>
                <h5 class="card-title"><%= game.getDeveloper() %></h5>
                <p class="card-text"><%= game.getGame_18() %></p>
                <p class="card-text"><small class="text-muted"><%= game.getRelease_date() %></small></p>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/footer.jsp"%>