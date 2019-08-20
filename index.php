<?php
error_reporting(0);
session_start();
if($_SESSION['level'] == 'Admin'){
	header("Location:pages/admin/index.php");
}
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Sign In | Quick Laundry</title>
    <!-- Favicon-->
    <link rel="icon" href="../../favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Quick<b>Laundry</b></a>
            <small> One Stop Solution </small>
        </div>
        <div class="card">
            <div class="body">
<?php 

    include("pages/admin/koneksi.php");

    if(isset($_POST['log'])){

    $username = $_POST['username'];
    $password = $_POST['password'];

        $query = mysqli_query($koneksi, "SELECT * FROM tb_user WHERE username='$username' AND password='$password'");
        $cek = mysqli_num_rows($query);

            if($cek <= 0){
            echo '<div class="alert alert-danger"> login Gagal Tidak ditemukan Username ! </div>';
            }elseif ($row = mysqli_fetch_assoc($query)) {
                if($row['level'] == "Admin"){
                $_SESSION['username'] = $username;
                $_SESSION['level'] = 'Admin';
                header('location: pages/admin/index.php');
                }else if($row['level'] == "Owner"){
                $_SESSION['username'] = $username;
                $_SESSION['level'] = "Owner";
                header('location: pages/owner/index.php');
            }else{
                echo '<div class="alert alert-danger"> Login gagal username atau password salah !.</div>';
                echo "<meta http-equiv='refresh' content='0; url=index.php'>";
            }
        }
    }

?>			
                <form id="sign_in" method="POST">
                    <div class="msg">Sign in to start your session</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="username" placeholder="Username" required autofocus>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4">
                            <button class="btn btn-block bg-pink waves-effect" type="submit" name="log">SIGN IN</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Jquery Core Js -->
    <script src="plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="plugins/node-waves/waves.js"></script>

    <!-- Validation Plugin Js -->
    <script src="plugins/jquery-validation/jquery.validate.js"></script>

    <!-- Custom Js -->
    <script src="js/admin.js"></script>
    <script src="js/pages/examples/sign-in.js"></script>
</body>

</html>