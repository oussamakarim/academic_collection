<?php 

    require_once('./config.php');

    if ( $_SERVER['REQUEST_METHOD'] == 'GET'){
        $keywords = $_GET['keywords'];
        if (strlen($keywords)){
            $data = array();
            $keywords = explode(' ', $keywords);
            foreach($keywords as $keyword){
                $stmt = $db->prepare('select distinct students.id, students.first_name, students.last_name, grades.first_test, grades.second_test, grades.course_grade, courses.id as \'course_id\', courses.course_name from students inner join grades on students.id = grades.student_id inner join courses on grades.course_id = courses.id where students.first_name like :pattern or students.last_name like :pattern ;');
                $pattern = "%$keyword%";
                $stmt->bindParam(':pattern', $pattern);
                $stmt->execute();

                if ( $stmt->rowCount()){
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                        array_push($data, array(
                            'studentId' => $row['id'],
                            'course_id' => $row['course_id'],
                            'courseName' => $row['course_name'],
                            'firstName' => $row['first_name'],
                            'lastName' => $row['last_name'],
                            'firstTest' => $row['first_test'],
                            'secondTest' => $row['second_test'],
                            'grade' => $row['course_grade']
                        ));
                    }
                }
            }
            if (count($data)){

                echo json_encode(array(
                    'status' => true,
                    'data' => $data
                ));
            } else {
                echo json_encode(array(
                'status' => false,
                'description' => 'Not Found'
            ));
            }
        } else {
            echo json_encode(array(
                'status' => false,
                'description' => 'Not Found'
            ));
        }
    } else {
        echo json_encode(array(
                'status' => false,
                'description' => 'Not Accessed with Get method'
            ));
    }

    ?>