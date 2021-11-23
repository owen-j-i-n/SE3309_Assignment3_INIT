CREATE VIEW P2GL1C_class
AS 
SELECT 
	class_id,
    class_name,
	class_type,
	start_time,
	end_time,
	class_size,
	enroll,
    c.instructor_id,
    fName, lName
FROM
    class c
Left Join 
	instructor i ON c.instructor_id = i.instructor_id
WHERE c.zipCode = 'P2G L1C';


CREATE VIEW notWorking_instructors
AS 
SELECT 
	instructor_id,
    fName,
	lName,
	i.zipCode
FROM
    instructor i 
Left Join 
	branch b ON i.zipCode = b.zipCode
WHERE branch_status = 'temporary closed';


CREATE VIEW nonMember_user
AS 
SELECT 
	u.user_id,
    fName,
	lName,
    phone
FROM
    user u 
Left Join 
	membership m ON u.user_id = m.user_id
WHERE member_type is null and phone is not null;


