<?php
    session_start();

    require_once('./config.php');


    if (isset($_SESSION['loggedin']) && $_SESSION['loggedin']){

        if ($_SERVER["REQUEST_METHOD"] == "GET"){
            $stmt = $db->prepare('select courses.course_name,
                                    grades.first_test,
                                    grades.second_test,
                                    grades.course_grade
                                    from courses 
                                    inner join grades
                                    on courses.id = grades.course_id
                                    where grades.student_id = :id');
            $stmt->bindParam(":id", $_SESSION['userid']);
            $stmt->execute();
            $data = array();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                array_push($data, array(
                    'courseName' => $row['course_name'],
                    'firstTest' => $row['first_test'],
                    'secondTest' => $row['second_test'],
                    'grade' => $row['course_grade'],
                    'status' => ($row['course_grade'] > 10)? 'Pass' : 'Fail'
                ));
            }
            echo json_encode(array(
                'status' => true,
                'description' => 'everythign is okey',
                'data' => $data
            ));
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