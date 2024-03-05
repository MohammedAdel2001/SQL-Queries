
CREATE DATABASE Lab10_Database;


CREATE TABLE department (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(255)
);


CREATE TABLE student (
  student_id INT PRIMARY KEY,
  student_name VARCHAR(250),
  major VARCHAR(250),
  level VARCHAR(250),
  age INT
);


CREATE TABLE professor (
  prof_id INT PRIMARY KEY,
  prof_name VARCHAR(250),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);


CREATE TABLE course (
  course_code VARCHAR(250) PRIMARY KEY,
  name VARCHAR(250)
);


CREATE TABLE semester_course (
  course_code VARCHAR(250) ,
  quarter VARCHAR(250) ,
  
  prof_id int,
  year int ,
  PRIMARY KEY (course_code, quarter, year),
  FOREIGN KEY (course_code) REFERENCES course(course_code),
  FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);


CREATE TABLE enrolled (
  student_id int,
  year int,
  course_code VARCHAR(250),
  quarter VARCHAR(250),
  
  enrolled_at DATE,
  PRIMARY KEY (student_id, course_code, quarter, year),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (course_code,quarter,year) REFERENCES semester_course(course_code,quarter,year) 
);