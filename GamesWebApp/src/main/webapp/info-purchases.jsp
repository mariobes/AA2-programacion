<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.PurchaseDAO" %>
<%@ page import="com.svalero.domain.Purchase" %>
<%@ page import="java.util.List" %>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<script>
$(document).ready(function() {
  $("a[href^='remove-purchase']").click(function(event) {
    event.preventDefault();
    var url = $(this).attr("href");
    var message = $(this).attr("data-message");
    if (typeof message === "undefined") {
      message = "¿Estás seguro de que quieres eliminar?";
    }
    if (confirm(message)) {
      window.location.href = url;
    }
  });
});
</script>

<div class="album py-4">
    <div class="container">

        <div class="text-center row pb-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <p>
                    <a href="game-form.jsp?action=register" class="btn btn-primary my-2">Registrar un juego</a>
                <p>
                <form action="searchGame" method="post" class="form-inline mt-2 mt-md-0">
                    <input class="form-control mr-sm-2" name="search" method="post" type="text" id="search" placeholder="Buscar un juego" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                </form>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Database.connect();
                List<Purchase> purchaseList = Database.jdbi.withExtension(PurchaseDAO.class, PurchaseDAO::getAllPurchases);
                for (Purchase purchase : purchaseList) {
            %>
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <p class="card-text">Juego: <b><%= purchase.getGame().getName() %></b></p>
                        <p class="card-text">Id compra: <%= purchase.getId() %></p>
                        <p class="card-text">Precio: <%= purchase.getPrice() %></p>
                        <p class="card-text">Teléfono: <%= purchase.getPhone() %></p>
                        <p class="card-text">Método de pago: <%= purchase.getPayment_method() %></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="" class="btn btn-sm btn-outline-primary">Ver detalles</a>
                                <a href="" class="btn btn-sm btn-outline-danger">Eliminar</a>
                            </div>
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