<%@ page import="java.sql.Connection" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 30.1.2024.
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update user!</title>
    <link href="../css/UpdateUserAdminPage.css" rel="stylesheet">
</head>
<body>
        <div class="container">

            <%
                String userIDParam = request.getParameter("IDUser");
                int userID = 0;
                if (userIDParam != null && !userIDParam.isEmpty()){
                    userID = Integer.parseInt(userIDParam);
                }

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try{
                    connection = ConnectionDataBase.connectToDataBase();
                    String query = "SELECT * FROM korisnik WHERE ID = ?";
                    statement = connection.prepareStatement(query);
                    statement.setInt(1, userID);
                    resultSet = statement.executeQuery();

                    if(resultSet.next()){
                        String firstName = resultSet.getString("FirstName");
                        String lastName = resultSet.getString("LastName");
                        String email = resultSet.getString("Email");
                        String phoneNumber = resultSet.getString("phoneNumber");
                        String address = resultSet.getString("Address");

            %>

        <form action="../UpdateUserServlet" method="POST" class="form-container">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><%= userID %></td>
                    <input type="hidden" name="userID" value="<%= userID %>">
                </tr>
                <tr>
                    <td>First name:</td>
                    <td><input type="text" name="firstName" value="<%= firstName %>"></td>
                </tr>
                <tr>
                    <td>Last name:</td>
                    <td><input type="text" name="lastName" value="<%= lastName %>"></td>
                </tr>
                <tr>
                    <td>Email address:</td>
                    <td><input type="text" name="Email" value="<%= email %>"></td>
                </tr>
                <tr>
                    <td>Phone number:</td>
                    <td><input type="text" name="phoneNumber" value="<%= phoneNumber %>"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" value="<%= address%>"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Update"></td>
                </tr>
            </table>
        </form>
        <%
        } else {
        %>
        <p>No user found with the specified ID.</p>
        <%
                }
            } catch (Exception e) {
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
        %>

        </div>
</body>
</html>