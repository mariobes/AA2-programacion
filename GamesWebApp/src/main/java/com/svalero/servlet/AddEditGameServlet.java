package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.GameDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/edit-game")
@MultipartConfig
public class AddEditGameServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String imagePath = request.getServletContext().getInitParameter("image-path");
        String name = request.getParameter("name");
        String developer = request.getParameter("developer");
        char game_18 = request.getParameter("game_18").charAt(0);

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {
            Part imagePart = request.getPart("image");
            String fileName;
            if (imagePart.getSize() == 0) {
                fileName = "no_image.jpg";
            } else {
                fileName = UUID.randomUUID() + ".jpg";
                InputStream fileStream = imagePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int gameId = id;
                Database.jdbi.withExtension(GameDAO.class, dao -> {
                    dao.modifyGame(name, developer, game_18, LocalDate.now(), fileName, gameId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(GameDAO.class, dao -> {
                    dao.registerGame(name, developer, game_18, LocalDate.now(), fileName);
                    return null;
                });
            }

            response.sendRedirect("info-games.jsp");
            out.println("<div class='alert alert-success' role='alert'>Juego guardado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
