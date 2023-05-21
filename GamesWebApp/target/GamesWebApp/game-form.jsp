

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<!--<script type="text/javascript">-->
<!--    $(document).ready(function() {-->
<!--        $("form").on("submit", function(event) {-->
<!--            event.preventDefault();-->
<!--            var formValue = $(this).serialize();-->
<!--            $.post("add-game", formValue, function(data) {-->
<!--                $("#result").html(data);-->
<!--            });-->
<!--        });-->
<!--    });-->
<!--</script>-->

<%
    String action = request.getParameter("action");
    String name = request.getParameter("name");
    if (name == null) name = "";
    String developer = request.getParameter("developer");
    if (developer == null) developer = "";
%>

<main>
    <div class="container">
        <br/>
        <form class="row g-3" method="post" action="edit-game" enctype="multipart/form-data">
            <div class="col-md-6">
                <label for="name" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="name" name="name" value='<%= name %>'>
            </div>
            <div class="col-md-6">
                <label for="developer" class="form-label">Desarrollador</label>
                <input type="text" class="form-control" id="developer" name="developer" value='<%= developer %>'>
            </div>
            <div class="col-md-6">
                <label for="game_18" class="form-label">Juego +18</label>
                <select class="form-control" id="game_18" name= "game_18">
                    <option value="0">No</option>
                    <option value="1">Sí</option>
                </select>
            </div>
            <div class="col-md-6">
                <label for="image" class="form-label">Imagen</label>
                <input type="file" class="form-control" id="image" name="image">
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