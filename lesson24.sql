-- student
CREATE TABLE student (
	id serial primary key,
	first_name varchar(100),
	surname varchar(100)
);

-- test
CREATE TABLE test (
	id serial primary key,
	test_name varchar(100)
);


-- questions
CREATE TABLE question (
	id serial primary key,
	test_id serial,
	question_text varchar(4000)
);

ALTER TABLE question
ADD CONSTRAINT question_fk FOREIGN KEY (test_id) REFERENCES test(id);

-- answer
CREATE TABLE answer (
	id serial primary key,
	question_id serial,
	answer_text varchar(1000),
	is_right_answer boolean
);

ALTER TABLE answer
ADD CONSTRAINT answer_fk FOREIGN KEY (question_id) REFERENCES question(id);

-- test_result
CREATE TABLE test_result (
	id serial primary key,
	test_id serial,
	question_id serial,
	answer_id serial,
	student_id serial,
	test_execution_date date
);

ALTER TABLE test_result
ADD CONSTRAINT test_result_fk FOREIGN KEY (test_id) REFERENCES test(id);
ALTER TABLE test_result
ADD CONSTRAINT test_result_question_fk FOREIGN KEY (question_id) REFERENCES question(id);
ALTER TABLE test_result
ADD CONSTRAINT test_result_answer_fk FOREIGN KEY (answer_id) REFERENCES answer(id);
ALTER TABLE test_result
ADD CONSTRAINT test_result_student_fk FOREIGN KEY (student_id) REFERENCES student(id);

