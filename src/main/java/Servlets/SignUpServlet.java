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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    Connection connection = ConnectionDataBase.connectToDataBase();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query;
        boolean errorEmailAddress = false;

        String firstNameField = request.getParameter("firstName");
        String lastNameField = request.getParameter("lastName");
        String emailField = request.getParameter("email");
        String phoneNumberField = request.getParameter("phoneNumber");
        String addressField = request.getParameter("address");
        String passwordField = request.getParameter("password");

        query = "select ID,email from korisnik where email = ?";


        try{
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, emailField);
            ResultSet resultSet = statement.executeQuery();

            Cookie cookieEmail = new Cookie("UserEmail", emailField);
            response.addCookie(cookieEmail);

            if(resultSet.next())
            {
                errorEmailAddress = true;
                request.setAttribute("errorEmail", errorEmailAddress);
                response.sendRedirect("../EmailError.jsp");
            }
            else{
                query = "insert into korisnik(FirstName,LastName,Email,PhoneNumber,Address,Password) values (?,?,?,?,?,password(?))";

                PreparedStatement statement1 = connection.prepareStatement(query);

                statement1.setString(1, firstNameField);
                statement1.setString(2, lastNameField);
                statement1.setString(3, emailField);
                statement1.setString(4, phoneNumberField);
                statement1.setString(5, addressField);
                statement1.setString(6, passwordField);
                statement1.executeUpdate();


                response.sendRedirect("../UserPages/SuccessRegistration.jsp");
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}