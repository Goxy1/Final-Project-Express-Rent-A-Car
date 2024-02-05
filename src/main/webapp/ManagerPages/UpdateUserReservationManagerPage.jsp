<%@ page import="java.sql.Connection" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 18.1.2024.
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update users reservation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="../css/UpdateUserReservationManagerPages.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../HeaderAndFooter/ManagerHeader.jsp"/>

<div class="container">
    <%
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try{
            connection = ConnectionDataBase.connectToDataBase();

            String IDUpdateReservation = request.getParameter("IDUpdateReservation");
            String query;

            if (IDUpdateReservation != null && !IDUpdateReservation.isEmpty()){
                query = "SELECT * FROM reservations where ID = ?";
                statement = connection.prepareStatement(query);
                statement.setString(1, IDUpdateReservation);
            }else{
                query = "SELECT * from reservations";
                statement = connection.prepareStatement(query);
            }
            resultSet = statement.executeQuery();
    %>

    <% if ((resultSet).next()){
        String userID = resultSet.getString("ID");
        String firstName = resultSet.getString("FirstName");
        String lastName = resultSet.getString("LastName");
        String emailAddress = resultSet.getString("EmailAddress");
        String dateOfBirth = resultSet.getString("DateOfBirth");
        String checkInDate = resultSet.getString("CheckInDate");
        String checkOutDate = resultSet.getString("CheckOutDate");
        String typeOfLocation = resultSet.getString("TypeOfLocation");
        String carName = resultSet.getString("CarName");
    %>
    <form action = "../UpdateReservationManagerServlet" method="POST">
        <table>
            <tr>
                <td>ID:</td>
                <td><%= userID %></td>
                <input type="hidden" name="userID" value="<%= userID%>">
            </tr>
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstName" value="<%= firstName%>"></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastName" value="<%= lastName%>"></td>
            </tr>
            <tr>
                <td>Email Address:</td>
                <td><input type="text" name="emailAddress" value="<%= emailAddress%>"></td>
            </tr>
            <tr>
                <td>Date of birth</td>
                <td><%= dateOfBirth%></td>
            </tr>
            <tr>
                <td>Check in Date</td>
                <td><input type="date" name="checkInDate" value="<%= checkInDate%>"></td>
            </tr>
            <tr>
                <td>Check out Date</td>
                <td><input type="date" name="checkOutDate" value="<%= checkOutDate%>"></td>
            </tr>
            <tr>
                <td>Type of location</td>
                <td><input type="text" name="typeOfLocation" value="<%= typeOfLocation%>"></td>
            </tr>
            <tr>
                <td>Car name:</td>
                <td><%= carName%></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>

    </form>
    <%} else {%>
    <p>No user found with the specified ID.</p>
    <%
            }
        }catch (Exception e){
            e.printStackTrace();
            }finally {
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

    %>
</div>
</body>
</html>
