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

@WebServlet(name = "UpdateUserServlet", value = "/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIDParam = request.getParameter("userID");
        String firstName = request.getParameter("firstName");;
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        int userID = 0;
        if(userIDParam != null && !userIDParam.isEmpty()){
            userID = Integer.parseInt(userIDParam);
        }

        Connection connection = null;
        PreparedStatement statement = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();
            String query = "UPDATE korisnik SET FirstName = ?, LastName = ?, Email = ?, PhoneNumber = ?, Address = ? WHERE ID = ?";
            statement = connection.prepareStatement(query);
            statement = connection.prepareStatement(query);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, email);
            statement.setString(4, phoneNumber);
            statement.setString(5, address);
            statement.setInt(6, userID);

            int rowsUpdated = statement.executeUpdate();

            if(rowsUpdated > 0){
                response.sendRedirect("../AdminPages/UserUpdateSuccess.jsp");
            }else{
                response.sendRedirect("../AdminPages/Error.jsp");
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
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