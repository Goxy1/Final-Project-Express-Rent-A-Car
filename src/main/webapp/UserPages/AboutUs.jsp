<%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 4.1.2024.
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About us!</title>
    <link href="../css/AboutUs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%@include file="../HeaderAndFooter/Navbar.jsp"%>
</head>
<body>
    <div class="wrapper">
        <div class="background-container">
            <div class="bg-1"></div>
            <div class="bg-2"></div>
        </div>
        <div class="about-container">
            <div class="image-container">
                <img src="../img/AboutUs.jpg" alt="Car lot">
            </div>

            <div class="text-container">
                <h1>About us</h1>
                <p>Welcome to Express Rent A Car, the epitome of luxury in car rentals. We specialize in offering an exclusive fleet of high-end vehicles for those who value sophistication and comfort.
                    Each car in our collection is meticulously maintained, ensuring peak performance and unparalleled luxury.</p><br><br>
                <p>Our team is committed to exceptional service, providing a seamless rental experience tailored to your personal needs.
                    Safety and excellence are at the core of our operations, with every vehicle undergoing rigorous checks for your peace of mind.</p><br><br>
                <p>Choose Express Rent A Car for your next journey and experience the perfect blend of luxury, comfort, and style.
                    Elevate your travel with a car that's not just a means of transportation, but a part of your unforgettable adventure.</p><br><br>
                <a href="../UserPages/OverviewUserPage.jsp">Explore our collection</a>
            </div>
        </div>
    </div>
</body>
</html>
