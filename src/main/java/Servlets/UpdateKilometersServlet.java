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

@WebServlet(name = "UpdateKilometersServlet", value = "/UpdateKilometersServlet")
public class UpdateKilometersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int carId = Integer.parseInt(request.getParameter("carId"));
            String newKilometers = request.getParameter("UpdateKilometers");

            updateKilomets(carId, newKilometers);

            response.sendRedirect("../AdminPages/UpdateSuccess.jsp");
        }catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../AdminPages/Error.jsp");
        }
    }

    private void updateKilomets(int carId, String newKilometers){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();

            String query = "UPDATE automobili SET Kilometers = ? WHERE ID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newKilometers);
            preparedStatement.setInt(2, carId);

            preparedStatement.executeUpdate();
        }catch (Exception e) {
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