<%@ page import="java.sql.Connection" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 25.1.2024.
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservations by car name</title>
    <link href="../css/DeleteAndUpdateFormManager.css" rel="stylesheet">
</head>
<body>
<%@include file="../HeaderAndFooter/AdminHeader.jsp"%>
<div class="container">
    <%
        Connection connection = null;
        try {
            connection = ConnectionDataBase.connectToDataBase();

            String carName = request.getParameter("carName");
            String query;
            PreparedStatement statement;

            if (carName != null && !carName.isEmpty()) {
                query = "SELECT * FROM reservations WHERE CarName = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, carName);
            } else {
                query = "SELECT * FROM reservations";
                statement = connection.prepareStatement(query);
            }

            ResultSet resultSet = statement.executeQuery();
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email address</th>
            <th>Date of Birth</th>
            <th>Check-In Date</th>
            <th>Check-Out Date</th>
            <th>Type of location</th>
            <th>Car Name</th>
        </tr>

        <% while ((resultSet).next()) { %>
        <tr>
            <td><%= resultSet.getInt("ID") %></td>
            <td><%= resultSet.getString("FirstName") %></td>
            <td><%= resultSet.getString("LastName") %></td>
            <td><%= resultSet.getString("EmailAddress") %></td>
            <td><%= resultSet.getString("DateOfBirth") %></td>
            <td><%= resultSet.getString("CheckInDate") %></td>
            <td><%= resultSet.getString("CheckOutDate") %></td>
            <td><%= resultSet.getString("TypeOfLocation") %></td>
            <td><%= resultSet.getString("CarName") %></td>
        </tr>
        <% } %>

    </table>

    <%
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

    <div class="form-container">
        <form action="../DeleteReservationWithIDAdmin" method="POSt">
            <label>Enter the ID reservation: </label>
            <input type="text" name="IDreservation">
            <input type="submit" value="Delete the reservation">
        </form>
        <form action="../AdminPages/UpdateUserReservationAdminPage.jsp" method="POSt">
            <label>Enter the ID reservation: </label>
            <input type="text" name="IDUpdateReservation">
            <input type="submit" value="Update the reservation">
        </form>
    </div>

</div>
</body>
</html>
