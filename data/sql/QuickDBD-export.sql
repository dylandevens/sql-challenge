-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [department_number] string  NOT NULL ,
    [department_name] string  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [department_number] ASC
    )
)

CREATE TABLE [Department_Employees] (
    [employee_number] int  NOT NULL ,
    [department_number] string  NOT NULL 
)

CREATE TABLE [Department_Managers] (
    [department_number] string  NOT NULL ,
    [employee_number] int  NOT NULL 
)

CREATE TABLE [Employees] (
    [employee_number] int  NOT NULL ,
    [employee_title_id] string  NOT NULL ,
    [birthdate] date  NOT NULL ,
    [first_name] string  NOT NULL ,
    [last_name] string  NOT NULL ,
    [sex] string  NOT NULL ,
    [hire_date] date  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [employee_number] ASC
    )
)

CREATE TABLE [Salaries] (
    [employee_number] int  NOT NULL ,
    [salary] int  NOT NULL 
)

CREATE TABLE [Titles] (
    [title_id] string  NOT NULL ,
    [title] string  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [Department_Employees] WITH CHECK ADD CONSTRAINT [FK_Department_Employees_employee_number] FOREIGN KEY([employee_number])
REFERENCES [Employees] ([employee_number])

ALTER TABLE [Department_Employees] CHECK CONSTRAINT [FK_Department_Employees_employee_number]

ALTER TABLE [Department_Employees] WITH CHECK ADD CONSTRAINT [FK_Department_Employees_department_number] FOREIGN KEY([department_number])
REFERENCES [Departments] ([department_number])

ALTER TABLE [Department_Employees] CHECK CONSTRAINT [FK_Department_Employees_department_number]

ALTER TABLE [Department_Managers] WITH CHECK ADD CONSTRAINT [FK_Department_Managers_department_number] FOREIGN KEY([department_number])
REFERENCES [Departments] ([department_number])

ALTER TABLE [Department_Managers] CHECK CONSTRAINT [FK_Department_Managers_department_number]

ALTER TABLE [Department_Managers] WITH CHECK ADD CONSTRAINT [FK_Department_Managers_employee_number] FOREIGN KEY([employee_number])
REFERENCES [Employees] ([employee_number])

ALTER TABLE [Department_Managers] CHECK CONSTRAINT [FK_Department_Managers_employee_number]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_employee_title_id] FOREIGN KEY([employee_title_id])
REFERENCES [Titles] ([title_id])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_employee_title_id]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_employee_number] FOREIGN KEY([employee_number])
REFERENCES [Employees] ([employee_number])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_employee_number]

COMMIT TRANSACTION QUICKDBD