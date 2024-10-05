Database normalization is an essential process for organizing data to reduce redundancy and ensure data integrity. Below is a concise explanation of each normal form (1NF to 5NF), illustrated using tables and Mermaid diagrams.

---

### **First Normal Form (1NF)**  
- **Definition**: A table is in 1NF if it contains only atomic (indivisible) values, has no repeating groups, and has a primary key.

- **Example**:  
  ```plaintext
  StudentID | Name   | Courses
  ----------|--------|---------------------
  1         | Alice  | Math, Science, English
  2         | Bob    | History, Math
  ```

  **To achieve 1NF**:  
  - Split multi-valued fields into separate rows.
  ```plaintext
  StudentID | Name   | Course
  ----------|--------|--------
  1         | Alice  | Math
  1         | Alice  | Science
  1         | Alice  | English
  2         | Bob    | History
  2         | Bob    | Math
  ```

- **Mermaid Diagram**:
  ```mermaid
  classDiagram
    class Student {
      StudentID
      Name
    }
    class Courses {
      StudentID
      Course
    }
    Student --> Courses
  ```

---

### **Second Normal Form (2NF)**  
- **Definition**: A table is in 2NF if it is in 1NF and every non-key attribute is fully dependent on the entire primary key.

- **Example**:  
  ```plaintext
  StudentID | Course | StudentAddress
  ----------|--------|---------------
  1         | Math   | 123 Street A
  1         | English| 123 Street A
  ```

  **To achieve 2NF**:  
  - Move the `StudentAddress` to a separate table as it depends only on `StudentID`.
  ```plaintext
  StudentID | Course 
  ----------|--------
  1         | Math
  1         | English

  StudentID | StudentAddress
  ----------|---------------
  1         | 123 Street A
  ```

- **Mermaid Diagram**:
  ```mermaid
  classDiagram
    class Student {
      StudentID
      StudentAddress
    }
    class StudentCourse {
      StudentID
      Course
    }
    Student --> StudentCourse
  ```

---

### **Third Normal Form (3NF)**  
- **Definition**: A table is in 3NF if it is in 2NF and there are no transitive dependencies (non-key attributes depending on other non-key attributes).

- **Example**:  
  ```plaintext
  StudentID | Course | Instructor | InstructorOffice
  ----------|--------|------------|-----------------
  1         | Math   | Prof. A    | Office 101
  1         | English| Prof. B    | Office 102
  ```

  **To achieve 3NF**:  
  - Move `InstructorOffice` to a separate table.
  ```plaintext
  StudentID | Course  | Instructor
  ----------|---------|-----------
  1         | Math    | Prof. A
  1         | English | Prof. B

  Instructor | InstructorOffice
  -----------|-----------------
  Prof. A    | Office 101
  Prof. B    | Office 102
  ```

- **Mermaid Diagram**:
  ```mermaid
  classDiagram
    class StudentCourse {
      StudentID
      Course
      Instructor
    }
    class Instructor {
      Instructor
      InstructorOffice
    }
    StudentCourse --> Instructor
  ```

---

### **Boyce-Codd Normal Form (BCNF)**  
- **Definition**: A table is in BCNF if every determinant is a candidate key (stricter than 3NF).

- **Example**:  
  ```plaintext
  Course   | Instructor | Department
  ---------|------------|-----------
  Math     | Prof. A    | Science
  History  | Prof. B    | Arts
  ```

  **To achieve BCNF**:  
  - Split into two tables with `Instructor` determining the `Department`.
  ```plaintext
  Course   | Instructor
  ---------|------------
  Math     | Prof. A
  History  | Prof. B

  Instructor | Department
  -----------|-----------
  Prof. A    | Science
  Prof. B    | Arts
  ```

- **Mermaid Diagram**:
  ```mermaid
  classDiagram
    class CourseInstructor {
      Course
      Instructor
    }
    class InstructorDepartment {
      Instructor
      Department
    }
    CourseInstructor --> InstructorDepartment
  ```

---

### **Fourth Normal Form (4NF)**  
- **Definition**: A table is in 4NF if it contains no multivalued dependencies, meaning there should be no more than one independent multi-valued relationship.

- **Example**:  
  ```plaintext
  StudentID | Course   | Skill
  ----------|----------|--------
  1         | Math     | Java
  1         | Math     | Python
  1         | Science  | Java
  ```

  **To achieve 4NF**:  
  - Split into two tables.
  ```plaintext
  StudentID | Course  
  ----------|---------
  1         | Math
  1         | Science

  StudentID | Skill   
  ----------|---------
  1         | Java
  1         | Python
  ```

- **Mermaid Diagram**:
  ```mermaid
  classDiagram
    class StudentCourse {
      StudentID
      Course
    }
    class StudentSkill {
      StudentID
      Skill
    }
    StudentCourse --> StudentSkill
  ```

---

### **Fifth Normal Form (5NF)**  
- **Definition**: A table is in 5NF if it cannot be decomposed into smaller tables without losing information or introducing redundancy.

- **Example**:  
  ```plaintext
  Project   | Employee | Role
  ----------|----------|---------
  P1        | E1       | Manager
  P1        | E2       | Developer
  P2        | E1       | Manager
  ```

  **To achieve 5NF**:  
  - Decompose into separate tables for each relationship.
  ```plaintext
  Project   | Employee  
  ----------|-----------
  P1        | E1
  P1        | E2
  P2        | E1

  Employee  | Role
  ----------|---------
  E1        | Manager
  E2        | Developer
  ```

- **Mermaid Diagram**:
  ```mermaid
  classDiagram
    class ProjectEmployee {
      Project
      Employee
    }
    class EmployeeRole {
      Employee
      Role
    }
    ProjectEmployee --> EmployeeRole
  ```

---

This explanation presents the basic concepts and decomposition processes for 1NF through 5NF, each with an example and a Mermaid diagram to illustrate the structural changes.