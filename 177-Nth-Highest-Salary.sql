CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    SELECT DISTINCT needed_salary 
    FROM (
    SELECT DENSE_RANK() OVER(ORDER BY e.salary DESC) DR, e.salary as needed_salary
    FROM Employee e) 
    WHERE DR = N
  );
END;
$$ LANGUAGE plpgsql;