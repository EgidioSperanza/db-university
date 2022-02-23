-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS "Anno Accademico", COUNT(id) AS "Studenti Iscritti"
FROM `students`
GROUP BY YEAR(`enrolment_date`);
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address` AS " Office Address", COUNT(`id`) AS "Teachers"
FROM `teachers`
GROUP BY `office_address`
-- 2.Bonus Offices Number
SELECT COUNT(DISTINCT `office_address`) AS "Numero di Uffici"
FROM `teachers`
-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id` AS "Esame", AVG(`vote`) AS "Media Voti"
FROM `exam_student`
GROUP by `exam_id`
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id` AS "Dipartimenti", COUNT(id) AS "Corsi di Laurea"
FROM `degrees`
GROUP BY `department_id`