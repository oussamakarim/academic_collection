<?php
    $general_error = "";
    $username = $password = $account = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST"){

        $username = verify_input($_POST['username']);
        $password = verify_input($_POST['password']);
        $account = verify_input($_POST['account-type']);
    
        if ( !empty($username) && !empty($password) && !empty($account) ){
            check_user($username, $password, $account);
        }
    }



    function verify_input($str){
        $str = trim($str);
        $str = stripslashes($str);
        $str = htmlspecialchars($str);
        return $str;
    }
    function check_user($username, $password, $account){
	    global $general_error;
	    try {
            $db = new PDO("mysql:host=localhost;dbname=grades", 'khalil', 'Helloworld%123');
        } catch (Exception $e ){
            error_log($_SERVER['PHP_SELF']. " " . $e->getMessage(), 3, 'logs/login.logs');
            return false;
        }

        // prepare query based on account type 
	    if ( $account == 'professor' ){
            $stmt = $db->prepare("select id, username, passphrase from professors where username = ? ;");
	    } elseif ( $account == 'student' ){
            $stmt = $db->prepare("select id, username, passphrase from students where username = ? ;");
	    } else {
            $general_error = "Cannot connect to server";
            error_log($_SERVER['PHP_SELF'] . " account-type is not professor nor student", 3, 'logs/login.logs');
		    return false;
        }
        
        $stmt->bindValue(1, $username);
        $result = $stmt->execute();
        $query_result = $stmt->fetch(PDO::FETCH_ASSOC);

	    if ( ! $query_result ){
            $general_error = "User Not Found";
            error_log($_SERVER['PHP_SELF'] . " Query fetching return false", 3, 'logs/login.logs');
		    return false;
	    } else {
		    if ( $query_result['username'] != $username ){
                $general_error = "User Not Found";
                return false;
            } else {
                if ( $query_result['passphrase'] != $password ){
                    $general_error = "Password is wrong";
                    return false;
                } else {
                    session_start();
                    $_SESSION['loggedin'] = true;
                    $_SESSION['userid'] = $query_result['id'];
                    $_SESSION['role'] = $account;
                    if ($account == 'professor'){
                        header("Location: ./professor.php");
                    } else {
                        header("Location: ./student.php");
                    }
                    return true;
                }
            }
        }
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gestionnaire de notes</title>

    <!-- bootsrap cdn -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- custom bootstrap with css -->
    <link rel="stylesheet" href="css/main.css">

    <style>
        body {
            background-image: url('./media/img/background.jpg') !important;
        }
        span#username-error, span#password-error, span#account-error {
            color: #ff0000;
            visibility: hidden;
        }
        .bg-img {
            position: absolute;
            display: inline-block;
            width: 100vw;
            height: 100vh;
            z-index: -10;
        }
        body, html {
            background-image: url('http://cocoin.nl/wp-content/uploads/2015/08/light-blue-wallpaper-hd-quality.jpg') !important;
        }
        form {
            background-color: #C4D8FF !important;
            border-radius: 20px !important;
            border: 3px solid #138496 !important;
        }
        form img {
            display: inline-block;
            width: 40%;
            height: auto;
            margin-left: calc(60% / 2);
        }
        .modal-header, .modal-body, .modal-footer {
            background-color: #c4d8ff !important;
            font-weight: 700;
        }
        .modal-body {
            border-bottom: 1px solid #138496 ;
            border-top: 1px solid #138496;
        }
    </style>
</head>
<body>
    <div id="test" class="container-fluid">
        <div class="row">
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ;?>" class="col-md-4 mx-auto mt-4 rounded  p-4 shadow-lg" method="POST">

                    <!-- login header -->
                    <!-- <h1 class="text-ligh text-center">Login</h1> -->
                    <img src="./media/icons/ensak.png" alt="Login">
                    <br>
                    <span class="text-danger font-weight-bold"><?php echo $general_error; ?></span>
                    
                <!-- username input -->
                <div class="input-group mt-3">
                    <div class="input-group-prepend"><span class="input-group-text">Username:</span></div>
                    <input id="username" type="text" class="form-control" name="username" value="<?php echo $username;  ?>">
                </div>
                <span id="username-error" class="text-danger font-weight-bold">* Username is required.</span>

                <!-- password input -->
                <div class="input-group mt-3">
                    <div class="input-group-prepend"><span class="input-group-text">Password</span></div>
                    <input id="password" type="password" name="password" class="form-control">
                </div>
                <span id="password-error" class="text-danger font-weight-bold">* Password is required.</span>


                <!-- account type buttons -->
                <div class="input-group mt-3">
                <div class="custom-control custom-radio custom-control-inline">
                    <input id="professor" type="radio" class="custom-control-input" value="professor" name="account-type">
                    <label for="professor" class="ml-2 custom-control-label">Professor</label>
                </div>    
                    <div class="custom-control custom-radio custom-control-inline">
                        <input id="student" type="radio" class="custom-control-input" value="student" name="account-type">
                        <label for="student" class="ml-4 custom-control-label">Student</label>
                    </div>
                </div>
                <span id="account-error" class="text-danger font-weight-bold">* Account type is required.</span>


                <!-- login & create account buttons -->
                <input id="submit" type="submit" value="Login" class="btn btn-primary w-100">
                <input type="button" value="Create An Account" data-toggle="modal" data-target="#create-account" class="btn btn-danger w-100 mt-3">


                <!-- modal toggle output -->
                <div class="modal" id="create-account">
                    <div class="modal-dialog">
                        <dig class="modal-content">
                            <!-- modal header -->
                            <div class="modal-header">
                                <h4 class="text-dark">Create An Account</h4>
                                <button class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- modal body -->
                            <div class="modal-body">
                                <p class="text-danger">You Need To Contact Your Administrator</p>
                            </div>

                            <!-- modal footer -->
                            <div class="modal-footer">
                                <button class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </dig>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- bootstrap cdn -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/login.js"></script>
</body>
</html>
