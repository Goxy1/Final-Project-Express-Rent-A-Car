<%@ page import="java.sql.Connection" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 25.1.2024.
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservations</title>
</head>
<body>
<%@include file="../HeaderAndFooter/AdminHeader.jsp"%>
<div class = "container">
    <%
        Connection connection = null;
        try{
            connection = ConnectionDataBase.connectToDataBase();

            String query = "SELECT * FROM reservations";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

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
        <% while (resultSet.next()) {%>
        <tr>
            <td><%= resultSet.getInt("ID") %></td>
            <td><%= resultSet.getString("FirstName")%></td>
            <td><%= resultSet.getString("LastName")%></td>
            <td><%= resultSet.getString("EmailAddress")%></td>
            <td><%= resultSet.getString("DateOfBirth")%></td>
            <td><%= resultSet.getString("CheckInDate")%></td>
            <td><%= resultSet.getString("CheckOutDate")%></td>
            <td><%= resultSet.getString("TypeOfLocation")%></td>
            <td><%= resultSet.getString("CarName")%></td>
        </tr>
        <% } %>
    </table>

    <%

            resultSet.close();
            statement.close();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(connection != null){
                try{
                    connection.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }
            }
        }
    %>
    <form action="../AdminPages/ShowReservationByCarNameAdminPage.jsp" method="POST">
        <label>Enter car name: </label>
        <input type="text" name="carName">
        <input type="submit" value = "Show Reservations">
    </form>
</div>
</body>
</html>
