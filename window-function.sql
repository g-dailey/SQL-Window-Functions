-- ROW_NUMBER(): Assigns a unique sequential integer to each row within a result set.
-- Example:
SELECT ROW_NUMBER() OVER (ORDER BY Salary DESC) as 'RowNum', Name, Salary
FROM Employee


-- Consider the following sample data in a table named "Employee":

-- Name	Salary	Department
-- John	60000	Sales
-- Alice	80000	Marketing
-- Bob	75000	Sales
-- Rachel	90000	Marketing
-- Tom	65000	Sales
-- Using ROW_NUMBER():


-- | RowNum | Name     | Salary   |
-- | ------ | --------| ---------|
-- | 1      | Rachel   | 90000    |
-- | 2      | Alice    | 80000    |
-- | 3      | Bob      | 75000    |
-- | 4      | Tom      | 65000    |
-- | 5      | John     | 60000    |

--###################################################################################
-- RANK(): Assigns a rank to each row within a result set based on the values in one or more columns.
-- Example:

SELECT RANK() OVER (ORDER BY Sales DESC) as 'Rank', Name, Sales
FROM SalesTable

-- Using RANK():

-- Copy code
-- | Rank   | Name     | Sales    |
-- | ------ | --------| ---------|
-- | 1      | Rachel   | 90000    |
-- | 2      | Alice    | 80000    |
-- | 3      | Bob      | 75000    |
-- | 4      | Tom      | 65000    |
-- | 5      | John     | 60000    |

--###################################################################################
-- DENSE_RANK(): Assigns a rank to each row within a result set, but does not skip any rank value when there are ties.
-- Example:

SELECT DENSE_RANK() OVER (ORDER BY Sales DESC) as 'Rank', Name, Sales
FROM SalesTable

-- Using DENSE_RANK():

-- | Rank   | Name     | Sales    |
-- | ------ | --------| ---------|
-- | 1      | Rachel   | 90000    |
-- | 2      | Alice    | 80000    |
-- | 3      | Bob      | 75000    |
-- | 4      | Tom      | 65000    |
-- | 4      | John     | 60000    |


--###################################################################################
-- NTILE(): Divides the result set into a specified number of groups of equal size.
-- Example:

SELECT Name, Salary, NTILE(4) OVER (ORDER BY Salary DESC) as 'Quartile'
FROM Employee


-- Using NTILE():
-- | Name     | Salary   | Quartile |
-- | -------- | --------| ---------|
-- | Rachel   | 90000   | 1        |
-- | Alice    | 80000   | 1        |
-- | Bob      | 75000   | 2        |
-- | Tom      | 65000   | 3        |
-- | John     | 60000   | 4        |


--###################################################################################
-- LAG(): Returns the value of a column in a previous row in the result set.
-- Example:

SELECT Name, Salary, LAG(Salary, 1) OVER (ORDER BY Salary DESC) as 'PreviousSalary'
FROM Employee

-- | Name     | Salary   | PreviousSalary |
-- | -------- | --------| -------------- |
-- | Rachel   | 90000   | NULL           |
-- | Alice    | 80000   | 90000          |
-- | Bob      | 75000   | 80000          |
-- | Tom      | 65000   | 75000          |
-- | John     | 60000   | 65000          |

--###################################################################################
-- LEAD(): Returns the value of a column in a following row in the result set.
-- Example:

SELECT Name, Salary, LEAD(Salary, 1) OVER (ORDER BY Salary DESC) as 'NextSalary'
FROM Employee

-- | Name     | Salary   | NextSalary |
-- | -------- | --------| ---------- |
-- | Rachel   | 90000   | 80000      |
-- | Alice    | 80000   | 75000      |
-- | Bob      | 75000   | 65000      |
-- | Tom      | 65000   | 60000      |
-- | John     | 60000   | NULL       |

--###################################################################################
-- SUM(): Calculates the sum of a column over a window of rows.
-- Example:

SELECT Name, Salary, SUM(Salary) OVER (PARTITION BY Department) as 'TotalSalary'
FROM Employee

-- | Name     | Salary   | TotalSalary |
-- | -------- | --------| ------------|
-- | Alice    | 80000   | 170000      |
-- | Rachel   | 90000   | 170000      |
-- | Bob      | 75000   | 200000      |
-- | John     | 60000   | 200000      |
-- | Tom      | 65000   | 200000      |

--###################################################################################
-- AVG(): Calculates the average of a column over a window of rows.
-- Example:

SELECT Name, Salary, AVG(Salary) OVER (PARTITION BY Department) as 'AverageSalary'
FROM Employee