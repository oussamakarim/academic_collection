<?php

define('DBHOST', 'localhost');
define('DBUSER', 'khalil');
define('DBPASSWORD', 'Helloworld%123');
define('DBNAME', 'grades');

define('ROOTPATH', './');  // from the point of view of index.php
define('INCPATH', ROOTPATH . 'includes/');
define('JSPATH', ROOTPATH . 'js/');
define('PHPPATH', ROOTPATH . 'php/');
define('MEDIAPATH', ROOTPATH . 'media/');
define('CSSPATH', ROOTPATH . 'css/');

try {
    $dsn = "mysql:host=" . DBHOST . ";dbname=" . DBNAME;
    $db = new PDO($dsn, DBUSER, DBPASSWORD);
} catch (Exception $e){
    die("Cannot connect to database");
}
?>
