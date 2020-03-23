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

    <title>Home</title>
</head>

<body class="bg-light">
    <% 
    HttpSession session = request.getSession(false);
    if(session != null && session.getAttribute("uname") != null){ %>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <!-- Navbar content -->
        <a class="navbar-brand" href="home.jsp">E-Banking</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="myNavbar">
            <form action="operationController.jsp" class="form-inline" method="POST">
                <button class="btn btn-dark text-light active" type="submit" name="operation" value="Home">Home</button>
                <button class="btn btn-dark text-light" type="submit" name="operation" value="Transfer">Transfer</button>
                <button class="btn btn-dark text-light" type="submit" name="operation" value="Deposit">Deposit</button>
                <button class="btn btn-dark text-light" type="submit" name="operation" value="Statements">Statements</button>
                <!-- <button class="btn btn-dark text-light" type="submit" name="operation" value="Apply">Apply</button> -->
            </form>
            <div class="ml-auto">
                <form action="logout.jsp" method="POST">
                    <button class="btn btn-sm btn-success" type="submit" name="logout">Logout</button>
                </form>
            </div>
        </div>

    </nav>
    <!-- Body -->
    <div class="container">
        <div class="row m-3">
            <!-- Account summary -->
            <div class="col-sm-6">
                <div class="card bg-dark">
                    <div class="card-body">
                        <h5 class="card-title text-light">Account summary</h5>
                        <table class="table table-sm table-striped table-dark">
                            <tbody>
                                <tr>
                                    <td>Username</td>
                                    <td><%= session.getAttribute("uname") %></td>
                                </tr>
                                <tr>
                                    <td>Phone</td>
                                    <td><%= session.getAttribute("ph_number") %></td>
                                </tr>
                                <tr>
                                    <td>Amount</td>
                                    <td><%= session.getAttribute("amount") %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Usage graphs -->
        </div>
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    <%
    }else{
        %>
    <center>Session is invalid please login <a href="index.jsp">here</a></center>
    <%
    }
    %>
</body>

</html>