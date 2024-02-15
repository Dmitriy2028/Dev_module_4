CREATE TABLE worker (
	id bigint PRIMARY KEY,
    name varchar(1000) NOT NULL CHECK (LENGTH(name) > 2),
    birthday date CHECK (EXTRACT(YEAR FROM BIRTHDAY) > 1900),
    level varchar NOT NULL CHECK (level IN ('Trainee', 'Junior', 'Middle', 'Senior')),
    salary int CHECK (salary >= 100 AND salary <= 100000)
);

CREATE TABLE client (
	id bigint PRIMARY KEY,
    name varchar(1000) NOT NULL CHECK (LENGTH(name) > 2)
);

CREATE TABLE project (
	id bigint PRIMARY KEY,
	client_id bigint,
	start_date date,
	finish_date date
);

CREATE TABLE project_worker (
	project_id bigint,
	worker_id bigint,
	PRIMARY KEY (project_id, worker_id)
);

ALTER TABLE project_worker
	ADD CONSTRAINT project_worker_project_fk
	FOREIGN KEY (project_id) REFERENCES project(id);

ALTER TABLE project_worker
	ADD CONSTRAINT project_worker_worker_fk
	FOREIGN KEY (worker_id) REFERENCES worker(id);


create sequence worker_seq start 1;
create sequence client_seq start 1;
create sequence project_seq start 1;

alter table worker alter column id set default nextval('worker_seq');
alter table client alter column id set default nextval('client_seq');
alter table project alter column id set default nextval('project_seq');