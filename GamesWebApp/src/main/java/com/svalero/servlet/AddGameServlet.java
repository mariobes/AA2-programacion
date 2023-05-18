package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.GameDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

@WebServlet("/add-game")
@MultipartConfig
public class AddGameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String developer = request.getParameter("developer");
        char game_18 = request.getParameter("game_18").charAt(0);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            Database.jdbi.withExtension(GameDAO.class, dao -> {
                dao.registerGame(name, developer, game_18, LocalDate.now());
                return null;
            });

            out.println("<div class='alert alert-success' role='alert'>Juego registrado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
