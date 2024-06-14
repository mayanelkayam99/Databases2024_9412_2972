--delete 2
DELETE FROM uses
WHERE e_id IN (
    SELECT e.e_id
    FROM Equipment e
    WHERE e.e_date < TO_DATE('01/01/2025', 'DD/MM/YYYY')
    AND e.e_name IN ('Glucose Meter', 'Oxygen Tank', 'Defibrillator')
);

SELECT *
FROM uses u
JOIN Equipment e ON u.e_id = e.e_id
WHERE e.e_date < TO_DATE('01/01/2025', 'DD/MM/YYYY')
AND e.e_name IN ('Glucose Meter', 'Oxygen Tank', 'Defibrillator');
