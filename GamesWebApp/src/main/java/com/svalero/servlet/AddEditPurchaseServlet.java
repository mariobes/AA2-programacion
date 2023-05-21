package com.svalero.servlet;

import com.svalero.dao.Database;
import com.svalero.dao.GameDAO;
import com.svalero.dao.PurchaseDAO;
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

@WebServlet("/edit-purchase")
@MultipartConfig
public class AddEditPurchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        float price = Float.parseFloat(request.getParameter("price"));
        String phone = request.getParameter("phone");
        String payment_method = request.getParameter("payment_method");
        int gameId = Integer.parseInt(request.getParameter("gameId"));

        int id = 0;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Database.connect();

            if (action.equals("edit")) {
                int purchaseGameId = id;
                Database.jdbi.withExtension(PurchaseDAO.class, dao -> {
                    dao.modifyPurchase(price, phone, payment_method, gameId, purchaseGameId);
                    return null;
                });
            } else {
                Database.jdbi.withExtension(PurchaseDAO.class, dao -> {
                    dao.registerPurchase(price, phone, payment_method, gameId);
                    return null;
                });
            }

            response.sendRedirect("info-purchases.jsp");
            out.println("<div class='alert alert-success' role='alert'>Compra guardado correctamente</div>");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
