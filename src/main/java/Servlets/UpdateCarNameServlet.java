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

@WebServlet(name = "UpdateCarNameServlet", value = "/UpdateCarNameServlet")
public class UpdateCarNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carID = request.getParameter("carId");
        String carNameUpdate = request.getParameter("CarNameUpdate");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();
            String query = "UPDATE automobili SET CarName = ? WHERE ID = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, carNameUpdate);
            preparedStatement.setString(2, carID);
            int rowsAffected = preparedStatement.executeUpdate();

            if(rowsAffected > 0){
                response.sendRedirect("../AdminPages/UpdateSuccess.jsp");
            }else{
                response.sendRedirect("../AdminPages/Error.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
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