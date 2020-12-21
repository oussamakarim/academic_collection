<?php
    session_start();

    require_once('./config.php');

    if (isset($_SESSION['loggedin']) && $_SESSION['loggedin']){

        if ($_SERVER["REQUEST_METHOD"] == "GET"){
            $student_id = $_GET['student-id'];
            $course_id = $_GET['course-id'];
            $first_test = $_GET['first-test'];
            $second_test = $_GET['second-test'];
            $grade = ($first_test + $second_test)/2;

            $stmt = $db->prepare('update grades set first_test = :first , second_test = :second , course_grade = :grade where student_id = :student and course_id = :course ;');

            $stmt->bindParam(':first', $first_test);
            $stmt->bindParam(':second', $second_test);
            $stmt->bindParam(':grade', $grade);
            $stmt->bindParam(':student', $student_id);
            $stmt->bindParam(':course', $course_id);

            if ( $stmt->execute() ){
                echo json_encode(array(
                    'status' => true,
                    'description' => 'Grade Updated Successfully'
                ));
            } else {
                echo json_encode(array(
                    'status' => false,
                    'description' => 'Grades Not Updated, Refrech Page'
                ));
            }
        } else {
            echo json_encode(array(
                    'status' => false,
                    'description' => 'Resource Not Accessed with Post Method'
            ));
        }
    } else {
        echo json_encode(array(
            'status' => false,
            'description' => 'User Not Logged In'
        ));
    }
?>