

<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Game" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>

<!DOCTYPE html>
<html lang="es">

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<div class="container">

    <h1>Juegos</h1>
    <table class="table">
        <thread>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Desarrollador</th>
                <th>Juego +18</th>
                <th>Fecha de lanzamiento</th>
            </tr>
        </thread>

        <% for (Game game : (List<Game>)request.getAttribute("games")) { %>
        <tr>
            <td><%= game.getId() %></td>
            <td><%= game.getName() %></td>
            <td><%= game.getDeveloper() %></td>
            <td><%= game.getGame_18() %></td>
            <td><%= game.getRelease_date() %></td>

        </tr>
        <% } %>
        <div class="container  d-flex justify-content-center">
            <a href="index.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 30px; margin-bottom: 30px;">Volver al inicio</a>
        </div>

    </table>
</div>
</html>

<%@include file="includes/footer.jsp"%>