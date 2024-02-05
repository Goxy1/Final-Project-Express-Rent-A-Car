package Servlets;

import DB.ConnectionDataBase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "MakeReservationServlet", value = "/MakeReservationServlet")
public class MakeReservationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String typeOfLocation = request.getParameter("typeOfLocation");
        String carName = request.getParameter("carName");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionDataBase.connectToDataBase();

            String sql = "INSERT INTO reservations (FirstName, LastName, emailAddress, dateOfBirth, checkInDate, checkOutDate, typeOfLocation, carName) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, emailAddress);
            stmt.setString(4, dateOfBirth);
            stmt.setString(5, checkInDate);
            stmt.setString(6, checkOutDate);
            stmt.setString(7, typeOfLocation);
            stmt.setString(8, carName);

            int rowsAffected = stmt.executeUpdate();

            if(rowsAffected > 0) {
                response.sendRedirect("../UserPages/SuccessfulReservation.jsp");
            } else {
                response.sendRedirect("../UserPages/ErrorPage.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("../UserPages/ErrorPage.jsp");
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private String getEmailFromCookie(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("emailCookie")){
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
}