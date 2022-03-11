--(D1) All retiring --- retiring titles 
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

--(D1) Use Dictinct with Orderby to remove duplicate rows --- unique titles
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


--(D1) counts by retiring titles --- retiring titles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;




-- (D2) mentroship eligibility --- Mentorship eligibility
SELECT DISTINCT ON (emp.emp_no)
	emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	dept.from_date, 
	dept.to_date
INTO mentorship_eligibility
FROM employees as emp
LEFT JOIN dept_employee as dept
on emp.emp_no = dept.emp_no
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND dept.to_date = '9999-01-01'
ORDER BY emp.emp_no ASC;



