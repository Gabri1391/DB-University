-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT 
`degrees`.`name` AS 'corso',
`students`.`name` AS 'nome_studente' , 
`students`.`surname` AS 'cognome_studente' 
FROM `degrees` 
JOIN `students` 
ON `students`.`degree_id` = `degrees`.`id` 
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';


-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT  `degrees`.`name`,  `departments`.`name` AS 'dipartimento' 
FROM `departments` 
JOIN `degrees` 
ON `degrees`.`department_id` = `departments`.`id` 
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT 
`courses`.`name`, 
`teachers`.name AS 'nome_docente', 
`teachers`.`surname` AS 'cognome_docente'
`teachers`.`id`, 
FROM `courses` 
JOIN `course_teacher` 
ON `course_teacher`.`course_id` = `courses`.`id` 
JOIN `teachers` 
ON `teachers`.`id` = `course_teacher`.`teacher_id` 
WHERE `teachers`.`name` = ;'Fulvio' AND `teachers`.`surname` = 'Amato';



-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine 
-- alfabetico per cognome e nome

SELECT 
`students`.`name`, AS 'nome_studente'
`degrees`.`name` AS 'corso',
`departments`.`name` AS 'dipartimento'
FROM `departments`

JOIN `degrees`
ON `degrees`.`department_id` = `departments`.`id`

JOIN `students`
ON `students`.`degree_id` = `degrees`.`id`
ORDER BY `students`.`surname` , `students`.`name`;


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT 
`degrees`.`name`,
`courses`.`name` AS 'corso',
`teachers`.`name` AS 'nome_docente',
`teachers`.`surname` AS 'cognome_docente'
FROM `degrees`

JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`

JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`

JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`;



-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.`name` AS `nome_docente`, `teachers`.`surname` AS `cognome_docente`, `departments`.`name` AS  `dipartimento`
FROM `teachers`

JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id` 

JOIN `courses` 
ON `course_teacher`.`course_id` = `courses`.`id` 

JOIN `degrees` 
ON `courses`.`degree_id` = `degrees`.`id`

JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name`= 'Dipartimento di Matematica';  



