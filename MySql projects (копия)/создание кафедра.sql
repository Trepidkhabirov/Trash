CREATE schema Cafedra

ALTER TABLE teachers
ADD CONSTRAINT teachersdept
FOREIGN KEY (Kafedry_id) REFERENCES Kafedry(Kafedry_id);


ALTER TABLE graphic 
ADD CONSTRAINT graphicdisc 
FOREIGN KEY (discipline_id) REFERENCES discipline(Discipline_id);



ALTER TABLE graphic
ADD CONSTRAINT graphicteacher
FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id);

