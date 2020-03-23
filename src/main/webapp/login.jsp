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

    <title>Login</title>
</head>

<body>
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-xs-12">
                <img src="pic.png" alt="Image here" class="img img-fluid">
            </div>

            <div class="col-md-6">
                <div class="container h-100">
                    <div class="row h-100 justify-content-center align-items-center">
                        <div class="col-md-12">

                            <form action="loginHandle.jsp" method="POST">
                                <!-- Username -->
                                <div class="form-group row">
                                    <label for="username" class="col-md-4 col-form-label">Username</label>
                                    <div class="col-md-8">
                                        <input type="text" name="username" id="username"
                                            class="form-control form-control-sm" required>
                                    </div>

                                </div>
                                <!-- Password -->
                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label">Password</label>
                                    <div class="col-md-8">
                                        <input type="password" name="password" id="password"
                                            class="form-control form-control-sm" required>
                                    </div>
                                </div>
                                <!-- Login -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-xs-auto">
                                        <button type="submit" class="btn btn-sm btn-primary" name="login">Login</button>
                                    </div>
                                </div>
                                <!-- Message -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-xs-auto">
                                        <span id="message" class="text-md" style="font-size: 13px;"></span>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

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
</body>

</html>