SELECT 
    c.C_name AS CourseName,
    c.c_Id AS CourseID,
    e.e_name AS EquipmentName,
    e.e_id AS EquipmentID
FROM 
    Courses c
JOIN uses u ON c.c_Id = u.c_Id
JOIN Equipment e ON u.e_id = e.e_id
WHERE 
    e.e_name = &<name=EquipmentName type="string">
ORDER BY 
    c.C_name;
