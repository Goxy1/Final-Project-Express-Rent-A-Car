<%@ page import="java.sql.Connection" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 29.1.2024.
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show user</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> <!--link za bootstrap 5.0-->
    <link href="../css/ShowUsersAdmin.css" rel="stylesheet">
</head>
<body>
<%@include file="../HeaderAndFooter/AdminHeader.jsp"%>

    <div class="container">
        <%
            Connection connection = null;
            try{
                connection = ConnectionDataBase.connectToDataBase();

                String query = "SELECT * FROM korisnik";

                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(query);

        %>

        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Email</th>
                <th>Phone number</th>
                <th>Address</th>
            </tr>
            </thead>
            <tbody>

            <% while (resultSet.next()) { %>
            <tr>
                <td><%= resultSet.getInt("ID") %></td>
                <td><%= resultSet.getString("FirstName") %></td>
                <td><%= resultSet.getString("LastName") %></td>
                <td><%= resultSet.getString("Email") %></td>
                <td><%= resultSet.getString("PhoneNumber") %></td>
                <td><%= resultSet.getString("Address") %></td>
            </tr>
            <% } %>

            </tbody>
        </table>

        <% resultSet.close();
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
        } %>

        <br>
        <div class="form-container">
            <form action="../AdminPages/UpdateUser.jsp" method="POST">
                <label>Which user do you want to edit?Enter their ID:</label><br><br>
                <input type="text" name="IDUser" required><br><br>
                <input type="submit" value="Submit"><br>
            </form>

            <form action="../DeleteUserServlet" method="POST">
                <label>Which user do you want to delete?Enter their ID:</label><br><br>
                <input type="text" name="userID" required><br><br>
                <input type="submit" value="Submit"><br>
            </form>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
