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

@WebServlet(name = "UpdateReservationManagerServlet", value = "/UpdateReservationManagerServlet")
public class UpdateReservationManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String typeOfLocation = request.getParameter("typeOfLocation");

        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();

            String query = "UPDATE reservations SET FirstName = ?, LastName = ?, emailAddress = ?, checkInDate = ?, checkOutDate = ?, typeOfLocation = ? WHERE ID = ?";
            statement = connection.prepareStatement(query);

            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, emailAddress);
            statement.setString(4, checkInDate);
            statement.setString(5, checkOutDate);
            statement.setString(6, typeOfLocation);
            statement.setString(7, userID);

            int rowsUpdated = statement.executeUpdate();

            if(rowsUpdated > 0){
                response.sendRedirect("../ManagerPages/SuccessfullyUpdatedUsersReservation.jsp");
            }else{
                response.sendRedirect("../ManagerPages/ErrorUpdatingDataBase.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
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