<?php

session_start();
require_once('./php/config.php');

error_reporting(-1);
ini_set("display_errors", "1");
ini_set("log_errors", 1);
ini_set("error_log", "./logs/default.logs");

if ( !$_SESSION['loggedin']){
    header('Location: ./index.php');
} else {
    require_once('./php/User.php');
    $user = new Professor($_SESSION['userid'], $db);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include("./includes/head-tag.inc.php"); ?>
</head>
<body>
    <?php include("./includes/navbar.inc.php"); ?>
    <div class="container-fluid tab-content">

        <!-- dont change the order here -->
        <?php include('./includes/professor/grades.inc.php'); ?>

        <div id="Profile" class="tab-pane fade active show">
        <div class="row">
            <?php include("./includes/common/profile.inc.php"); ?>
            <?php include('./includes/professor/publish.inc.php'); ?>
        </div>
        </div>
        
    </div>
    <?php include("./includes/scripts.inc.php"); ?>
</body>
</html>