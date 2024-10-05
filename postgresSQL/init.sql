-- Active: 1727553225143@@pg-3cfe7a13-animeshk384-685c.j.aivencloud.com@15043@defaultdb
#shaw all users and role
\du
#show all database
\l 

 SELECT current_database();
 SELECT rolname FROM pg_roles;

 CREATE ROLE admin WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'admin';
GRANT ALL PRIVILEGES ON DATABASE defaultdb TO admin;
CREATE USER lord WITH PASSWORD 'lord';
GRANT admin TO lord;

CREATE ROLE user_role WITH CREATEDB LOGIN PASSWORD 'user';
GRANT CREATE ON DATABASE defaultdb TO user_role;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO user_role;

CREATE USER shadow WITH PASSWORD 'shadow';
GRANT user_role TO shadow;
# joker user who have all privileges
CREATE USER joker WITH PASSWORD 'joker';
GRANT ALL PRIVILEGES ON DATABASE defaultdb TO joker;
ALTER USER joker WITH SUPERUSER;
SELECT current_user;


SELECT rolname FROM pg_roles WHERE rolname = 'admin';


