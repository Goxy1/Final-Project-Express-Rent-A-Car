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

@WebServlet(name = "UpdateCarEngineServlet", value = "/UpdateCarEngineServlet")
public class UpdateCarEngineServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            int carId = Integer.parseInt(request.getParameter("carId"));
            String newCarEngine = request.getParameter("UpdateCarEngine");

            updateCarEngine(carId, newCarEngine);

            response.sendRedirect("../AdminPages/UpdateSuccess.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private void updateCarEngine(int carId, String newCarEngine){
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();

            String query = "UPDATE automobili SET Engine = ? WHERE ID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newCarEngine);
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