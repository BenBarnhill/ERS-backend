#Expense Reimbursement System

##Project Description
The Expense Reimbursement System will manage the process of reimbursing employees for expenses incurred while on company time. All employees in the company can log in and submit requests for reimbursement and view their past tickets and pending requests. Finance managers can log in and view all reimbursement requests and history for all employees in the company. Finance managers are authorized to approve and deny requests for expense reimbursement.

##Features
- As an employee, a user can:
  - Login
  - View the employee homepage
  - Logout
  - Submit a reimbursement request
  - View their pending reimbursement requests
  - View their resolved reimbursement requests
  - View their information
  - Update their information
- As an admin, a user can:
  - Login
  - View the manager home page
  - Logout
  - Approve/Deny pending reimbursements requests
  - View all pending requests of all employees
  - View all resolved requests of all employees
  - View reimbursement requests of a specific employee
  - View all employees

##Technologies Used
Javalin, Angular 2+, Java, TypeScript, Maven, PostgreSQL, Hibernate, JUnit

##To-Do List
1. Reorganize schema to incorporate more foreign keys and maintain 3N normalization.
2. Implement more testing through Mockito to cover more functionalities.
3. Implement TCL to aggregate multiple http endpoints into one.
4. Create and implement more custom exceptions.
5. Add a properties table to obsfuscate user credentials within PostgreSQL.
