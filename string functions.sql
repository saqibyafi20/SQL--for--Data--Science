-- String functions : 
-- upper() : converts text to upper case
-- lower() : converts text to lower case
-- length() : returns the length of a string
-- concat() : concatenates two or more string
-- substring() : extracts a portion of a string
-- trim() : removes leading/trailing spaces
-- replace() :replaces occurances of a substring.

select * from de_tails

-- get all the residence in upper case

select upper(residence) from de_tails

-- concatenate 

-- join department_id and department_name with hyphen

select concat(department_id,'-',department_name)
from de_tails

-- sub string

-- extract the first five characters from residence.

select substring(residence,1,5) from de_tails

-- lenght

-- count total length of name

select employee_name,len(employee_name) from de_tails

select * from de_tails

-- trim 
-- remove leading and trailing spaces from employee_name.

select trim (employee_name) from de_tails
select len(trim (employee_name)) from de_tails

-- replace
-- replace chemistry from finanance

select replace (department_name,'finance','chemistry') from de_tails

