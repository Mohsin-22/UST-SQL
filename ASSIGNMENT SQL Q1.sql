use temp;

						-- 1 //emp whose fname starts with vowel and lname ends with consonant --
SELECT first_name, last_name
FROM employees
WHERE 
LEFT(first_name, 1) IN ('A', 'E', 'I', 'O', 'U')
AND 
RIGHT(last_name, 1) NOT IN ('A', 'E', 'I', 'O', 'U');