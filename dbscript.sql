CREATE TABLE admin_details(admin_id int GENERATED ALWAYS AS IDENTITY, 
admin_password varchar(20), 
admin_first_name varchar(20), 
admin_last_name varchar(20), 
admin_contact bigint, 
admin_email varchar(20), 
admin_address varchar(50),
admin_role varchar(20),
PRIMARY KEY(admin_id));

INSERT INTO admin_details VALUES(DEFAULT, 
'password',
'Ben', 
'Barnhill', 
1234567, 
'email@gmail.com', 
'123 Cool Street USA', 
'admin');

CREATE TABLE employee_details(emp_id int GENERATED ALWAYS AS IDENTITY, 
emp_password varchar(20), 
emp_first_name varchar(20), 
emp_last_name varchar(20), 
emp_contact bigint, 
emp_email varchar(30), 
emp_address varchar(50), 
emp_role varchar(20), 
PRIMARY KEY(emp_id));

INSERT INTO employee_details VALUES(DEFAULT, 
'password', 
'Jordan', 
'Cooke', 
5555555, 
'email@hotmal.com', 
'4567 Main Street USA', 
'employee');

CREATE TABLE reimbursements_pending(pend_id int GENERATED ALWAYS AS IDENTITY, 
pend_request int, 
pend_amount double precision, 
pend_reason varchar(50), 
pend_request_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
pend_resolve_time varchar(20), 
pend_response int, 
pend_status varchar(20), 
PRIMARY KEY(pend_id), 
CONSTRAINT fk_empId FOREIGN KEY(pend_request) REFERENCES employee_details(emp_id) ON DELETE NO ACTION, 
CONSTRAINT fk_adminId FOREIGN KEY(pend_response) REFERENCES admin_details(admin_id) ON DELETE NO ACTION);

INSERT INTO reimbursements_pending(DEFAULT, 
1, 
435.87, 
'Work Trip', 
DEFAULT, 
'', 
1, 
'PENDING');

CREATE TABLE reimbursements_pending(pend_id int GENERATED ALWAYS AS IDENTITY, 
pend_request int, 
pend_amount double precision, 
pend_reason varchar(50), 
pend_request_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
pend_resolve_time varchar(20), 
pend_response int, 
pend_status varchar(20), 
PRIMARY KEY(pend_id), 
CONSTRAINT fk_empId FOREIGN KEY(pend_request) REFERENCES employee_details(emp_id) ON DELETE NO ACTION, 
CONSTRAINT fk_adminId FOREIGN KEY(pend_response) REFERENCES admin_details(admin_id) ON DELETE NO ACTION);

SELECT reimbursements_pending.pend_id AS expense_id, employee_details.emp_first_name AS employee_name, 
reimbursements_pending.pend_amount AS amount, 
reimbursements_pending.pend_reason AS reason, 
reimbursements_pending.pend_request_time AS created_at, 
reimbursements_pending.pend_resolve_time AS resolved_at, 
admin_details.admin_first_name AS manager, 
reimbursements_pending.pend_status AS status FROM reimbursements_pending LEFT JOIN employee_details ON reimbursements_pending.pend_request=employee_details.emp_id LEFT JOIN admin_details ON reimbursements_pending.pend_response=admin_details.admin_id;

SELECT reimbursements_final.final_id AS expense_id, employee_details.emp_first_name AS employee_name, 
reimbursements_final.final_amount AS amount, 
reimbursements_final.final_reason AS reason, 
reimbursements_final.final_request_time AS created_at, 
reimbursements_final.final_resolve_time AS resolved_at, 
admin_details.admin_first_name AS manager, 
reimbursements_final.final_status AS status FROM reimbursements_final LEFT JOIN employee_details ON reimbursements_final.final_request=employee_details.emp_id LEFT JOIN admin_details ON reimbursements_final.final_response=admin_details.admin_id;