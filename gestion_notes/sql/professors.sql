-- get courses be class
select courses.id, courses.course_name, courses.course_semester
from courses
	inner join teaching on teaching.course_id = courses.id
where teaching.class_id = 4;


-- get classes by professors
select classes.id,
        classes.class_name,
        classes.class_full_name
from teaching
    inner join classes
        on teaching.class_id = classes.id
where teaching.professor_id = ?;

-- get students grades by course
select students.id as 'student_id',
        students.first_name,
        students.last_name,
        grades.first_test,
        grades.second_test,
        grades.course_grade,
        courses.id as 'course_id'
from students
    inner join grades
        on students.id = grades.student_id
    inner join courses
        on grades.course_id = 1;