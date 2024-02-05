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
import java.sql.ResultSet;

@WebServlet(name = "AddACarAdminServlet", value = "/AddACarAdminServlet")
public class AddACarAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carName = request.getParameter("CarName");
        String carAge = request.getParameter("CarAge");
        String kilometers = request.getParameter("Kilometers");
        String engine = request.getParameter("Engine");
        String carText = request.getParameter("CarText");
        String carDescription = request.getParameter("CarDescription");
        String putanjaSlike = request.getParameter("putanjaSlike");

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = ConnectionDataBase.connectToDataBase();

            String maxIdQuery = "SELECT MAX(ID) FROM automobili";
            preparedStatement = connection.prepareStatement(maxIdQuery);
            resultSet = preparedStatement.executeQuery();

            int maxId = 0;
            if (resultSet.next()) {
                maxId = resultSet.getInt(1);
            }

            String query = "INSERT INTO automobili (ID, CarName, CarAge, Kilometers, Engine, CarText, CarDescription, putanjaSlike) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, maxId + 1);
            preparedStatement.setString(2, carName);
            preparedStatement.setString(3, carAge);
            preparedStatement.setString(4, kilometers);
            preparedStatement.setString(5, engine);
            preparedStatement.setString(6, carText);
            preparedStatement.setString(7, carDescription);
            preparedStatement.setString(8, putanjaSlike);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("../AdminPages/SuccessAddedACar.jsp");
            } else {
                response.sendRedirect("../AdminPages/Error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
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
