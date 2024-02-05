<%@ page import="java.sql.Connection" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: urosg
  Date: 12/25/2023
  Time: 3:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrator home page!</title>
    <link href="../css/OverviewUserPage.css" rel="stylesheet"/>
    <link href="../css/bootstrapCard.css" rel="stylesheet"/>
</head>
<body>
<%@include file="../HeaderAndFooter/AdminHeader.jsp"%>

<div class="container main-content">
    <div class="container">
        <div class="row">
            <%
                Connection connection = null;
                connection = ConnectionDataBase.connectToDataBase();
            %>

            <%
                String selectQuery = "SELECT * FROM automobili";

                try (Statement statement = connection.createStatement();
                     ResultSet resultSet = statement.executeQuery(selectQuery)) {
                    while (resultSet.next()) {
                        String imageUrl = resultSet.getString("putanjaSlike");
                        String carName = resultSet.getString("CarName");
                        String carDescription = resultSet.getString("CarDescription");
                        String carId = resultSet.getString("ID");
            %>

            <div class="col-4 custom-col-3" style="margin-top: 3cm;">
                <div class="card custom-col-3" style="width: 18rem;">
                    <img src="<%= imageUrl %>" class="card-img-top" alt="<%= carName %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= carName %></h5>
                        <p class="card-text"><%= carDescription %></p>
                        <a href="../AdminPages/EditCars.jsp?carId=<%=carId%>&carName=<%=carName%>"  class="btn btn-primary">Edit this car!</a>

                    </div>
                </div>
            </div>

            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>

            <%
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script><!--Bootstrap java script-->
</body>
</html>
