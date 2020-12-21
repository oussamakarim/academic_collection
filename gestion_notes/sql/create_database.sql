-- create database
create database grades;
use grades;
-- professors tables
create table professors (
  id int primary key not null auto_increment,
  username varchar(30) not null,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  email varchar(60) not null,
  passphrase varchar(45) not null
);

-- students table
create table students (
  id int primary key not null auto_increment,
  username varchar(30) not null,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  email varchar(60) not null,
  passphrase varchar(45) not null,
  class_id int not null
);

-- classes table
create table classes (
    id int primary key not null auto_increment,
    class_name varchar(30) not null,
    class_full_name varchar(50) not null
);

-- courses table
create table courses (
    id int primary key not null auto_increment,
    course_name varchar(45) not null,
    course_semester int default(1)
);

-- notifications table
create table notifications (
    id int primary key not null auto_increment,
    notification_content varchar(300) not null,
    notification_status varchar(15) not null,
    student_id int not null,
    course_id int not null
);

-- grades tables
create table grades (
    student_id int not null,
    course_id int not null,
    first_test int not null,
    second_test int not null,
    course_grade int not null
);

-- teaching ta
create table teaching (
    class_id int not null,
    professor_id int not null,
    course_id int not null
);

-- adding constraints
alter table students add constraint student_fk_class_id foreign key(class_id) references classes(id);
alter table notifications add constraint notif_fk_student foreign key(student_id) references students(id);
alter table notifications add constraint notif_fk_course foreign key(course_id) references courses(id);
alter table grades add constraint grade_composite_pk primary key(student_id, course_id);
alter table grades add constraint grade_fk_student foreign key(student_id) references students(id);
alter table grades add constraint grade_fk_course foreign key(course_id) references courses(id);
alter table teaching add constraint grades_composite_pk primary key(class_id, professor_id, course_id);
alter table teaching add constraint teaching_fk_class_id foreign key(class_id) references classes(id);
alter table teaching add constraint teaching_fk_proffessor_id foreign key(professor_id) references professors(id);
alter table teaching add constraint teaching_fk_course_id foreign key(course_id) references courses(id);