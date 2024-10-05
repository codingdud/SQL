-- Active: 1727553225143@@pg-3cfe7a13-animeshk384-685c.j.aivencloud.com@15043@emp
CREATE TABLE IF NOT EXISTS departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    hire_date DATE DEFAULT CURRENT_DATE
);

-- Insert into departments
# INSERT INTO departments (department_name) VALUES ('HR'), ('Engineering'), ('Sales');

-- Insert into employees (hire_date will default to the current date)
# INSERT INTO employees (employee_name, department_id) VALUES ('John Doe', 1), ('Jane Smith', 2);

SELECT * FROM departments;
SELECT * FROM employees;
