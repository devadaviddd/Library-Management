CREATE TABLE USER (
  email VARCHAR(30) PRIMARY KEY,
  u_password VARCHAR(30) NOT NULL,
  u_role ENUM("Student", "Teacher", "Admin") NOT NULL
);
ALTER TABLE USER
ADD CONSTRAINT U_CREDENTIAL UNIQUE (email, u_password,u_role);

DROP TABLE USER;