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
        function phoneValidation() {
            var inputtxt = document.getElementById('phone').value;
            for (i in inputtxt) {
                if (inputtxt[i] < '0' || inputtxt[i] > '9') {
                    alert("Enter a valid email address");
                    document.getElementById('phone').value = '';
                }
            }
        }
        function validateemail() {
            var x = document.getElementById('email').value;
            var atposition = x.indexOf("@");
            var dotposition = x.lastIndexOf(".");
            if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length) {
                alert("Enter a valid e-mail address");
                document.getElementById('email').value = '';
            }
        }
        function passValidation() {
            console.log(document.getElementById('password').value);
            console.log(document.getElementById('confirmpassword').value);
            if (document.getElementById('password').value != document.getElementById('confirmpassword').value) {
                alert('Password and confirm password should be same');
                document.getElementById('confirmpassword').value = '';
            }
        }
    </script>
    <title>Register</title>
</head>

<body>
    <div class="container">
        <div class="row">

            <div class="col-lg-6 col-xs-12">
                <img src="pic.png" alt="Image here" class="img img-fluid">
            </div>

            <div class="col-lg-6">
                <div class="container h-100">
                    <div class="row h-100 justify-content-center align-items-center">
                        <div class="col-lg-12">

                            <form action="registerHandler.jsp" method="POST">
                                <!-- Username -->
                                <div class="form-group row">
                                    <label for="susername" class="col-lg-4 col-form-label">Username</label>
                                    <div class="col-lg-8">
                                        <input type="text" name="susername" id="susername"
                                            class="form-control form-control-sm" required>
                                    </div>
                                </div>
                                <!-- Password -->
                                <div class="form-group row">
                                    <label for="password" class="col-lg-4 col-form-label">Password</label>
                                    <div class="col-lg-8">
                                        <input type="password" name="password" id="password"
                                            class="form-control form-control-sm" required>
                                    </div>
                                </div>
                                <!-- Confirm Password -->
                                <div class="form-group row">
                                    <label for="confirmpassword" class="col-lg-4 col-form-label">Confirm
                                        Password</label>
                                    <div class="col-lg-8">
                                        <input type="password" name="confirmpassword" id="confirmpassword"
                                            class="form-control form-control-sm" onchange='passValidation()' required>
                                    </div>
                                </div>
                                <!-- Email -->
                                <div class="form-group row">
                                    <label for="email" class="col-lg-4 col-form-label">Email</label>
                                    <div class="col-lg-8">
                                        <input type="email" name="email" id="email" class="form-control form-control-sm"
                                            onchange='validateemail()' required>
                                    </div>
                                </div>
                                <!-- Phone -->
                                <div class="form-group row">
                                    <label for="phone" class="col-lg-4 col-form-label">Phone</label>
                                    <div class="col-lg-8">
                                        <input type="phone" name="phone" id="phone" class="form-control form-control-sm"
                                            onchange="phoneValidation();" required>
                                    </div>
                                </div>
                                <!-- Register -->
                                <div class="form-group row justify-content-center">
                                    <div class="col-xs-auto">
                                        <button type="submit" class="btn btn-sm btn-primary"
                                            name="register">Register</button>
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