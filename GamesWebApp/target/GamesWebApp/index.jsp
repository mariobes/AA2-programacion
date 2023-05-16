

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<%@include file="includes/header.jsp"%>

  <main>
    <div class="container">
      <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">

        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-light-primary">
            <div class="card-header py-3 text-bg-info border-light-primary">
              <h4 class="my-0 fw-normal">JUEGOS</h4>
            </div>
            <div class="card-body">
              <p>Para visualizar los juegos</p>
              <a href="info-games.jsp" class="w-100 btn btn-lg btn-outline-info">Entrar</a>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-light-primary">
            <div class="card-header py-3 text-bg-info border-light-primary">
              <h4 class="my-0 fw-normal">COMPRAS</h4>
            </div>
            <div class="card-body">
              <p>Para visualizar las compras</p>
              <a href="info-purchases.jsp" class="w-100 btn btn-lg btn-outline-info">Entrar</a>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-light-primary">
            <div class="card-header py-3 text-bg-info border-light-primary">
              <h4 class="my-0 fw-normal">USUARIOS</h4>
            </div>
            <div class="card-body">
              <p>Para visualizar los usuarios</p>
              <a href="info-users.jsp" class="w-100 btn btn-lg btn-outline-info">Entrar</a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </main>

<%@include file="includes/footer.jsp"%>