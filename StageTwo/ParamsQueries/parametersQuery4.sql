SELECT 
    e.e_id AS EquipmentID,
    e.e_name AS EquipmentName,
    e.e_date AS EquipmentDate,
    e.amount AS Amount
FROM 
    Equipment e
WHERE 
    e.e_date =&<name="EquipmentDate" type="date" hint="valuse btween 22/12/2026-22/01/2027">
ORDER BY 
    e.e_name;
