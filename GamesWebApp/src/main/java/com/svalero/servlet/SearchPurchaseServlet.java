package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.GameDAO;
import com.svalero.dao.PurchaseDAO;
import com.svalero.domain.Game;
import com.svalero.domain.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Collections;
import java.util.List;


@WebServlet("/searchPurchase")
@MultipartConfig

public class SearchPurchaseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String name = "%" + request.getParameter("search") + "%";
        String developer = "%" + request.getParameter("search") + "%";

        List<Purchase> purchases = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            List<Game> games = Database.jdbi.withExtension(GameDAO.class, dao -> dao.searchGameByNameOrDeveloper(name, developer));

            for (Game game : games) {
                purchases = Database.jdbi.withExtension(PurchaseDAO.class, dao -> dao.searchPurchase(game.getId()));
            }

            request.setAttribute("purchases", purchases);
            request.getRequestDispatcher("purchase-search.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}