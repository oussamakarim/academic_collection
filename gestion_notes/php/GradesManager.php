<?php
    require_once(PHPPATH . 'config.php');
    include_once(PHPPATH . 'User.php');

    class Classe{
        // class representing the class table on database
        public function __construct($id, $name, $full_name){
            $this->id = $id;
            $this->name = $name;
            $this->full_name = $full_name;
        }

        public function get_id(){return $this->id;}
        public function get_name(){return $this->name;}
        public function get_full_name(){return $this->full_name;}

    }

    class Course {
        // class representing the course table in database
        public function __construct($course_id, $course_name, $semester){
            $this->id = $course_id;
            $this->name = $course_name;
            $this->semester = $semester;
        }
        public function get_id(){return $this->id;}
        public function get_course_name(){return $this->name;}
        public function get_course_semester() {return $this->semester;}
    }

    class Grade {
        public function __construct($student, $course, $first_test, $second_test, $grade){
            $this->student = $student;
            $this->course = $course;
            $this->first_test = $first_test;
            $this->second_test = $second_test;
            $this->grade = $grade;
        }

        public function get_student(){return $this->student;}
        public function get_course(){return $this->course;}
        public function get_first_test(){return $this->first_test;}
        public function get_second_test(){return $this->second_test;}
        public function get_grade(){return $this->grade;}
    }


    // class that interact with database and retrieve data
    class GradesManager {
        public function __construct($user, $db){
            $this->user = $user;
            $this->db = $db;
        }

        public function get_classes(){
            $classes = array();

            $stmt = $this->db->prepare('select classes.id,
                                                classes.class_name,
                                                classes.class_full_name
                                        from professors
                                            inner join teaching
                                                on professors.id = teaching.professor_id
                                            inner join classes
                                                on teaching.class_id = classes.id
                                        where professors.id = ?;');
            $stmt->bindValue(1, $this->user->get_id());
            $stmt->execute();

            if ($stmt->rowCount()){
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    $class = new Classe($row['id'], $row['class_name'], $row['class_full_name']);
                    array_push($classes, $class);
                }
                return $classes;
            } else {
                return null;
            }
        }

        public function get_courses_by_class($class){
            $courses = array();

            $stmt = $this->db->prepare('select courses.id, courses.course_name, courses.course_semester
                                        from courses
                                            inner join teaching on teaching.course_id = courses.id
                                        where teaching.class_id = ? ;');
            $stmt->bindValue(1, $class->get_id());
            $stmt->execute();

            if ($stmt->rowCount()){
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $course = new Course($row['id'], $row['course_name'], $row['course_semester']);
                    array_push($courses, $course);
                }
                return $courses;
            } else {
                return null;
            }
        }

        public function get_students_grades_by_course($course){
            $students_grades = array();

            $stmt = $this->db->prepare('select students.id as "student_id",
                                                students.first_name,
                                                students.last_name,
                                                grades.first_test,
                                                grades.second_test,
                                                grades.course_grade,
                                                courses.id as "course_id",
                                                courses.course_semester,
                                                courses.course_name
                                        from students
                                            inner join grades
                                                on students.id = grades.student_id
                                            inner join courses
                                                on grades.course_id = ? ;');
            $stmt->bindValue(1, $course->get_id());
            $stmt->execute();

            if ( $stmt->rowCount()){
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    $student = new Student($row['student_id'], $this->db);
                    $course  = new Course($row['course_id'], $row['course_name'], $row['course_semester']);
                    $grade = new Grade($student, $course, $row['first_test'], $row['second_test'], $row['course_grade']);
                    array_push($students_grades, $grade);
                }

                return $students_grades;
            } else {
                return null;
            }
        }
    }
?>
