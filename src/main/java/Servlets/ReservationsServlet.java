package Servlets;

import DB.ConnectionDataBase;
import DB.Reservation;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ReservationsServlet", value = "/ReservationsServlet")
public class ReservationsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = getEmailFromCookie(request);

        if (email != null)
        {
            List<Reservation> reservations = getReservations(email);
            request.setAttribute("reservations", reservations);

            Cookie emailCookie = new Cookie("emailCookie", email);
            emailCookie.setMaxAge(86400); //Setting time for a cookie- 24h
            response.addCookie(emailCookie);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPages/ShowUserReservations.jsp");
            dispatcher.forward(request, response);
        }else{
            response.sendRedirect("../UserPages/ErrorShowReservations.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private String getEmailFromCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for (Cookie cookie : cookies){
                if(cookie.getName().equals("UserEmail")){
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    private List<Reservation> getReservations(String email){
        List<Reservation> reservations = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();

            String sql = "SELECT * FROM reservations WHERE emailAddress = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            resultSet = statement.executeQuery();

            while(resultSet.next()){
                String reservationID = resultSet.getString("ID");
                String firstName = resultSet.getString("FirstName");
                String LastName = resultSet.getString("LastName");
                String emailAddress = resultSet.getString("emailAddress");
                String dateOfBirth = resultSet.getString("dateOfBirth");
                String checkInDate = resultSet.getString("checkInDate");
                String checkOutDate = resultSet.getString("checkOutDate");
                String typeOfLocation = resultSet.getString("typeOfLocation");
                String carName = resultSet.getString("carName");

                Reservation reservation = new Reservation(reservationID, firstName, LastName, emailAddress, dateOfBirth, checkInDate, checkOutDate, typeOfLocation, carName);
                reservations.add(reservation);
            }
        }catch (SQLException e) {
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

        return reservations;
    }
}