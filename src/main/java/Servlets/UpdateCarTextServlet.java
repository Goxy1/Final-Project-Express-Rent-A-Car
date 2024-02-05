package Servlets;

import DB.ConnectionDataBase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "UpdateCarTextServlet", value = "/UpdateCarTextServlet")
public class UpdateCarTextServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int carId = Integer.parseInt(request.getParameter("carId"));
            String newCarText = request.getParameter("updateCarText");

            updateCarText(carId, newCarText);

            response.sendRedirect("../AdminPages/UpdateSuccess.jsp"); // Zamislite da postoji stranica za uspeh

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void updateCarText(int carId, String newCarText) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = ConnectionDataBase.connectToDataBase();

            String query = "UPDATE automobili SET CarText = ? WHERE ID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newCarText);
            preparedStatement.setInt(2, carId);

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}