

<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.PurchaseDAO" %>
<%@ page import="com.svalero.domain.Purchase" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<main>
    <%
        int idPurchase= Integer.parseInt(request.getParameter("id"));
        Class.forName("com.mysql.cj.jdbc.Driver");
        Database.connect();
        Purchase purchase = Database.jdbi.withExtension(PurchaseDAO.class, dao-> dao.getPurchase(idPurchase));

        String textGame_18;
        if (purchase.getGame().getGame_18() == '0') {
        textGame_18 = "No";
        } else {
        textGame_18 = "Si";
        }
    %>
    <div class="container details">
        <div class="card mb-3 w-25">

            <div class="card-body">
                <h3 class="card-title">Id compra: <%= purchase.getId() %></h3>
                <h3 class="card-title">Precio: <%= purchase.getPrice() %>€</h3>
                <h5 class="card-title">Teléfono: <%= purchase.getPhone() %></h5>
                <h5 class="card-title">Método de pago: <%= purchase.getPayment_method() %></h5>
                <br/><br/>
                <h5 class="card-text">Nombre: <b><%= purchase.getGame().getName() %></b></h5>
                <p class="card-text">Desarrollador: <b><%= purchase.getGame().getDeveloper() %></b></p>
                <p class="card-text">Id juego: <b><%= purchase.getGame().getId() %></b></p>
                <p class="card-text">Juego +18: <b><%= textGame_18 %></b></p>
                <p class="card-text">Fecha de lanzamiento: <b><%= purchase.getGame().getRelease_date().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) %></b></p>
                <a href="purchase-form.jsp?id=<%= purchase.getId() %>&action=edit&price=<%= purchase.getPrice() %>&phone=<%= purchase.getPhone() %>&payment_method=<%= purchase.getPayment_method() %>&gameId=<%= purchase.getGame().getId() %>"
                   class="btn btn-sm btn-outline-primary">Modificar</a>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/footer.jsp"%>