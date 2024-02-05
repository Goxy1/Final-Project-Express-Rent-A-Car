<%--
  Created by IntelliJ IDEA.
  User: guros
  Date: 4.1.2024.
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact us!</title>
    <link href="../css/contactUs.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<%@include file="../HeaderAndFooter/Navbar.jsp"%>
<div class="background">
    <div class="container">
        <div class="screen">
            <div class="screen-header">
                <div class="screen-header-left">
                    <div class="screen-header-button close"></div>
                    <div class="screen-header-button maximize"></div>
                    <div class="screen-header-button minimize"></div>
                </div>
                <div class="screen-header-right">
                    <div class="screen-header-ellipsis"></div>
                    <div class="screen-header-ellipsis"></div>
                    <div class="screen-header-ellipsis"></div>
                </div>
            </div>
            <div class="screen-body">
                <div class="screen-body-item left">
                    <div class="app-title">
                        <span>CONTACT</span>
                        <span>US</span>
                    </div>
                    <div class="app-contact">CONTACT INFO : +12 34 567 890</div>
                </div>
                <div class="screen-body-item">
                    <div class="app-form">
                        <div class="app-form-group">
                            <input class="app-form-control" placeholder="NAME" value="CONTACT US" readonly>
                        </div>
                        <div class="app-form-group">
                            <input class="app-form-control" placeholder="EMAIL">
                        </div>
                        <div class="app-form-group">
                            <input class="app-form-control" placeholder="CONTACT NO">
                        </div>
                        <div class="app-form-group message">
                            <input class="app-form-control" placeholder="MESSAGE">
                        </div>
                        <div class="app-form-group buttons">
                            <button id="homeButton" class="app-form-button">CANCEL</button>
                            <button id="reloadButton" class="app-form-button">SEND</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<script>
    document.getElementById('reloadButton').addEventListener('click', function() {
        window.location.href="../UserPages/InformationSent.jsp";
    });

    document.getElementById('homeButton').addEventListener('click', function() {
        window.location.href = "../UserPages/OverviewUserPage.jsp"; // URL stranice na koju želite da pređete
    });

</script>