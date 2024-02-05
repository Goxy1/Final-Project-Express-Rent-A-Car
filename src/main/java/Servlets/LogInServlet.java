package Servlets;

import DB.ConnectionDataBase;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LogInServlet", value = "/LogInServlet")
public class LogInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = ConnectionDataBase.connectToDataBase();

            // Provera u tabeli "korisnik"
            String query = "SELECT * FROM korisnik WHERE Email = ? AND password = password(?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String userID = resultSet.getString("ID");

                request.getSession().setAttribute("LoggedinUser", userID);

                Cookie cookieEmail = new Cookie("UserEmail", email);
                response.addCookie(cookieEmail);

                response.sendRedirect("../UserPages/SuccessLogIn.jsp");
                return;
            }

            query = "SELECT * FROM menadzer WHERE Email = ? AND Password = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                response.sendRedirect("../ManagerPages/SuccessfullyLogInManager.jsp");
                return;
            }

            query = "SELECT * FROM admin WHERE Email = ? AND Password = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                response.sendRedirect("../AdminPages/SuccessLogInAdmin.jsp");
                return;
            }

            response.sendRedirect("../Error.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}