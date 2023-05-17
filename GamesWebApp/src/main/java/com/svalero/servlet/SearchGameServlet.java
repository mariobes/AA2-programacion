package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.GameDAO;
import com.svalero.domain.Game;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/searchGame")
@MultipartConfig

public class SearchGameServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String name = "%" + request.getParameter("search") + "%";
        String developer = "%" + request.getParameter("search") + "%";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            List<Game> games = Database.jdbi.withExtension(GameDAO.class, dao -> dao.searchGameByNameOrDeveloper(name, developer));

            request.setAttribute("games", games);
            request.getRequestDispatcher("game-search.jsp").forward(request, response);

        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}