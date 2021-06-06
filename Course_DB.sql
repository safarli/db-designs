CREATE TABLE roles(
	id INT,
	name CHAR(1) NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT unique_role_name UNIQUE(name)
);

CREATE TABLE users(
	id UUID DEFAULT uuid_generate_v4(),
	email VARCHAR(155) NOT NULL,
	password VARCHAR(100),
	fname VARCHAR(255) NOT NULL,
	lname VARCHAR(255) NOT NULL,
	b_day DATE NOT NULL,
	role INT NOT NULL,
	suspended BOOLEAN NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT fk_role FOREIGN KEY(role) REFERENCES roles(id),
	CONSTRAINT unique_email_per_user UNIQUE(email)
);

CREATE TABLE payments(
	id UUID uuid_generate_v4(),
	user_id UUID,
	made_at TIMESTAMPTZ,
	PRIMARY KEY(id)
);

CREATE TABLE classes(
	id INT,
	name VARCHAR(255),
	PRIMARY KEY(id),
	CONSTRAINT unique_class_name UNIQUE(name)
);

CREATE TABLE exams(
	id UUID uuid_generate_v4(),
	title VARCHAR(300),
	taken_by UUID NOT NULL,
	taken_at TIMESTAMPTZ 
);
