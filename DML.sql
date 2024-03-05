
SELECT distinct student_name
FROM enrolled 
NATURAL JOIN student  
NATURAL JOIN semester_course 
WHERE level = 'SR' AND prof_id = 1;


SELECT student_name, name
FROM enrolled e, student s, course c
WHERE e.student_id = s.student_id
AND e.course_code = c.course_code;




SELECT p.prof_name
FROM professor p
JOIN semester_course sc ON p.prof_id = sc.prof_id
GROUP BY p.prof_id, p.prof_name
HAVING COUNT(*) < 5;



SELECT STUDENT_NAME
FROM student AS S
WHERE
	NOT EXISTS(
    (SELECT COURSE_CODE
    FROM semester_course
    WHERE PROF_ID=2)
    EXCEPT
    (SELECT COURSE_CODE
    FROM enrolled AS E
    WHERE E.STUDENT_ID=S.STUDENT_ID)
);


SELECT p.prof_id, p.prof_name
FROM professor p, semester_course sc
WHERE p.prof_id = sc.prof_id
AND p.dept_id IN (1, 2, 3, 4)
GROUP BY p.prof_id, p.prof_name
HAVING COUNT(*) < 2;



SELECT c.name, c.course_code, p.prof_name, p.prof_id
FROM course c
JOIN semester_course sc ON c.course_code = sc.course_code
JOIN professor p ON sc.prof_id = p.prof_id
GROUP BY c.course_code, p.prof_id
HAVING COUNT(*) >= 2;