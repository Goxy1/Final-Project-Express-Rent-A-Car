<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a car!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> <!--link za bootstrap 5.0-->
</head>
<body>
<div class="container mx-auto">
    <div class="row">
        <div class="col-md-6">
            <form action="../AddACarAdminServlet" method="POST">
                <div class="mb-3">
                    <input type="text" name="CarName" required placeholder="Car name">
                </div>
                <div class="mb-3">
                    <input type="text" name="CarAge" required placeholder="Car age">
                </div>
                <div class="mb-3">
                    <input type="text" name="Kilometers" required placeholder="Kilometers">
                </div>
                <div class="mb-3">
                    <input type="text" name="Engine" required placeholder="Engine">
                </div>
        </div>
        <div class="col-md-6">
            <div class="mb-3">
                <input type="text" name="CarText" required placeholder="Car text">
            </div>
            <div class="mb-3">
                <input type="text" name="CarDescription" required placeholder="Car description">
            </div>
            <div class="mb-3">
                <input type="text" name="putanjaSlike" required placeholder="Image path">
            </div>
        </div>
        <div class="col-md-12 text-center">
            <a href="../AdminPages/OverviewAdminPage.jsp" class="btn btn-secondary">Back to Home</a>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        </form>
    </div>
</div>
</body>
</html>

<style>
    .container {
        margin: 20px auto;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    input {
        border-radius: 8px;
        padding: 10px;
        margin-bottom: 10px;
        width: 100%;
        border: 1px solid #ccc;
    }

    label {
        margin-bottom: 8px;
        font-size: 14px;
        display: block;
    }

    .btn-secondary {
        background-color: #ab1313;
        color: #fff;
        margin-right: 10px; /* Adjust spacing between buttons */
    }

    .btn-secondary:hover {
        background-color: #fc0606;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }



    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
