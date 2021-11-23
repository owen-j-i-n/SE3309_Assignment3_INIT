USE `GymDB`;
INSERT INTO User
Values(1, '123123123', 'Owen', 'Jin', 'Male', '226 123 456', '2000-05-12');

INSERT INTO User(user_id, pass_word, fName, lName, gender, dob)  
Values(2, 'abcabcabc', 'Ives', 'Luo', 'Male','1999-01-23');

INSERT INTO User
(SELECT * FROM mock_data m);

SELECT * FROM User;