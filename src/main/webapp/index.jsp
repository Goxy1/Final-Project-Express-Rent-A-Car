
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/index.css" rel="stylesheet"/>
    <title>Log in</title>
</head>
<body>
<div class="blob"></div>
<div class="wrapper">
    <form action="LogInUserServlet" method="POST">
        <h2>Log in</h2>
        <div class="input-box">
            <span class="icon"><ion-icon name="mail-outline"/></span>
            <input type="text" name="email" required>
            <label>Email</label>
        </div>
        <div class="input-box">
            <span class="icon"><ion-icon name="lock-closed-outline"/></span>
            <input type="password" name="password" required>
            <label>Password</label>
        </div>
        <button type="Submit">Login</button>
        <div class="signup-box" onclick="redirectToSignUp()">
            Sign up
        </div>
    </form>
</div>
<script>
    function redirectToSignUp() {
        // Ovde dodajte URL za stranicu za registraciju
        window.location.href = 'SignUpPage.jsp';
    }
</script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
