

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@include file="includes/header.jsp"%>

<main>
    <div class="container">
        <br/>
        <form class="row g-3" method="post" action="edit-vehicle" enctype="multipart/form-data">
            <div class="col-md-6">
                <label for="name" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="name" name="name" value='<%= name %>'>
            </div>
            <div class="col-md-6">
                <label for="developer" class="form-label">Marca</label>
                <input type="text" class="form-control" id="developer" name="developer" value='<%= developer %>'>
            </div>
            <div class="col-md-6">
                <label for="game_18" class="form-label">Juego +18</label>
                <input type="checkbox" class="form-control" id="game_18" name="game_18" value='<%= game_18 %>'>
            </div>
            <div class="col-md-6">
                <label for="game_18" class="form-label">Disabled checkbox</label>
                <input type="checkbox" class="form-control" id="game_18" name="game_18" value='<%= game_18 %>'>
            </div>
            <div class="col-md-6">
                <label for="image" class="form-label">Imagen</label>
                <input type="file" class="form-control" id="image" name="image">
            </div>
            <input type="hidden" name="action" value="<%= action %>"/>
            <%
            if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            %>
            <input type="hidden" name="id" value="<%= id %>"/>
            <%
            }
            %>
            <div class="col-12">
                <input type="submit" value="<%= action %>"/>
            </div>
        </form>
        <br/>
        <div id="result"></div>
    </div>
</main>

<%@include file="includes/footer.jsp"%>