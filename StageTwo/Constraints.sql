--Constraint 1
ALTER TABLE Equipment
ADD CONSTRAINT chk_amount_nonnegative
CHECK(amount>=0);

INSERT INTO Equipment (e_date, e_id, e_name, amount)
VALUES (TO_DATE('2024-06-15','YYYY-MM-DD'), 1, 'Projector',-5);

--Constraint 2
ALTER TABLE Participants
ADD CONSTRAINT chk_p_role_values
CHECK (p_role IN ('Certified Nurse','First Responder','EMT','Paramedic'));

INSERT INTO Participants (p_name, p_date, p_id, p_role, gender)
VALUES ('Charlie', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 12, 'Student','Male');

--Constraint 3
ALTER TABLE lecturers
ADD CONSTRAINT chk_l_date_before_2025
CHECK (l_date < TO_DATE('2025-01-01','YYYY-MM-DD'));

INSERT INTO Participants (p_name, p_date, p_id, p_role, gender)
VALUES ('Charlie', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 12, 'Student','Male');
