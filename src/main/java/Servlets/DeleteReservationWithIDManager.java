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

@WebServlet(name = "DeleteReservationWithIDManager", value = "/DeleteReservationWithIDManager")
public class DeleteReservationWithIDManager extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationID = request.getParameter("reservationID");

        if(reservationID != null && !reservationID.isEmpty()){
            try{
                int id = Integer.parseInt(reservationID);
                boolean success = cancelReservation(id);

                if(success){
                    response.sendRedirect("../ManagerPages/SuccessDeletionReservation.jsp");
                }else{
                    response.sendRedirect("../ManagerPages/Error.jsp");
                }
            }catch(NumberFormatException e){
                e.printStackTrace();
            }
        }else{
            response.sendRedirect("../ManagerPages/Error.jsp");
        }
    }

    private boolean cancelReservation(int reservationID){
        boolean success = false;

        try{
            Connection connection = ConnectionDataBase.connectToDataBase();
            PreparedStatement statement = null;

            String query = "DELETE FROM reservations WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement.setInt(1, reservationID);

            int rowsAffected = statement.executeUpdate();
            success = rowsAffected > 0;

            if(statement != null){
                statement.close();
            }
            if(connection != null){
                connection.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return success;
    }
}