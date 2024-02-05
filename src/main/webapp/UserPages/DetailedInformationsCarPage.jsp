<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="DB.CarPictures" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 5.1.2024.
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detailed informations about a car!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> <!--link za bootstrap 5.0-->
    <link href="../css/sliderForPictures.css" rel="stylesheet">
    <link href="../css/DetailedInformationsCarPage.css" rel="stylesheet">
</head>
<body>
<%@include file="../HeaderAndFooter/Navbar.jsp"%>
<%
    int carID = Integer.parseInt(request.getParameter("carId"));
    String carName = request.getParameter("carName");

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        connection = ConnectionDataBase.connectToDataBase();
        preparedStatement = connection.prepareStatement("SELECT OutsidePicture1, OutsidePicture2, OutsidePicture3, InsidePicture1, InsidePicture2, InsidePicture3 FROM automobilislike WHERE ID = ?");
        preparedStatement.setInt(1, carID);
        resultSet = preparedStatement.executeQuery();

        CarPictures carPictures = new CarPictures();
        if (resultSet.next()) {
            carPictures.setOutsidePicture1(resultSet.getString("OutsidePicture1"));
            carPictures.setOutsidePicture2(resultSet.getString("OutsidePicture2"));
            carPictures.setOutsidePicture3(resultSet.getString("OutsidePicture3"));
            carPictures.setInsidePicture1(resultSet.getString("InsidePicture1"));
            carPictures.setInsidePicture2(resultSet.getString("InsidePicture2"));
            carPictures.setInsidePicture3(resultSet.getString("InsidePicture3"));
        }
%>

<div id="carouselExampleIndicators" class="carousel slide container" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 6"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<%= carPictures.getOutsidePicture1() %>" class="d-block w-100" alt="OutsidePicture1">
        </div>
        <div class="carousel-item">
            <img src="<%= carPictures.getOutsidePicture2() %>" class="d-block w-100" alt="OutsidePicture2">
        </div>
        <div class="carousel-item">
            <img src="<%= carPictures.getOutsidePicture3() %>" class="d-block w-100" alt="OutsidePicture3">
        </div>
        <div class="carousel-item">
            <img src="<%= carPictures.getInsidePicture1() %>" class="d-block w-100" alt="InsidePicture1">
        </div>
        <div class="carousel-item">
            <img src="<%= carPictures.getInsidePicture2() %>" class="d-block w-100" alt="InsidePicture2">
        </div>
        <div class="carousel-item">
            <img src="<%= carPictures.getInsidePicture3() %>" class="d-block w-100" alt="InsidePicture3">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    ConnectionDataBase connection1 = new ConnectionDataBase();
    connection1.connectToDataBase();

%>

<div class="container">
    <h2><%= carName%></h2>
   <p><%= connection1.getCarTextFromDatabase(carID) %></p>
</div>

<div class="container">
    <form class="Form" action="../MakeReservationServlet" method="POST">
        <label class="label">First Name:</label>
        <input class="input" type="text" id="firstName" name="firstName" required>

        <label class="label">Last name:</label>
        <input class="input" type="text" id="lastName" name="lastName" required>

        <label class="label">Please enter the email address you wish to receive to reservation documentation:</label>
        <input class="input" type="text" id="emailAddress" name="emailAddress" required>

        <label class="label">Date of Birth:</label>
        <input class="input" type="date" id="dateOfBirth" name="dateOfBirth" required>

        <label class="check-lbl">Check-in date</label>
        <input type="date"  name="checkInDate" class="form-control" placeholder="Check-in date" required>

        <label class="check-lbl">Check-out date</label>
        <input type="date"  class="form-control" name="checkOutDate" placeholder="Check-out date" required>

        <label class="label">Where would you like to pick up the car?</label>
        <input class="input" type="text" id="typeOfLocation" name="typeOfLocation" required>

        <label class="label">Enter the name of the car to confirm that you are not a bot.</label>
        <input class="input" type="text" id="carName" name="carName" required>



        <button class="button" type="submit">Reserve!</button><br>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
