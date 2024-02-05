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

@WebServlet(name = "CancelReservationUserServlet", value = "/CancelReservationUserServlet")
public class CancelReservationUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationID = request.getParameter("ReservationID");

        if(reservationID != null && !reservationID.isEmpty()){
            if(deleteReservation(reservationID)){
                response.sendRedirect("../UserPages/SuccessDeleteReservation.jsp");
            }
            else{
                response.sendRedirect("../UserPages/InvalidIDReservation.jsp");
            }
        }else{
            response.sendRedirect("../UserPages/InvalidIDReservation.jsp");
        }
    }

    private boolean deleteReservation(String reservationID)
    {
        boolean deleted = false;
        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();

            String query = "Delete from reservations where ID = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, reservationID);

            int rowsAffected = statement.executeUpdate();
            if(rowsAffected > 0)
            {
                deleted = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally{
            if(statement != null)
            {
                try{
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
        return deleted;
    }
}