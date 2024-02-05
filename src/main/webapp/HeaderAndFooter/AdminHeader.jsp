<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> <!--link za bootstrap 5.0-->
    <link href="../css/ManagerNavBar.css" rel="stylesheet">
</head>
<header>
    <div class="container">
        <header class = "row">
            <div class = "col-md-10">
                <header>
                    <div class = "page-header">
                        <h3><a href = "../AdminPages/OverviewAdminPage.jsp"><img src = "../img/logo.jpg" alt="Our company logo"></a><small>Express Rent A Car</small></h3>
                    </div>
                </header>
            </div>
        </header>
    </div>
    <br>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../AdminPages/OverviewAdminPage.jsp">Home Page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../AdminPages/ShowReservationAdminPage.jsp">Show reservation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../AdminPages/ShowUsersAdminPage.jsp">Show users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../AdminPages/AddACarAdminPage.jsp">Add a car</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="../LogOutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>