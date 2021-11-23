USE `GymDB`;
SELECT fName, lName, gender, dob 
FROM User WHERE gender = 'male' and EXTRACT(YEAR FROM dob)>=1995
ORDER BY dob;

SELECT  u.user_id, fName, lName, payment, member_type 
FROM User u
INNER JOIN membership m ON u.user_id = m.user_id
WHERE m.member_type = 'premium';

SELECT * FROM branch WHERE branch_status = 'Normal'; 

SELECT class_id, class_name, class_type, c.instructor_id, fName, lName, c.zipCode
FROM class c
LEFT JOIN instructor i ON c.instructor_id = i.instructor_id
WHERE c.zipCode ='P0U U0Q'
ORDER BY class_name ASC, class_id ASC;

SELECT instructor_id, fName, lName, i.zipCode, branch_status
FROM instructor i
LEFT JOIN branch b ON i.zipCode = b.zipCode
WHERE branch_status = 'temporary closed'
ORDER BY instructor_id;

SELECT i.instructor_id, class_id, class_name, class_type
FROM instructor i
LEFT JOIN class c ON i.instructor_id = c.instructor_id
WHERE i.instructor_id = 12
ORDER BY class_name;

SELECT * FROM membership WHERE payment = 'mastercard' and member_type = 'normal';