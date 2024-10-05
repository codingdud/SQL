### 1. **DDL (Data Definition Language)**  
These commands deal with the structure of the database, such as creating, altering, or dropping tables, indexes, or schemas. DDL commands generally make structural changes and define the schema.

- **CREATE**: Used to create a new database object, such as a table, view, or index.
  ```sql
  CREATE TABLE employees (
      employee_id INT PRIMARY KEY,
      first_name VARCHAR(50),
      last_name VARCHAR(50),
      hire_date DATE
  );
  ```
  
- **ALTER**: Modifies an existing database object (e.g., adding/removing a column from a table).
  ```sql
  ALTER TABLE employees ADD email VARCHAR(100);
  ```

- **DROP**: Deletes a database object like a table or view.
  ```sql
  DROP TABLE employees;
  ```

- **TRUNCATE**: Removes all records from a table, but the table structure remains intact.
  ```sql
  TRUNCATE TABLE employees;
  ```

---

### 2. **DML (Data Manipulation Language)**  
DML commands are used to manipulate the data stored in database objects. These commands insert, update, delete, or select data.

- **SELECT**: Retrieves data from a database.
  ```sql
  SELECT * FROM employees;
  ```

- **INSERT**: Adds new records to a table.
  ```sql
  INSERT INTO employees (employee_id, first_name, last_name, hire_date)
  VALUES (1, 'John', 'Doe', '2023-01-15');
  ```

- **UPDATE**: Modifies existing records in a table.
  ```sql
  UPDATE employees SET first_name = 'Jane' WHERE employee_id = 1;
  ```

- **DELETE**: Removes specific records from a table.
  ```sql
  DELETE FROM employees WHERE employee_id = 1;
  ```

---

### 3. **DCL (Data Control Language)**  
DCL commands control access to the data within the database, primarily for managing user permissions.

- **GRANT**: Gives privileges to users or roles.
  ```sql
  GRANT SELECT, INSERT ON employees TO 'username';
  ```

- **REVOKE**: Removes privileges from users or roles.
  ```sql
  REVOKE SELECT, INSERT ON employees FROM 'username';
  ```

---

### 4. **TCL (Transaction Control Language)**  
TCL commands are used to manage transactions in the database. A transaction is a logical unit of work that contains one or more SQL statements.

- **COMMIT**: Saves the transaction changes permanently in the database.
  ```sql
  COMMIT;
  ```

- **ROLLBACK**: Undoes a transaction, reverting the database to its previous state before the transaction started.
  ```sql
  ROLLBACK;
  ```

- **SAVEPOINT**: Sets a point within a transaction to which a rollback can be performed.
  ```sql
  SAVEPOINT savepoint1;
  ```

- **SET TRANSACTION**: Defines transaction properties like isolation levels.
  ```sql
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
  ```

### 1. **SQL Operators**  
SQL operators are used to perform operations on data within queries. They can be categorized into several types:

#### **Arithmetic Operators**  
These are used for mathematical operations.

- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division
- `%`: Modulus (remainder after division)

```sql
SELECT employee_id, salary * 12 AS yearly_salary FROM employees;
```

#### **Comparison Operators**  
These compare two values and return a boolean result.

- `=`: Equal to
- `!=` or `<>`: Not equal to
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to
- `BETWEEN`: Within a range
- `IN`: Matches any value in a list
- `LIKE`: Pattern matching using wildcards
- `IS NULL`: Checks for null values

```sql
SELECT * FROM employees WHERE salary > 50000;
```

#### **Logical Operators**  
These combine multiple conditions in a query.

- `AND`: Both conditions must be true
- `OR`: Either condition can be true
- `NOT`: Negates the condition

```sql
SELECT * FROM employees WHERE salary > 50000 AND department_id = 3;
```

#### **Set Operators**  
These are used to combine results from multiple queries.

- `UNION`: Combines result sets and removes duplicates
- `UNION ALL`: Combines result sets, including duplicates
- `INTERSECT`: Returns only common records between result sets
- `EXCEPT` or `MINUS`: Returns records from the first query not in the second

```sql
SELECT name FROM employees WHERE department_id = 1
UNION
SELECT name FROM employees WHERE department_id = 2;
```

---

### 2. **SQL Functions**  
SQL functions are used to perform operations on data and return a value. They are categorized into **aggregate functions** and **scalar functions**.

#### **Aggregate Functions**  
These functions perform a calculation on a set of values and return a single value.

- **COUNT()**: Returns the number of rows
  ```sql
  SELECT COUNT(*) FROM employees;
  ```

- **SUM()**: Returns the total sum of a numeric column
  ```sql
  SELECT SUM(salary) FROM employees;
  ```

- **AVG()**: Returns the average of a numeric column
  ```sql
  SELECT AVG(salary) FROM employees;
  ```

- **MIN()**: Returns the minimum value
  ```sql
  SELECT MIN(salary) FROM employees;
  ```

- **MAX()**: Returns the maximum value
  ```sql
  SELECT MAX(salary) FROM employees;
  ```

#### **Scalar Functions**  
These functions operate on individual values and return a single value.

- **UPPER() / LOWER()**: Converts text to upper or lower case.
  ```sql
  SELECT UPPER(first_name) FROM employees;
  ```

- **LENGTH()**: Returns the length of a string.
  ```sql
  SELECT LENGTH(first_name) FROM employees;
  ```

- **ROUND()**: Rounds a number to a specified decimal places.
  ```sql
  SELECT ROUND(salary, 2) FROM employees;
  ```

- **CONCAT()**: Concatenates two or more strings.
  ```sql
  SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
  ```

- **NOW()**: Returns the current date and time.
  ```sql
  SELECT NOW();
  ```

---

### 3. **Clauses in SQL**  
Clauses define the structure of SQL queries, specifying what data to retrieve and how to process it.

#### **SELECT Clause**  
Used to select data from a database.

```sql
SELECT first_name, last_name FROM employees;
```

#### **FROM Clause**  
Specifies the table from which to retrieve data.

```sql
SELECT * FROM employees;
```

#### **WHERE Clause**  
Filters records based on specified conditions.

```sql
SELECT * FROM employees WHERE salary > 50000;
```

#### **GROUP BY Clause**  
Groups rows that share a property so aggregate functions can be applied.

```sql
SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;
```

#### **HAVING Clause**  
Filters records after `GROUP BY` is applied (similar to `WHERE` but for aggregated results).

```sql
SELECT department_id, COUNT(*) FROM employees 
GROUP BY department_id 
HAVING COUNT(*) > 10;
```

#### **ORDER BY Clause**  
Sorts the result set by one or more columns in ascending (`ASC`) or descending (`DESC`) order.

```sql
SELECT first_name, salary FROM employees ORDER BY salary DESC;
```

#### **LIMIT Clause**  
Limits the number of records returned by a query.

```sql
SELECT * FROM employees LIMIT 10;
```

#### **DISTINCT Clause**  
Removes duplicate records from the result set.

```sql
SELECT DISTINCT department_id FROM employees;
``` 

### 1. **Joins and Their Types**

**Joins** in SQL are used to combine rows from two or more tables based on a related column. There are several types of joins that determine how data from multiple tables is combined. Here's an overview of the main types of joins:

#### **1.1 INNER JOIN**
- Returns only the rows where there is a match between the tables.
  
```sql
SELECT employees.first_name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;
```
- **Example**: Fetches employees along with their department names, but only for those who have a matching department.

#### **1.2 LEFT JOIN (LEFT OUTER JOIN)**
- Returns all rows from the left table, along with the matching rows from the right table. If no match is found, `NULL` values are returned for columns from the right table.
  
```sql
SELECT employees.first_name, departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;
```
- **Example**: Fetches all employees, whether or not they belong to a department, and fills in `NULL` for employees without a department.

#### **1.3 RIGHT JOIN (RIGHT OUTER JOIN)**
- Returns all rows from the right table, along with the matching rows from the left table. If no match is found, `NULL` values are returned for columns from the left table.
  
```sql
SELECT employees.first_name, departments.department_name
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;
```
- **Example**: Fetches all departments and the employees within them, with `NULL` where no employee is assigned to a department.

#### **1.4 FULL JOIN (FULL OUTER JOIN)**
- Returns all rows from both tables. Rows that do not have a match in the other table will return `NULL` values for that table’s columns.
  
```sql
SELECT employees.first_name, departments.department_name
FROM employees
FULL OUTER JOIN departments
ON employees.department_id = departments.department_id;
```
- **Example**: Fetches all employees and departments, with `NULL` for departments without employees and employees without departments.

#### **1.5 CROSS JOIN**
- Returns the Cartesian product of both tables, i.e., each row from the first table is combined with every row from the second table.

```sql
SELECT employees.first_name, departments.department_name
FROM employees
CROSS JOIN departments;
```
- **Example**: If there are 5 employees and 3 departments, the result will contain 15 rows (5 x 3).

#### **1.6 SELF JOIN**
- A join where a table is joined with itself. Useful for comparing rows within the same table.

```sql
SELECT e1.first_name AS Employee, e2.first_name AS Manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;
```
- **Example**: Fetches employees along with their managers from the same `employees` table.

---

### 2. **SubQueries**

A **subquery** is a query nested inside another query. It can be used in various parts of a SQL query, such as in the `SELECT`, `FROM`, `WHERE`, or `HAVING` clauses. Subqueries can return single or multiple values.

#### **2.1 Subquery in SELECT Clause**
A subquery can be used to calculate a value for each row returned by the main query.

```sql
SELECT first_name, (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
```
- **Example**: Fetches each employee's name along with the average salary of all employees.

#### **2.2 Subquery in WHERE Clause**
Subqueries are often used to filter records based on values from another query.

```sql
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
- **Example**: Fetches employees whose salary is above the average salary.

#### **2.3 Subquery in FROM Clause**
Subqueries in the `FROM` clause are also called inline views. These subqueries create a temporary table for the main query to select from.

```sql
SELECT department_id, AVG(salary)
FROM (SELECT department_id, salary FROM employees) AS dept_salaries
GROUP BY department_id;
```
- **Example**: Creates a subquery to calculate the average salary per department.

#### **2.4 Correlated Subquery**
A correlated subquery references columns from the outer query. It is executed for each row processed by the outer query.

```sql
SELECT e1.first_name, e1.salary
FROM employees e1
WHERE e1.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e1.department_id = e2.department_id);
```
- **Example**: Fetches employees who earn more than the average salary in their respective departments.

---

### 3. **Aggregate Functions**

**Aggregate functions** perform a calculation on a set of values and return a single value. These functions are typically used with the `GROUP BY` clause to group the result set by one or more columns.

#### **3.1 COUNT()**
Counts the number of rows or non-NULL values in a column.

```sql
SELECT COUNT(*) FROM employees;
```
- **Example**: Counts the total number of employees.

#### **3.2 SUM()**
Calculates the total sum of a numeric column.

```sql
SELECT SUM(salary) FROM employees;
```
- **Example**: Calculates the total sum of all employee salaries.

#### **3.3 AVG()**
Calculates the average value of a numeric column.

```sql
SELECT AVG(salary) FROM employees;
```
- **Example**: Finds the average salary of all employees.

#### **3.4 MIN()**
Returns the minimum value in a column.

```sql
SELECT MIN(salary) FROM employees;
```
- **Example**: Finds the employee with the lowest salary.

#### **3.5 MAX()**
Returns the maximum value in a column.

```sql
SELECT MAX(salary) FROM employees;
```
- **Example**: Finds the employee with the highest salary.

#### **3.6 GROUP_CONCAT()** *(Vendor-specific, like MySQL)*
Concatenates values from multiple rows into a single string.

```sql
SELECT department_id, GROUP_CONCAT(first_name) FROM employees GROUP BY department_id;
```
- **Example**: Lists all employee names in each department, concatenated into a string.

