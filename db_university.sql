-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990
ORDER BY `date_of_birth`;
-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT *
FROM `courses`
WHERE `cfu` > 10;
ORDER BY `name`;
-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE YEAR(CURRENT_DATE) - YEAR(`date_of_birth`) > 30
ORDER BY `date_of_birth`;
--OPPURE
SELECT *
FROM `students`
WHERE DATEDIFF(CURRENT_DATE, `date_of_birth`)> 30*365
ORDER BY `date_of_birth`;
-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM `courses`
WHERE `period` = 'I semestre'
    AND `year` = 1
ORDER BY `name` 
--OPPURE
SELECT *
FROM `courses`
WHERE `period` LIKE "I %"
    AND `year` = 1
ORDER BY `name` 
-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `date` = "2020/06/20"
    AND `hour` >= "14:00:00"
ORDER BY `hour`;
-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM `degrees`
WHERE `level` = 'magistrale'
ORDER BY `name`;
-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(id)
FROM `departments`;
-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`) 
FROM `teachers` 
WHERE `phone` IS NULL;