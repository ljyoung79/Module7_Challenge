--Module 7 Challenge

--DELIVERABLE 1: Find the number of retiring employees by title

--Retrieve retiring employee info 
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.title,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;
SELECT * FROM unique_titles
-- Retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

--DELIVERABLE 2: The Employees Eligible for the Mentorship Program
SELECT e.emp_no, 
    e.first_name, 
    e.last_name,     
    ti.to_date,
    ti.title,
	e.birth_date,
	e.hire_date
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (ti.to_date ='9999-01-01');

SELECT * FROM mentorship_eligibility