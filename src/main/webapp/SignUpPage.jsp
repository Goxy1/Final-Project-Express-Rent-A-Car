<!DOCTYPE html>
<html>
<head>
  <title>Sign Up Form</title>
  <!-- Dodajte stilove ili linkove ka CSS fajlovima ovde ako je potrebno -->
  <link href="css/SignUp.css" rel="stylesheet"/>
</head>
<body><div class="blob"></div>
<div class="wrapper">
  <form action="SignUpServlet" method="POST">
    <h2>Sign up</h2>
    <div class="input-box">
      <span class="icon"><ion-icon name="mail-outline"/></span>
      <input type="text" name="firstName" required>
      <label>First Name</label>
    </div>
    <div class="input-box">
      <span class="icon"><ion-icon name="lock-closed-outline"/></span>
      <input type="text" name="lastName" required>
      <label>Last name</label>
    </div>
    <div class="input-box">
      <span class="icon"><ion-icon name="lock-closed-outline"/></span>
      <input type="text" name="address" required>
      <label>Address</label>
    </div>
    <div class="input-box">
      <span class="icon"><ion-icon name="lock-closed-outline"/></span>
      <input type="text" name="email" required>
      <label>Email</label>
    </div>
    <div class="input-box">
      <span class="icon"><ion-icon name="lock-closed-outline"/></span>
      <input type="text" name="phoneNumber" required>
      <label>Phone number</label>
    </div>
    <div class="input-box">
      <span class="icon"><ion-icon name="lock-closed-outline"/></span>
      <input type="password" name="password" required>
      <label>Password</label>
    </div>
    <button type="Submit">Sign up</button>
</body>
</html>
