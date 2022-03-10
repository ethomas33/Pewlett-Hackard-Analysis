SELECT 
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees as emp
LEFT JOIN titles as tt
on emp.emp_no = tt.emp_no
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	tt.title, 
	tt.from_date,
	tt.to_date
INTO unique_titles
FROM employees as emp
LEFT JOIN titles as tt
on emp.emp_no = tt.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND tt.to_date = '9999-01-01'
ORDER BY emp.emp_no ASC, tt.to_date DESC;


-- counts by title
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;