<?php
    session_start();

    require_once('./config.php');


    if (isset($_SESSION['loggedin']) && $_SESSION['loggedin']){

        if ($_SERVER["REQUEST_METHOD"] == "GET"){
            $course_id = $_GET['id'];

                $stmt = $db->prepare('select students.id,
                                        students.first_name, 
                                        students.last_name, 
                                        grades.first_test, 
                                        grades.second_test,
                                        (grades.first_test + grades.second_test)/2 as "grade"
                                    from students 
                                        inner join grades
                                            on grades.student_id = students.id
                                        inner join courses
                                            on courses.id = grades.course_id
                                    where courses.id = ?');
                $stmt->bindValue(1, $course_id);
                $result = $stmt->execute();
                $data = array(
                    'status' => true,
                    'description' => 'everything is okay',
                    'db' => $course_id,
                    'data' => array()
                );

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    array_push($data['data'], array(
                        'id' => $row['id'],
                        'firstName' => $row['first_name'],
                        'lastName' => $row['last_name'],
                        'firstTest' => $row['first_test'],
                        'secondTest' => $row['second_test'],
                        'grade' => $row['grade'],
                        'status' => ($row['grade'] > 10)? 'Pass':'Fail'
                    ));
                }
                
                echo json_encode($data);
           
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