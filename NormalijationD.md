Learn Database Normalization-1NF, 2NF, 3NF, 4NF, 5NF
1. First Normal Form(1NF):
    1. Using row order to convey information is not permitted

    2. Mixing data types within the same column is not permitted

    3. Having a table without a primary key is not permitted

    4. Repeating groups are not permitted

2. Second Normal Form (2NF)
    1. Each non-key attribute in the table must be dependent on the entire primary key.

3. Third Normal Form (3NF)

    1. Each non-key attribute in the table must depend on the key, the whole key, and nothing but the key.

Boyce-Codd Normal Form (BCNF)

    1. Each attribute in the table must depend on the key, the whole key, and nothing but the key.

4.Fourth Normal Form (4NF)

    1. The only kinds of multivalued dependency allowed in a table are multivalued dependencies on the key.

5.Fifth Normal Form (5NF)

    1. It must not be possible to describe the table as being the logical reaut of joining some other tables together  using this simple definition only and use example use mermade dia grame for explaining all NF 


    Fifth Normal Form (5NF), also called **Project-Join Normal Form (PJNF)**, addresses scenarios where a table can be decomposed into smaller tables to avoid redundancy. In 5NF, data is divided into multiple tables to ensure that it cannot be represented by simpler table joins.

---
                    Examples 
---

### 3NF (Third Normal Form) Explanation with Table:

**Initial Table (Not in 3NF)**:

| Player_ID | Player_Rating | Player_Skill_Level |
|-----------|---------------|--------------------|
| jdog21    | Intermediate  | 4                  |
| gila19    | Beginner      | 4                  |
| trev73    | Advanced      | 8                  |
| tina42    | Beginner      | 1                  |

**Issue**: The `Player_Rating` depends on the `Player_Skill_Level`, not directly on the `Player_ID`, violating the rule of 3NF that non-key attributes should depend only on the primary key.

### Decomposition into 3NF:

1. **Player Table**: (Keeps `Player_ID` and `Player_Skill_Level`)

| Player_ID | Player_Skill_Level |
|-----------|--------------------|
| jdog21    | 4                  |
| gila19    | 4                  |
| trev73    | 8                  |
| tina42    | 1                  |

2. **Player_Skill_Levels Table**: (Keeps `Player_Skill_Level` and `Player_Rating`)

| Player_Skill_Level | Player_Rating |
|--------------------|---------------|
| 1                  | Beginner      |
| 4                  | Intermediate  |
| 8                  | Advanced      |

### Explanation:
- **Before 3NF**: There was a transitive dependency where `Player_Rating` depended on `Player_Skill_Level`, which in turn depended on `Player_ID`.
- **After 3NF**: The table is split into two, where `Player_Rating` is directly associated with `Player_Skill_Level` in the second table, and the `Player` table now only contains `Player_ID` and `Player_Skill_Level`. This removes the dependency issue and satisfies the 3NF rule.

### Explanation with the Provided Example:

**Initial Table (before 5NF)**:
The table includes a combination of people's preferences for ice cream brands and their preferred flavors:
| Person | Brand    | Flavor              |
|--------|----------|---------------------|
| Jason  | Frosty's | Vanilla              |
| Jason  | Frosty's | Chocolate            |
| Jason  | Alpine   | Vanilla              |
| Suzy   | Alpine   | Rum Raisin           |
| Suzy   | Ice Queen| Mint Chocolate Chip  |
| Suzy   | Ice Queen| Strawberry           |
| Suzy   | Frosty's | Strawberry           |

In this table, each person prefers certain brands and flavors. However, the table captures this as one entity, leading to possible redundancy. For example, if Jason likes Vanilla and Chocolate, and both Frosty's and Alpine offer Vanilla, this combination is repeated unnecessarily.


In **Fourth Normal Form (4NF)**, a table must not contain multivalued dependencies unless they are based on a key. The example given about birdhouse models illustrates how 4NF works:

### **Initial Table (Before 4NF)**:
| Model   | Color  | Style      |
|---------|--------|------------|
| Tweety  | Yellow | Bungalow   |
| Tweety  | Yellow | Duplex     |
| Tweety  | Blue   | Bungalow   |
| Tweety  | Blue   | Duplex     |
| Metro   | Brown  | High-Rise  |
| Metro   | Brown  | Modular    |
| Metro   | Grey   | High-Rise  |
| Metro   | Grey   | Modular    |
| Prairie | Brown  | Bungalow   |
| Prairie | Brown  | Schoolhouse|
| Prairie | Beige  | Bungalow   |
| Prairie | Beige  | Schoolhouse|
| Prairie | Green  | Bungalow   |

### **Explanation**:
In this table, the color and style for each model are independent of each other, creating **multivalued dependencies**. For example, Tweety comes in both Yellow and Blue, and it has both Bungalow and Duplex styles. This results in a combination of all possible color-style pairs, leading to redundancy.

### **After Decomposition into 4NF**:

1. **Model_Color Table**:
   | Model   | Color  |
   |---------|--------|
   | Tweety  | Yellow |
   | Tweety  | Blue   |
   | Metro   | Brown  |
   | Metro   | Grey   |
   | Prairie | Brown  |
   | Prairie | Beige  |
   | Prairie | Green  |

2. **Model_Style Table**:
   | Model   | Style      |
   |---------|------------|
   | Tweety  | Bungalow   |
   | Tweety  | Duplex     |
   | Metro   | High-Rise  |
   | Metro   | Modular    |
   | Prairie | Bungalow   |
   | Prairie | Schoolhouse|

### **Explanation of 4NF**:
By separating **colors** and **styles** into two different tables, we eliminate multivalued dependencies. Now, each model is listed only once per color and once per style, preventing unnecessary duplication of data. This satisfies 4NF, where multivalued dependencies are only allowed on the key.

### **Fifth Normal Form (5NF) Decomposition**:

We decompose the table into multiple smaller tables, as shown in the second image, to avoid redundancy.

1. **Available_Flavors_By_Brand**:
   | Brand      | Flavor              |
   |------------|---------------------|
   | Frosty's   | Vanilla              |
   | Frosty's   | Strawberry           |
   | Frosty's   | Mint Chocolate Chip  |
   | Alpine     | Vanilla              |
   | Alpine     | Rum Raisin           |
   | Ice Queen  | Vanilla              |
   | Ice Queen  | Strawberry           |
   | Ice Queen  | Mint Chocolate Chip  |

   This table lists which brands offer which flavors.

2. **Preferred_Brands_By_Person**:
   | Person | Brand      |
   |--------|------------|
   | Jason  | Frosty's   |
   | Jason  | Alpine     |
   | Suzy   | Alpine     |
   | Suzy   | Ice Queen  |
   | Suzy   | Frosty's   |

   This table stores the preferred brands by each person.

3. **Preferred_Flavors_By_Person**:
   | Person | Flavor              |
   |--------|---------------------|
   | Jason  | Vanilla              |
   | Jason  | Chocolate            |
   | Suzy   | Rum Raisin           |
   | Suzy   | Mint Chocolate Chip  |
   | Suzy   | Strawberry           |

   This table captures each person's preferred flavors.

### **How it Works**:
- Now, instead of repeating combinations of person, brand, and flavor, the relationships are captured in separate tables. 
- The relationships between brands and flavors, and persons and their preferred brands or flavors, are managed without unnecessary repetition.

In 5NF, **we ensure that these tables can be joined back together without losing any information**, but the data is stored in a way that minimizes redundancy. Thus, you avoid the pitfalls of data duplication, ensuring that the database structure remains clean and efficient.

