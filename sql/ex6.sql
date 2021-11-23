UPDATE class c
LEFT JOIN branch b ON c.zipCode = b.zipCode
SET class_size = 0, enroll = 0
WHERE b.branch_status = 'temporary closed';

UPDATE membership
SET member_type = 'expired'
WHERE expiry_date< CURRENT_DATE; 

DELETE class 
FROM class
LEFT JOIN branch ON class.zipCode = branch.zipCode
WHERE class.zipCode = 'H2E K7T' and class_name = 'Curls n’ Crunches';
