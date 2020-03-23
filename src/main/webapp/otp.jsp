<%@ page session="false" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script>
        function otpValidation() {
            var otp = document.getElementById('otp').value;
            if (isNaN(otp)) {
                document.getElementById('otp').value = '';
            } else if (otp < 100000) {
                document.getElementById('otp').value = '';
            }
        }
    </script>
    <title>OTP</title>
</head>

<body class="bg-light">
    <% 
    HttpSession session = request.getSession(false);
    if(session != null && session.getAttribute("uname") != null){ %>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <!-- Navbar content -->
        <a class="navbar-brand" href="home.jsp">E-Banking</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="myNavbar">
            <form action="operationController.jsp" class="form-inline" method="POST">
                <button class="btn btn-dark text-light" type="submit" name="operation" value="Home">Home</button>
                <button class="btn btn-dark text-light active" type="submit" name="operation"
                    value="Transfer">Transfer</button>
                <button class="btn btn-dark text-light" type="submit" name="operation"
                    value="Deposit">Deposit</button>
                <button class="btn btn-dark text-light" type="submit" name="operation"
                    value="Statements">Statements</button>
                <button class="btn btn-dark text-light" type="submit" name="operation" value="Apply">Apply</button>
            </form>
            <div class="ml-auto">
                <form action="logout.jsp" method="POST">
                    <button class="btn btn-sm btn-success" type="submit" name="logout">Logout</button>
                </form>
            </div>
        </div>

    </nav>
    <!-- Header end -->
    <div class="container">
        <div class="row mt-3">
            <div class="col-sm-6">
                <form action="otp_controller.jsp" method="POST">
                    <!-- OTP -->
                    <div class="form-group row">
                        <label for="otp" class="col-md-6 col-form-label">OTP</label>
                        <div class="com-md-6">
                            <input type="text" name="otp" id="otp"
                                class="form-control form-control-sm" required>
                        </div>
                    </div>
                    <!-- Verify -->
                    <div class="form-group row justify-content-center">
                        <div class="col-xs-auto">
                            <button type="submit" class="btn btn-sm btn-primary" value="Verify"
                                name="verify">Verify</button>
                        </div>
                    </div>
                    <!-- Message -->
                    <div class="form-group row justify-content-center">
                        <div class="col-xs-auto">
                            <span id="error_otp" name="error_otp" class="text-md" style="font-size: 13px;"></span>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%
    }else{
        %>
    <center>Session is invalid please login <a href="index.jsp">here</a></center>
    <%
    }
    %>
</body>

</html>