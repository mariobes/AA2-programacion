

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-purchase", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<!--<script type="text/javascript">-->
<!--    $(document).ready(function() {-->
<!--        $("form").on("submit", function(event) {-->
<!--            event.preventDefault();-->
<!--            var formValue = $(this).serialize();-->
<!--            $.post("edit-game", formValue, function(data) {-->
<!--                $("#result").html(data);-->
<!--            });-->
<!--        });-->
<!--    });-->
<!--</script>-->

<%
    String action = request.getParameter("action");
    String price = request.getParameter("price");
    if (price == null) price = "";
    String phone = request.getParameter("phone");
    if (phone == null) phone = "";
    String payment_method = request.getParameter("payment_method");
    if (payment_method == null) payment_method = "";
    String gameId = request.getParameter("gameId");
    if (gameId == null) gameId = "";
%>

<main>
    <div class="container">
        <br/>
        <form class="row g-3" method="post" enctype="multipart/form-data">
            <div class="col-md-6">
                <label for="price" class="form-label">Precio</label>
                <input type="text" class="form-control" id="price" name="price" value='<%= price %>'>
            </div>
            <div class="col-md-6">
                <label for="phone" class="form-label">Teléfono</label>
                <input type="text" class="form-control" id="phone" name="phone" value='<%= phone %>'>
            </div>
            <div class="col-md-6">
                <label for="payment_method" class="form-label">Método de pago</label>
                <input type="text" class="form-control" id="payment_method" name="payment_method" value='<%= payment_method %>'>
            </div>
            <div class="col-md-6">
                <label for="gameId" class="form-label">Juego</label>
                <input type="text" class="form-control" id="gameId" name="gameId" value='<%= gameId %>'>
            </div>
            <input type="hidden" name="action" value="<%= action %>">
            <%
            if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
            %>
                <input type="hidden" name="id" value="<%= id %>">
            <%
            }
            %>
            <div class="col-12">
                <input type="submit" class="btn btn-primary" value="Registrar"/>
            </div>
        </form>
        <br/>
        <div id="result"></div>
    </div>
</main>

<%@include file="includes/footer.jsp"%>