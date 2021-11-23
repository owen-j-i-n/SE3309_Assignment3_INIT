CREATE DATABASE `GymDB`; 
USE `GymDB`;

CREATE TABLE User (
	user_id INT,
	pass_word VARCHAR(50),
	fName VARCHAR(50),
	lName VARCHAR(50),
	gender VARCHAR(50),
	phone VARCHAR(50),
	dob DATE,
  PRIMARY KEY (user_id)
);

CREATE TABLE Branch (
    zipCode varchar(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    branch_status varchar(50) NOT NULL,
    start_time time NOT NULL,
    end_time time NOT NULL,
    PRIMARY KEY (zipCode)
);

CREATE TABLE Workout (
  workout_id int NOT NULL,
  workout_name varchar(50) NOT NULL,
  start_time datetime NOT NULL,
  end_time datetime NOT NULL,
  occupancy varchar(7) NOT NULL,
  zipCode varchar(50) NOT NULL,
  PRIMARY KEY (workout_id),
  FOREIGN KEY (zipCode) REFERENCES Branch(zipCode)
);

CREATE TABLE Instructor(
  instructor_id int NOT NULL,
  fName varchar(50) NOT NULL,
  lName varchar(50) NOT NULL,
  expertize varchar(50) NOT NULL,
  zipCode varchar(50) NOT NULL,
  PRIMARY KEY (instructor_id),
  FOREIGN KEY (zipCode) REFERENCES Branch(zipCode)
);

CREATE TABLE Class (
  class_id int NOT NULL,
  class_name varchar(50) NOT NULL,
  class_type varchar(50) NOT NULL,
  start_time varchar(50) NOT NULL,
  end_time varchar(50) NOT NULL,
  class_size int(10) NOT NULL,
  enroll int(10) NOT NULL,
  zipCode varchar(50) NOT NULL,
  instructor_id int(11) NOT NULL,
  PRIMARY KEY (class_id),
  FOREIGN KEY (zipCode) REFERENCES Branch(zipCode),
  FOREIGN KEY (instructor_id ) REFERENCES instructor(instructor_id )
);

CREATE TABLE Membership (
  user_id int NOT NULL,
  payment varchar(50) NOT NULL,
  start_date date default NULL,
  expiry_date date default NULL,
  member_type varchar(7) NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE UserWorkout (
    user_id int NOT NULL,
    workout_id int(11) NOT NULL,
    wk_status varchar(7) NOT NULL,
    PRIMARY KEY (user_id, workout_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (workout_id) REFERENCES Workout(workout_id)
);

CREATE TABLE UserClass (
    user_id int NOT NULL,
    class_id int NOT NULL,
    cl_status varchar(7) NOT NULL,
    PRIMARY KEY (user_id, class_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

CREATE TABLE Access (
    user_id int NOT NULL,
    visit_time datetime NOT NULL,
    zipcode varchar(50) NOT NULL,
    PRIMARY KEY (user_id, visit_time),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (zipcode) REFERENCES Branch(zipcode)
);

