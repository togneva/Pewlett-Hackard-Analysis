-- Get employees with titles ready to retire
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ttl.title,
		ttl.from_date,
		ttl.to_date	
INTO retirement_titles
FROM employees as e
JOIN titles as ttl
ON e.emp_no = ttl.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Get unique employee records with latest titles
SELECT DISTINCT ON (emp_no) emp_no,
							first_name,
							last_name,
							title

INTO unique_retirement_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--Get number of employees by title ready to retire
SELECT COUNT(title) AS title_count, title
INTO retiring_titles_count
FROM unique_retirement_titles
GROUP BY title
ORDER BY title_count DESC

-- Get employees eligible for mentorship program
SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ttl.title
INTO mentoship_eligibility
FROM employees AS e
JOIN dept_employees AS de
	ON e.emp_no = de.emp_no
JOIN titles AS ttl
	ON e.emp_no = ttl.emp_no
WHERE de.to_date = '9999-01-01'
	AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no, ttl.to_date DESC


		











