<?php
    session_start();

    require_once('./config.php');

    if (isset($_SESSION['loggedin']) && $_SESSION['loggedin']){

        if ($_SERVER["REQUEST_METHOD"] == "GET"){
            
            $email = $_GET['email'];
            $password = $_GET['password'];
            $id = $_SESSION['userid'];
            $table = $_SESSION['role'] == 'professor'? 'professors':'students';

            $stmt = $db->prepare('update table :table set :key = :value where id = :id ;');
            $stmt->bindParam(':table', $table);
            $stmt->bindParam(':id', $id);

            if ($email){
                $stmt->bindParam(':key', 'email');
                $stmt->bindParam(':value', $email);
                if ( $stmt->execute()){
                    echo json_encode(array(
                        'status' => true,
                        'description' => 'Updated Successfully'
                    ));
                }
            } else if ($password){
                $stmt->bindParam(':key', 'password');
                $stmt->bindParam(':value', $password);
                if ( $stmt->execute()){
                    echo json_encode(array(
                        'status' => true,
                        'description' => 'Updated Successfully'
                    ));
                }
            } else {
                echo json_encode(array(
                    'status' => false,
                    'description' => 'No Value is Passed !! ' . $_GET['email'] . ' ' . $_GET['password']
                ));
            }
        
        } else {
            echo json_encode(array(
                    'status' => false,
                    'description' => 'Resource Not Accessed with GET Method'
            ));
        }
    } else {
        echo json_encode(array(
            'status' => false,
            'description' => 'User Not Logged In'
        ));
    }
?>