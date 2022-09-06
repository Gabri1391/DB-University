--1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT `name` AS `nome`, `surname` AS `cognome`, `date_of_birth` AS `anno_di_nascita`
FROM `students`
WHERE YEAR(`date_of_birth`) LIKE '1990-';

--2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT `name` AS `corso`, `cfu` AS `crediti`
FROM `courses`
WHERE `cfu` > 10;


--3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students` 
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;


--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
--laurea (286)

SELECT `name` AS `corso`, `period` AS `n_semestre`, `year` AS `anno`
FROM `courses`
WHERE `period` = 'I semestre' AND `year` = '1';


--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
--20/06/2020 (21)

SELECT * 
FROM `exams` 
WHERE `date` = '2020-06-20' AND `hour` > '14:00:00';

--6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT *
FROM `degrees`
WHERE `level` = 'magistrale';

--7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(`id`) AS `numero_dipartimenti`
FROM `departments`;

--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(`phone`) AS 'professorsi_nessun_num_telefonico' FROM `teachers`;



--GROUP BY

--1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) AS 'iscritti', YEAR(`enrolment_date`) AS 'anno_accademico' FROM `students` GROUP BY YEAR(`enrolment_date`);


--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`office_address`) AS 'quantità', `office_address`
FROM `teachers` 
GROUP BY `office_address`;


--3. Calcolare la media dei voti di ogni appello d'esame

SELECT  `exam_id` AS `appello_n`, ROUND(AVG(`vote`),2) AS `media_voto`
FROM `exam_student`
GROUP BY `exam_id`;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT  `department_id` AS `dipartimento_n`, COUNT(*) AS 'n_corsi_laurea'
FROM `degrees` 
GROUP BY `department_id`;