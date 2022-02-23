-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT CONCAT(`students`.`name`, " ", `students`.`surname`) AS "Studenti iscritti ad Economia"
FROM `students`
INNER JOIN `degrees` 
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` LIKE '%economia%'
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
INNER JOIN `departments`
ON `department_id`= `degrees`.`department_id`
WHERE `departments`.`name` LIKE '%neuroscienz%'
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT CONCAT(`teachers`.`name`, " ", `teachers`.`surname`) AS "Teacher", `courses`.`name` AS "Course"
FROM `teachers`
INNER JOIN `course_teacher` 
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses` 
	ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`id`=44
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT CONCAT(`students`.`surname`, " ", `students`.`name`) AS "Student", `departments`.`name` AS "Department", `degrees`.`name` AS "Degree", `degrees`.`level` AS "Level" 
FROM `students`
INNER JOIN `degrees` 
	ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments` 
	ON `degrees`.`department_id` = `departments`.`id`
ORDER BY CONCAT(`students`.`surname`, " ", `students`.`name`)
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS "Degree", `courses`.`name` AS `courses`, CONCAT(`teachers`.`surname`, " " , `teachers`.`name`)
FROM `courses`
INNER JOIN `degrees`
	ON `courses`.`degree_id`=`degrees`.`id`
INNER JOIN `course_teacher` 
	ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers` 
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
ORDER BY `degrees`.`name`
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT CONCAT(`teachers`.`surname`, " " , `teachers`.`name`) AS "Teachers of Mathematics Department"
FROM `teachers`
INNER JOIN `course_teacher`
	ON `course_teacher`.`teacher_id`=`teachers`.`id`
INNER JOIN `courses`
	ON `courses`.`id`=`course_teacher`.`course_id`
INNER JOIN `degrees` 
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments` 
	ON `degrees`.`department_id` = `departments`.`id`
WHERE
    `departments`.`id` = 5
ORDER BY CONCAT(`teachers`.`surname`, " " , `teachers`.`name`)
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami
SELECT CONCAT(`students`.`surname`, " ", `students`.`surname`) AS "Students", 
        `courses`.`name` AS "Exam", 
        COUNT(`exam_student`.`exam_id`) AS "Attempts", 
        MAX(`exam_student`.`vote`)
FROM `students`
INNER JOIN `exam_student`
	ON `exam_student`.`student_id`=`students`.`id`
INNER JOIN `exams`
	ON `exams`.`id`=`exam_student`.`exam_id`
INNER JOIN `courses`
	ON `courses`.`id`= `exams`.`course_id`
WHERE `exam_student`.`vote`>=18
GROUP BY CONCAT(`students`.`surname`, " ", `students`.`name`), `courses`.`name`
ORDER BY CONCAT(`students`.`surname`, " ", `students`.`name`)