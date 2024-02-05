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
import java.sql.SQLException;

@WebServlet(name = "DeleteCarAdminServlet", value = "/DeleteCarAdminServlet")
public class DeleteCarAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carID = request.getParameter("carId");
        deleteCar(carID);
        response.sendRedirect("../AdminPages/DeleteCarSuccess.jsp");
    }

    private void deleteCar(String carID){
        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();
            String query = "DELETE FROM automobili where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, carID);
            statement.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(statement != null){
                try{
                    statement.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
            if(connection != null){
                try{
                    connection.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
        }
    }
}