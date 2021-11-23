CREATE TABLE GymNumber(
	id int,
    zipCode VARCHAR(50)
);
INSERT INTO GymNumber
(SELECT 
  ROW_NUMBER() OVER(ORDER BY zipCode ASC) AS 'Row#',
  zipCode
FROM branch);
 
INSERT into instructor
(SELECT DISTINCT instructor_id, fName, lName, expertize, zipCode
FROM instructor_mock m
JOIN gymnumber g
ON m.gym_id = g.id);

DROP TABLE GymNumber;
DROP TABLE instructor_mock;
DROP TABLE mock_datainstructor;

INSERT into class
(SELECT DISTINCT id, class_name, class_type, start_time, end_time, class_size, enroll, zipCode, instructor_id
FROM class_mock m
JOIN instructor i
ON m.instructor = i.instructor_id);
DROP TABLE class_mock;