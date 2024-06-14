--update 1
UPDATE Equipment
SET amount = amount + 40
WHERE e_name = 'CPR Manikin'
AND e_id IN (
    SELECT e_id
    FROM Equipment
    WHERE EXTRACT(YEAR FROM e_date) = 2026
);

SELECT e_id, e_name, amount
FROM Equipment
WHERE e_name = 'CPR Manikin'
AND EXTRACT(YEAR FROM e_date) = 2026;
