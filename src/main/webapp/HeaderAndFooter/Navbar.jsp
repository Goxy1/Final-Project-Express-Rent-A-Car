<!DOCTYPE html>
<html>
<head>
    <title>Sidebar Navigation</title>
<%--    <link rel="stylesheet" type="text/css" href="../css/navbar.css">--%>
    <link rel="stylesheet" href="../css/NavBar.css">
    <link rel="stylesheet" type="text/css" href="../css/menutoggleNavbar.css">
</head>
<body>
<div class="sidebar">
    <ul class="menu">
        <li><a href="../UserPages/OverviewUserPage.jsp">Express rent a car</a></li>
        <li><a href="../UserPages/OverviewUserPage.jsp">Home</a></li>
        <li><a href="../UserPages/AboutUs.jsp">About</a></li>
        <li><a href="../UserPages/MyReservations.jsp">My Reservations</a></li>
        <li><a href="../UserPages/ContactUs.jsp">Contact</a></li>
        <li><a href="../LogOutServlet">Log out</a></li>
    </ul>
</div>
<div class="menu-toggle">
    <span></span>
    <span></span>
    <span></span>
</div>
<script src="../js/navbarAnimation.js"></script>
</body>
</html>

