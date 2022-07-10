-- Deliverable 1
-- Collect the retiring employees information
SELECT e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO ret_emp        
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no, 
                    re.first_name,
                    re.last_name,
                    re.title
INTO unique_titles
FROM ret_emp as re
WHERE re.to_date = ('9999-01-01')
ORDER BY re.emp_no, re.to_date DESC;

-- Count the titles that will be retiring
SELECT count(title), title
INTO unique_count
FROM unique_titles
GROUP BY title
ORDER BY count(title) DESC;

-- Deliverable 2
-- Discovering mentorship eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
                    e.first_name,
                    e.last_name,
                    e.birth_date,
                    de.from_date,
                    de.to_date,
                    t.title
INTO mentor_elg
FROM employees as e
    INNER JOIN dept_emp as de
        ON (e.emp_no = de.emp_no)
    INNER JOIN titles as t
        ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;