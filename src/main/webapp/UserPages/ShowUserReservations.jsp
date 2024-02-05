<%@ page import="DB.Reservation" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 8.1.2024.
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User reservations!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="../css/ShowUserReservation.css" rel="stylesheet">
</head>
<body>
<%@include file="../HeaderAndFooter/Navbar.jsp"%>
<div class="container">
    <h2>My reservations</h2>
    <table>
        <tr>
            <th>Reservation ID</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Date of birth</th>
            <th>Email</th>
            <th>Check in date</th>
            <th>Check out date</th>
            <th>Type of location</th>
            <th>Car name</th>
        </tr>

        <%
            ArrayList<Reservation> reservations = (ArrayList<Reservation>) request.getAttribute("reservations");
            for (Reservation reservation : reservations) { %>
        <tr>
            <td><%= reservation.getID() %></td>
            <td><%= reservation.getFirstName() %></td>
            <td><%= reservation.getLastName() %></td>
            <td><%= reservation.getDateOfBirth() %></td>
            <td><%= reservation.getEmailAddress() %></td>
            <td><%= reservation.getCheckInDate() %></td>
            <td><%= reservation.getCheckOutDate() %></td>
            <td><%= reservation.getTypeOfLocation() %></td>
            <td><%= reservation.getCarName() %></td>
        </tr>
        <% } %>
    </table><br><br>
    <br> <br>
        <form action="../CancelReservationUserServlet" method="POST">
            <label>Cancel your reservation:</label>
            <input type="text" name="ReservationID" placeholder="Enter your reservation ID" required><br><br/>
            <input type="Submit" value="Cancel reservation">
        </form>
        <form action="../UserPages/OverviewUserPage.jsp">
            <input type="submit" value="Go to the welcome page">
        </form>
</div>
</body>
</html>
