<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.ConnectionDataBase" %>
<%@ page import="DB.CarPictures" %>
<%@ page import="DB.Car" %><%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 26.1.2024.
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit car!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> <!--link za bootstrap 5.0-->
    <link href="../css/EditCarsAdminPage.css" rel="stylesheet">
</head>
<body>
    <%@include file="../HeaderAndFooter/AdminHeader.jsp"%>
    <%
        Integer carID = Integer.parseInt(request.getParameter("carId"));

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try{
            connection = ConnectionDataBase.connectToDataBase();
            preparedStatement = connection.prepareStatement("SELECT OutsidePicture1, OutsidePicture2, OutsidePicture3, InsidePicture1, InsidePicture2, InsidePicture3 from automobilislike WHERE ID = ?");
            preparedStatement.setInt(1,carID);
            resultSet = preparedStatement.executeQuery();

            CarPictures carPictures = new CarPictures();
            if(resultSet.next()){
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

        <div class="container">
            <%
                String carId = request.getParameter("carId");
                int carIDD = Integer.parseInt(carId);

                String query = "SELECT * FROM automobili WHERE ID = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, carIDD);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    Car car = new Car(
                            resultSet.getInt("ID"),
                            resultSet.getString("CarName"),
                            resultSet.getString("CarAge"),
                            resultSet.getInt("Kilometers"),
                            resultSet.getString("Engine"),
                            resultSet.getString("CarText"),
                            resultSet.getString("CarDescription")
                    );
            %>
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Car Name</th>
                    <th scope="col">Car age</th>
                    <th scope="col">Kilometers</th>
                    <th scope="col">Engine</th>
                    <th scope="col">Car text</th>
                    <th scope="col">Car description</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><%= car.getId() %></td>
                    <td><%= car.getCarName()%></td>
                    <td><%= car.getCarAge() %></td>
                    <td><%= car.getKilometers() %></td>
                    <td><%= car.getEngine() %></td>
                    <td><%= car.getCarText() %></td>
                    <td><%= car.getCarDescription() %></td>
                </tr>
                </tbody>
            </table>
            <form action="../UpdateCarNameServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <label class="label">Car name update</label>
                <input class="text" type="text" name="CarNameUpdate" required>
                <button type="submit" class="">Change car name!</button>
            </form>
            <form action="../UpdateCarAgeServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <label class="label">Update the car age</label>
                <input class="text" type="text" name="UpdateCarAge" required>
                <button type="submit" class="">Update car age!</button>
            </form>
            <form action="../UpdateKilometersServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <label class="label" >Update the kilometers</label>
                <input class="text" type="text" name="UpdateKilometers" required>
                <button type="submit" class="">Update the kilometers!</button>
            </form>
            <form action="../UpdateCarEngineServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <label class="label" >Update the car engine</label>
                <input class="text" type="text" name="UpdateCarEngine" required>
                <button type="submit" class="">Update the car engine!</button>
            </form>
            <form action="../UpdateCarTextServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <label class="label">Update the first sentece of the car description</label>
                <textarea class="text" name="updateCarText" rows="4" cols="50" required><%= car.getCarText()%></textarea>
                <button type="submit" class="">Update car text!</button>
            </form>
            <form action="../UpdateCarDescriptionServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <label class="label">Update the description text</label>
                <textarea class="text" name="UpdateCarDescription" rows="4" cols="50" required><%=car.getCarDescription() %></textarea>
                <button type="submit" class="">Update car description text!</button>
            </form>
            <form action="../DeleteCarAdminServlet" method="POST" class="Form">
                <input type="hidden" name="carId" value="<%= car.getId() %>">
                <button type="submit" class="">Delete the car!</button>
            </form>
            <%
                    }
                }
                catch (Exception e) {
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
            %>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
