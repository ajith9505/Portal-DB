CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(20),
  `password` varchar(20),
  `role` varchar(20),
  `created_at` timestamp
);

CREATE TABLE `students` (
  `student_id` integer,
  `first_name` varchar(20),
  `last_name` varchar(20),
  `mobile_number` varchar(15),
  `email` varchar(20),
  `date_of_birth` date,
  `address` varchar(50),
  `class_id` integer
);

CREATE TABLE `mentors` (
  `mentor_id` integer,
  `first_name` varchar(20),
  `last_name` varchar(20),
  `mobile_number` varchar(15),
  `email` varchar(20),
  `class_id` integer
);

CREATE TABLE `class` (
  `class_id` integer PRIMARY KEY,
  `title` varchar(100),
  `body` text COMMENT 'Content of the post',
  `task` text,
  `status` varchar(100),
  `created_by` varchar(20),
  `created_at` timestamp,
  `start_time` timestamp,
  `end_time` timestamp
);

CREATE TABLE `course` (
  `course_id` integer PRIMARY KEY,
  `title` varchar(20),
  `mentor_id` integer,
  `duration` varchar(10)
);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `mentors` (`mentor_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `students` (`student_id`);

ALTER TABLE `mentors` ADD FOREIGN KEY (`mentor_id`) REFERENCES `course` (`mentor_id`);

ALTER TABLE `class` ADD FOREIGN KEY (`class_id`) REFERENCES `students` (`class_id`);

ALTER TABLE `class` ADD FOREIGN KEY (`class_id`) REFERENCES `mentors` (`class_id`);
