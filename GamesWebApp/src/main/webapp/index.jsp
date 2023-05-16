

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<%@include file="includes/header.jsp"%>

  <main>
    <div class="container">
      <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">

        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header py-3 text-bg-primary border-primary">
              <h4 class="my-0 fw-normal">JUEGOS</h4>
            </div>
            <div class="card-body">
              <p>Para visualizar los juegos</p>
              <button type="button" class="w-100 btn btn-lg btn-outline-primary">Entrar</button>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm">
              <div class="card-header py-3">
              <h4 class="my-0 fw-normal">COMPRAS</h4>
            </div>
            <div class="card-body">
              <p>Para visualizar las compras</p>
              <button type="button" class="w-100 btn btn-lg btn-outline-primary">Entrar</button>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-primary">
            <div class="card-header py-3 text-bg-primary border-primary">
              <h4 class="my-0 fw-normal">USUARIOS</h4>
            </div>
            <div class="card-body">
              <p>Para visualizar los usuarios</p>
              <button type="button" class="w-100 btn btn-lg btn-outline-primary">Entrar</button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </main>

<%@include file="includes/footer.jsp"%>