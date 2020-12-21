-- get all courses of a student
select courses.name,
        courses.semester
from courses
    inner join teaching
        on courses.id = teaching.id_course
    inner join classes
        on teaching.id_class = classes.id
where classes.id = 1;

-- get grades for a course
