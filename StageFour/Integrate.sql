
DROP TABLE participants CASCADE CONSTRAINTS;

------------------------------------------------------------------------------------------------------------------------- 
ALTER TABLE belongs RENAME COLUMN volunteer_id TO p_id;
 
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE belongs ADD (volunteer_id VARCHAR2(20));
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE belongs ADD CONSTRAINT fk_belongs_volunteer FOREIGN KEY (volunteer_id) REFERENCES volunteer(volunteer_id);
--------------------------------------------------------------------------------------------------------------------------
UPDATE belongs
SET volunteer_id = 11110 + ROWNUM
WHERE ROWNUM <= 400;
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE belongs
DROP PRIMARY KEY;
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE belongs DROP COLUMN p_id;
--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE belongs
ADD CONSTRAINT fk_belongs PRIMARY KEY (g_id, volunteer_id);
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE HAS
(
  ambulance_id INTEGER NOT NULL,
  e_id NUMBER(10) NOT NULL,
  PRIMARY KEY (ambulance_id, e_id),
  FOREIGN KEY (ambulance_id) REFERENCES AMBULANS (ambulance_id),
  FOREIGN KEY (e_id) REFERENCES Equipment (e_id)
);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO HAS (ambulance_id, e_id)
SELECT ambulance_id, e_id
FROM (
  SELECT a.ambulance_id, e.e_id
  FROM AMBULANS a, Equipment e
  WHERE e.e_name IN ('Defibrillator', 'Stethoscope', 'Blood Pressure Monitor', 'Oxygen Tank', 'First Aid Kit')
  AND ROWNUM <= 400
);







