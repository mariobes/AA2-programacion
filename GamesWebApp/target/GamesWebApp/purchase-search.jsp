

<%@ page import="java.util.List" %>
<%@ page import="com.svalero.domain.Purchase" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ include file="includes/header.jsp" %>

<!DOCTYPE html>
<html lang="es">

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

    <div class="container">

        <h1>Compras</h1>
        <table class="table">
            <thread>
                <tr>
                    <th>ID</th>
                    <th>Precio</th>
                    <th>Teléfono</th>
                    <th>Método de pago</th>
                    <th>Juego</th>
                </tr>
            </thread>

            <% for (Purchase purchase : (List<Purchase>)request.getAttribute("purchases")) { %>
            <tr>
                <td><%= purchase.getId() %></td>
                <td><%= purchase.getPrice() %></td>
                <td><%= purchase.getPhone() %></td>
                <td><%= purchase.getPayment_method() %></td>
                <td><%= purchase.getGame().getName() %></td>
                <td><a href="purchase-view-details.jsp?id=<%= purchase.getId() %>" class="btn btn-sm btn-outline-secondary">Ver detalles</a></td>
            </tr>
            <% } %>
            <div class="container  d-flex justify-content-center">
                <a href="index.jsp" type="button" class="btn btn-primary col-4" style="margin-top: 30px; margin-bottom: 30px;">Volver al inicio</a>
            </div>

        </table>
    </div>
</html>

<%@include file="includes/footer.jsp"%>