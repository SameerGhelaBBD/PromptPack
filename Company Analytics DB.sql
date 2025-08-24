-- 1. Create the database
CREATE DATABASE CompanyAnalytics;
GO
USE CompanyAnalytics;
GO

-- 2. Departments
CREATE TABLE Departments (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name VARCHAR(50) NOT NULL
);

-- 3. Positions
CREATE TABLE Positions (
    position_id INT PRIMARY KEY IDENTITY(1,1),
    position_title VARCHAR(50) NOT NULL,
    salary_band VARCHAR(20)
);

-- 4. Clients (New table for client information)
CREATE TABLE Clients (
    client_id INT PRIMARY KEY IDENTITY(1,1),
    client_name VARCHAR(50) NOT NULL
);

-- 5. Locations (New table for location information)
CREATE TABLE Locations (
    location_id INT PRIMARY KEY IDENTITY(1,1),
    location_name VARCHAR(50) NOT NULL
);

-- 6. Managers (Reference table for managers)
CREATE TABLE Managers (
    manager_id INT PRIMARY KEY IDENTITY(1,1),
    manager_name VARCHAR(50) NOT NULL
);

-- 7. Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY IDENTITY(1,1),
    employee_name VARCHAR(100),
    department_id INT,
    position_id INT,
    client_id INT,
    location_id INT,
    email VARCHAR(100),
    phone VARCHAR(20),
    employment_status VARCHAR(20) DEFAULT 'Full-time',
    hire_date DATE NULL, -- Will be NULL as not provided in your data
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (position_id) REFERENCES Positions(position_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- 8. PerformanceReviews
CREATE TABLE PerformanceReviews (
    review_id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT,
    review_date DATE DEFAULT GETDATE(),
    manager_id INT,
    performance_rating VARCHAR(20),
    performance_score DECIMAL(3,2),
    comments NVARCHAR(MAX),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
);

-- 9. WorkHours (Keeping original structure for future use)
CREATE TABLE WorkHours (
    record_id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT,
    date DATE,
    hours_worked DECIMAL(4,2),
    overtime_hours DECIMAL(4,2),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- 10. Education (Keeping original structure for future use)
CREATE TABLE Education (
    education_id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT,
    degree VARCHAR(100),
    institution VARCHAR(100),
    graduation_year INT,
    field_of_study VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- 11. Training (Keeping original structure for future use)
CREATE TABLE Training (
    training_id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT,
    training_title VARCHAR(100),
    provider VARCHAR(100),
    date_completed DATE,
    certification_awarded BIT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- 12. EmployeeFeedback (Keeping original structure for future use)
CREATE TABLE EmployeeFeedback (
    feedback_id INT PRIMARY KEY IDENTITY(1,1),
    employee_id INT,
    feedback_date DATE,
    sentiment_score DECIMAL(3,2),
    feedback_text NVARCHAR(MAX),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

-- INSERT DATA FROM YOUR CSV FILES
USE CompanyAnalytics;
GO
-- Insert Departments
INSERT INTO Departments (department_name) VALUES
('Business Analysis'),
('Agile Office'),
('Product'),
('Operations'),
('Data'),
('Engineering'),
('Design'),
('Management'),
('Support'),
('Quality Assurance');

-- Insert Positions
INSERT INTO Positions (position_title, salary_band) VALUES
('Business Analyst', '60k-80k'),
('Scrum Master', '70k-90k'),
('Product Manager', '80k-110k'),
('DevOps Engineer', '70k-95k'),
('Data Scientist', '75k-105k'),
('Software Engineer', '65k-95k'),
('UI/UX Designer', '60k-85k'),
('Tech Lead', '90k-120k'),
('Support Engineer', '50k-70k'),
('QA Engineer', '55k-75k');

-- Insert Clients
INSERT INTO Clients (client_name) VALUES
('LogistiCo'),
('MediHealth'),
('FinServe'),
('GreenEnergy'),
('RetailX'),
('BankNow'),
('EduPro'),
('TechCorp');

-- Insert Locations
INSERT INTO Locations (location_name) VALUES
('Sydney'),
('Berlin'),
('New York'),
('Toronto'),
('London'),
('Cape Town'),
('Bangalore'),
('San Francisco');

-- Insert Managers
INSERT INTO Managers (manager_name) VALUES
('Drew Garcia'),
('Alex Smith'),
('Taylor Johnson'),
('Morgan Johnson');

-- Insert Employees (from software_company_employees.csv)
INSERT INTO Employees (employee_name, department_id, position_id, client_id, location_id, email, phone, hire_date) VALUES
('Drew Garcia', 1, 1, 1, 1, 'drew.garcia@example.com', '+1-202-395-5808', '2019-03-15'),
('Alex Smith', 2, 2, 2, 1, 'alex.smith@example.com', '+1-202-815-5962', '2018-07-22'),
('Casey Davis', 3, 3, 3, 2, 'casey.davis@example.com', '+1-202-633-3771', '2020-01-08'),
('Riley Garcia', 4, 4, 4, 2, 'riley.garcia@example.com', '+1-202-585-9340', '2021-05-12'),
('Alex Brown', 1, 1, 3, 3, 'alex.brown@example.com', '+1-202-448-8702', '2019-09-30'),
('Taylor Jones', 4, 4, 5, 4, 'taylor.jones@example.com', '+1-202-875-7825', '2020-11-18'),
('Morgan Martinez', 1, 1, 6, 5, 'morgan.martinez@example.com', '+1-202-517-8320', '2018-12-03'),
('Casey Garcia', 1, 1, 7, 4, 'casey.garcia@example.com', '+1-202-117-4317', '2021-08-25'),
('Jordan Brown', 4, 4, 7, 2, 'jordan.brown@example.com', '+1-202-703-9455', '2020-04-14'),
('Taylor Johnson', 5, 5, 4, 2, 'taylor.johnson@example.com', '+1-202-634-9476', '2019-06-28'),
('Chris Miller', 5, 5, 1, 4, 'chris.miller@example.com', '+1-202-531-5722', '2022-02-17'),
('Jamie Brown', 6, 6, 4, 6, 'jamie.brown@example.com', '+1-202-970-7101', '2021-01-11'),
('Jordan Garcia', 7, 7, 1, 2, 'jordan.garcia@example.com', '+1-202-563-4043', '2020-07-09'),
('Casey Jones', 3, 3, 3, 4, 'casey.jones@example.com', '+1-202-524-8141', '2019-10-05'),
('Riley Williams', 1, 1, 6, 5, 'riley.williams@example.com', '+1-202-227-4504', '2018-11-23'),
('Sam Martinez', 2, 2, 5, 1, 'sam.martinez@example.com', '+1-202-181-7222', '2021-03-07'),
('Chris Williams', 1, 1, 8, 5, 'chris.williams@example.com', '+1-202-310-2252', '2020-09-16'),
('Morgan Jones', 2, 2, 6, 1, 'morgan.jones@example.com', '+1-202-742-8863', '2019-12-12'),
('Jordan Williams', 3, 3, 5, 8, 'jordan.williams@example.com', '+1-202-431-8894', '2022-06-30'),
('Casey Martinez', 6, 6, 8, 3, 'casey.martinez@example.com', '+1-202-886-8842', '2021-11-04'),
('Morgan Johnson', 1, 1, 6, 7, 'morgan.johnson@example.com', '+1-202-204-5995', '2015-02-28'),
('Jamie Lee', 4, 4, 1, 7, 'jamie.lee@example.com', '+1-202-993-1856', '2018-08-19'),
('Jamie Johnson', 3, 3, 5, 7, 'jamie.johnson@example.com', '+1-202-188-6100', '2021-09-13'),
('Jamie Williams', 7, 7, 4, 6, 'jamie.williams@example.com', '+1-202-651-8919', '2016-05-21'),
('Jamie Smith', 2, 2, 8, 4, 'jamie.smith@example.com', '+1-202-746-2496', '2019-01-17'),
('Alex Garcia', 8, 8, 6, 6, 'alex.garcia@example.com', '+1-202-201-3573', '2018-04-26'),
('Drew Miller', 3, 3, 2, 7, 'drew.miller@example.com', '+1-202-876-9193', '2022-10-01'),
('Jamie Martinez', 6, 6, 7, 6, 'jamie.martinez@example.com', '+1-202-970-8216', '2021-07-08'),
('Sam Martinez', 1, 1, 5, 1, 'sam.martinez@example.com', '+1-202-974-8986', '2019-11-29'),
('Morgan Martinez', 4, 4, 7, 7, 'morgan.martinez@example.com', '+1-202-140-2467', '2020-12-15'),
('Riley Brown', 9, 9, 3, 2, 'riley.brown@example.com', '+1-202-833-6733', '2021-04-03'),
('Taylor Smith', 9, 9, 2, 3, 'taylor.smith@example.com', '+1-202-519-3466', '2018-06-14'),
('Taylor Miller', 7, 7, 6, 1, 'taylor.miller@example.com', '+1-202-837-6569', '2022-03-22'),
('Alex Miller', 3, 3, 1, 6, 'alex.miller@example.com', '+1-202-280-7728', '2020-08-06'),
('Sam Smith', 1, 1, 4, 7, 'sam.smith@example.com', '+1-202-580-9775', '2019-05-18'),
('Drew Martinez', 10, 10, 8, 1, 'drew.martinez@example.com', '+1-202-673-9898', '2021-12-09'),
('Jordan Miller', 10, 10, 5, 7, 'jordan.miller@example.com', '+1-202-128-1946', '2020-10-31'),
('Taylor Johnson', 7, 7, 3, 6, 'taylor.johnson@example.com', '+1-202-656-5416', '2018-09-07'),
('Jordan Jones', 7, 7, 4, 2, 'jordan.jones@example.com', '+1-202-423-3771', '2022-01-24');

-- Insert Performance Reviews (from employee_annual_reviews.csv)
-- Note: Converting comma decimal separator to period for SQL compatibility
INSERT INTO PerformanceReviews (employee_id, manager_id, performance_rating, performance_score, comments) VALUES
(1, 3, 'Good', 3.0, 'Meets expectations and delivers reliable work.'),
(2, 2, 'Satisfactory', 4.8, 'Generally meets expectations but has room for improvement.'),
(3, 4, 'Needs Improvement', 3.9, 'Performance below expectations, requires development and support.'),
(4, 1, 'Good', 2.2, 'Meets expectations and delivers reliable work.'),
(5, 4, 'Satisfactory', 2.2, 'Generally meets expectations but has room for improvement.'),
(6, 3, 'Satisfactory', 3.4, 'Generally meets expectations but has room for improvement.'),
(7, 4, 'Satisfactory', 4.4, 'Generally meets expectations but has room for improvement.'),
(8, 3, 'Needs Improvement', 3.1, 'Performance below expectations, requires development and support.'),
(9, 1, 'Needs Improvement', 2.0, 'Performance below expectations, requires development and support.'),
(10, 3, 'Excellent', 4.5, 'Consistently exceeds expectations and delivers outstanding results.'),
(11, 2, 'Very Good', 4.4, 'Performs above expectations with strong contributions to the team.'),
(12, 2, 'Needs Improvement', 2.0, 'Performance below expectations, requires development and support.'),
(12, 3, 'Excellent', 3.4, 'Consistently exceeds expectations and delivers outstanding results.'),
(13, 2, 'Excellent', 3.6, 'Consistently exceeds expectations and delivers outstanding results.'),
(14, 1, 'Very Good', 2.3, 'Performs above expectations with strong contributions to the team.'),
(15, 4, 'Very Good', 2.2, 'Performs above expectations with strong contributions to the team.'),
(16, 2, 'Excellent', 2.4, 'Consistently exceeds expectations and delivers outstanding results.'),
(17, 2, 'Needs Improvement', 3.0, 'Performance below expectations, requires development and support.'),
(18, 2, 'Needs Improvement', 2.2, 'Performance below expectations, requires development and support.'),
(19, 2, 'Excellent', 4.9, 'Consistently exceeds expectations and delivers outstanding results.'),
(20, 4, 'Excellent', 3.9, 'Consistently exceeds expectations and delivers outstanding results.'),
(21, 1, 'Excellent', 4.5, 'Consistently exceeds expectations and delivers outstanding results.'),
(22, 3, 'Very Good', 4.2, 'Performs above expectations with strong contributions to the team.'),
(23, 4, 'Needs Improvement', 3.1, 'Performance below expectations, requires development and support.'),
(24, 2, 'Good', 4.4, 'Meets expectations and delivers reliable work.'),
(25, 1, 'Excellent', 2.7, 'Consistently exceeds expectations and delivers outstanding results.'),
(21, 3, 'Needs Improvement', 3.2, 'Performance below expectations, requires development and support.'),
(2, 4, 'Excellent', 3.0, 'Consistently exceeds expectations and delivers outstanding results.'),
(21, 1, 'Good', 3.0, 'Meets expectations and delivers reliable work.'),
(6, 2, 'Good', 4.1, 'Meets expectations and delivers reliable work.'),
(3, 1, 'Good', 3.9, 'Meets expectations and delivers reliable work.'),
(11, 1, 'Good', 3.0, 'Meets expectations and delivers reliable work.'),
(21, 4, 'Needs Improvement', 2.2, 'Performance below expectations, requires development and support.'),
(21, 4, 'Needs Improvement', 4.7, 'Performance below expectations, requires development and support.'),
(26, 3, 'Very Good', 4.1, 'Performs above expectations with strong contributions to the team.'),
(27, 4, 'Satisfactory', 3.2, 'Generally meets expectations but has room for improvement.'),
(28, 2, 'Satisfactory', 4.3, 'Generally meets expectations but has room for improvement.'),
(19, 1, 'Very Good', 3.9, 'Performs above expectations with strong contributions to the team.'),
(29, 3, 'Satisfactory', 3.7, 'Generally meets expectations but has room for improvement.'),
(30, 2, 'Needs Improvement', 3.5, 'Performance below expectations, requires development and support.'),
(31, 2, 'Good', 2.8, 'Meets expectations and delivers reliable work.'),
(32, 1, 'Excellent', 3.9, 'Consistently exceeds expectations and delivers outstanding results.'),
(33, 3, 'Satisfactory', 4.0, 'Generally meets expectations but has room for improvement.'),
(34, 2, 'Very Good', 2.8, 'Performs above expectations with strong contributions to the team.'),
(35, 4, 'Satisfactory', 4.0, 'Generally meets expectations but has room for improvement.'),
(36, 1, 'Good', 2.1, 'Meets expectations and delivers reliable work.'),
(37, 2, 'Satisfactory', 2.8, 'Generally meets expectations but has room for improvement.'),
(5, 4, 'Excellent', 3.4, 'Consistently exceeds expectations and delivers outstanding results.'),
(10, 2, 'Needs Improvement', 2.0, 'Performance below expectations, requires development and support.'),
(39, 1, 'Good', 2.6, 'Meets expectations and delivers reliable work.');

INSERT INTO Education (employee_id, degree, institution, graduation_year, field_of_study) VALUES
(1, 'BSc Business Administration', 'University of Sydney', 2017, 'Business Administration'),
(2, 'MSc Agile Project Management', 'MIT', 2016, 'Project Management'),
(3, 'MBA Product Management', 'Harvard Business School', 2018, 'Product Management'),
(4, 'BEng Computer Science', 'Technical University of Berlin', 2019, 'Computer Science'),
(5, 'BSc Data Analytics', 'Columbia University', 2017, 'Data Analytics'),
(6, 'BSc Computer Engineering', 'University of Toronto', 2018, 'Computer Engineering'),
(7, 'MSc Information Systems', 'Imperial College London', 2016, 'Information Systems'),
(8, 'BSc Business Analysis', 'University of Toronto', 2019, 'Business Analysis'),
(9, 'BEng DevOps Engineering', 'Technical University of Berlin', 2018, 'DevOps Engineering'),
(10, 'MSc Data Science', 'Technical University of Berlin', 2017, 'Data Science'),
(11, 'BSc Computer Science', 'University of Toronto', 2020, 'Computer Science'),
(12, 'BEng Software Engineering', 'University of Cape Town', 2019, 'Software Engineering'),
(13, 'BA Graphic Design', 'Technical University of Berlin', 2018, 'Graphic Design'),
(14, 'MBA Product Strategy', 'University of Toronto', 2017, 'Product Strategy'),
(15, 'MSc Business Intelligence', 'Imperial College London', 2016, 'Business Intelligence'),
(16, 'BSc Project Management', 'University of Sydney', 2019, 'Project Management'),
(17, 'BSc Business Analysis', 'Imperial College London', 2018, 'Business Analysis'),
(18, 'MSc Agile Management', 'University of Sydney', 2017, 'Agile Management'),
(19, 'MBA Product Development', 'Stanford University', 2020, 'Product Development'),
(20, 'BEng Software Development', 'Columbia University', 2019, 'Software Development'),
(21, 'BSc Business Administration', 'Indian Institute of Technology', 2018, 'Business Administration'),
(22, 'BEng Cloud Engineering', 'Indian Institute of Technology', 2016, 'Cloud Engineering'),
(23, 'MBA Product Management', 'Indian Institute of Technology', 2019, 'Product Management'),
(24, 'BA User Experience Design', 'University of Cape Town', 2018, 'User Experience Design'),
(25, 'MSc Scrum Management', 'University of Toronto', 2017, 'Scrum Management'),
(26, 'MSc Technology Leadership', 'University of Cape Town', 2016, 'Technology Leadership'),
(27, 'MBA Strategic Management', 'Indian Institute of Technology', 2020, 'Strategic Management'),
(28, 'BEng Software Engineering', 'University of Cape Town', 2019, 'Software Engineering'),
(29, 'BSc Business Analysis', 'University of Sydney', 2017, 'Business Analysis'),
(30, 'BEng DevOps', 'Indian Institute of Technology', 2018, 'DevOps'),
(31, 'BSc Technical Support', 'Technical University of Berlin', 2019, 'Technical Support'),
(32, 'BEng Support Engineering', 'Columbia University', 2016, 'Support Engineering'),
(33, 'BA UX/UI Design', 'University of Sydney', 2020, 'UX/UI Design'),
(34, 'MBA Product Strategy', 'University of Cape Town', 2018, 'Product Strategy'),
(35, 'BSc Business Analysis', 'Indian Institute of Technology', 2017, 'Business Analysis'),
(36, 'BSc Quality Assurance', 'University of Sydney', 2019, 'Quality Assurance'),
(37, 'BSc Software Testing', 'Indian Institute of Technology', 2018, 'Software Testing'),
(38, 'BA User Interface Design', 'University of Cape Town', 2016, 'User Interface Design'),
(39, 'BA Visual Design', 'Technical University of Berlin', 2020, 'Visual Design');


INSERT INTO Training (employee_id, training_title, provider, date_completed, certification_awarded) VALUES
(1, 'Advanced Business Analysis', 'IIBA', '2023-03-15', 1),
(1, 'Agile Business Analysis', 'Scrum Alliance', '2023-06-20', 1),
(2, 'Certified Scrum Master', 'Scrum Alliance', '2022-11-10', 1),
(2, 'Advanced Scrum Techniques', 'Scrum.org', '2023-08-14', 1),
(3, 'Product Owner Certification', 'Product School', '2023-01-25', 1),
(3, 'Strategic Product Management', 'Coursera', '2023-07-30', 0),
(4, 'AWS DevOps Professional', 'AWS', '2023-02-18', 1),
(4, 'Kubernetes Administration', 'Linux Foundation', '2023-09-05', 1),
(5, 'Google Analytics Certified', 'Google', '2023-04-12', 1),
(5, 'Advanced SQL for Data Analysis', 'Udemy', '2023-08-22', 0),
(6, 'Full Stack Development', 'FreeCodeCamp', '2022-12-08', 1),
(6, 'React Advanced Patterns', 'Pluralsight', '2023-05-17', 0),
(7, 'UX Research Methods', 'Nielsen Norman Group', '2023-03-28', 1),
(7, 'Design Thinking Workshop', 'IDEO', '2023-10-14', 0),
(8, 'Business Process Modeling', 'BPM Institute', '2023-06-03', 1),
(8, 'Data Visualization with Tableau', 'Tableau', '2023-11-20', 1),
(9, 'Docker Containerization', 'Docker', '2023-01-15', 1),
(9, 'CI/CD Pipeline Management', 'Jenkins', '2023-07-08', 0),
(10, 'Machine Learning Fundamentals', 'Coursera', '2023-02-22', 1),
(10, 'Python for Data Science', 'DataCamp', '2023-09-18', 1),
(11, 'Advanced Python Programming', 'Python Institute', '2023-04-05', 1),
(11, 'Database Design Principles', 'Oracle', '2023-08-30', 0),
(12, 'Microservices Architecture', 'Red Hat', '2023-03-12', 1),
(12, 'Clean Code Practices', 'Uncle Bob Consulting', '2023-10-25', 0),
(13, 'Adobe Creative Suite Mastery', 'Adobe', '2023-01-08', 1),
(13, 'User Experience Principles', 'UX Mastery', '2023-06-15', 1),
(14, 'Lean Product Development', 'Lean Startup Co', '2023-02-28', 1),
(14, 'Customer Journey Mapping', 'Service Design Network', '2023-09-12', 0),
(15, 'Advanced Excel Analytics', 'Microsoft', '2023-04-18', 1),
(15, 'Business Intelligence Tools', 'Qlik', '2023-11-02', 1),
(16, 'Certified Scrum Product Owner', 'Scrum Alliance', '2023-05-22', 1),
(16, 'Agile Estimation Techniques', 'Mountain Goat Software', '2023-08-07', 0),
(17, 'Requirements Engineering', 'IREB', '2023-01-30', 1),
(17, 'Stakeholder Management', 'PMI', '2023-07-25', 1),
(18, 'Team Leadership Skills', 'Dale Carnegie', '2023-03-20', 0),
(18, 'Conflict Resolution', 'Harvard Extension', '2023-10-08', 1),
(19, 'Growth Product Management', 'Reforge', '2023-06-12', 1),
(19, 'A/B Testing Mastery', 'Optimizely', '2023-12-05', 1),
(20, 'Spring Boot Development', 'Pivotal', '2023-02-14', 1),
(20, 'API Design Best Practices', 'Postman', '2023-09-28', 0),
(21, 'Power BI Advanced', 'Microsoft', '2023-04-08', 1),
(21, 'Financial Analysis Fundamentals', 'CFA Institute', '2023-11-15', 0),
(22, 'Terraform Infrastructure', 'HashiCorp', '2023-01-22', 1),
(22, 'Site Reliability Engineering', 'Google', '2023-08-18', 1),
(23, 'Product Strategy Framework', 'ProductPlan', '2023-03-05', 1),
(23, 'Market Research Methods', 'Qualtrics', '2023-10-20', 0),
(24, 'Figma Advanced Design', 'Figma', '2023-05-15', 1),
(24, 'Design Systems Creation', 'InVision', '2023-12-12', 1),
(25, 'Scaled Agile Framework', 'Scaled Agile', '2023-02-08', 1),
(25, 'Remote Team Management', 'Remote.co', '2023-09-03', 0),
(26, 'Technical Leadership', 'Pluralsight', '2023-04-25', 1),
(26, 'Software Architecture Patterns', 'O''Reilly', '2023-11-08', 1),
(27, 'Product Roadmapping', 'ProductPlan', '2023-01-18', 1),
(27, 'Customer Development', 'Steve Blank', '2023-08-25', 0),
(28, 'Node.js Advanced', 'Node Foundation', '2023-03-30', 1),
(28, 'GraphQL Implementation', 'Apollo', '2023-10-18', 1),
(29, 'Process Optimization', 'Lean Six Sigma', '2023-06-08', 1),
(29, 'Change Management', 'Prosci', '2023-12-22', 0),
(30, 'Azure Cloud Architecture', 'Microsoft', '2023-02-12', 1),
(30, 'Monitoring and Observability', 'Datadog', '2023-09-15', 1),
(31, 'ITIL Foundation', 'Axelos', '2023-04-20', 1),
(31, 'Customer Service Excellence', 'Service Quality Institute', '2023-11-28', 0),
(32, 'Technical Writing', 'Google', '2023-01-25', 1),
(32, 'Incident Management', 'PagerDuty', '2023-08-12', 1),
(33, 'Sketch to Figma Migration', 'Figma', '2023-03-15', 0),
(33, 'Accessibility in Design', 'WebAIM', '2023-10-30', 1),
(34, 'OKR Implementation', 'Weekdone', '2023-05-28', 1),
(34, 'Competitive Analysis', 'Crayon', '2023-12-18', 0),
(35, 'SQL Server Administration', 'Microsoft', '2023-02-20', 1),
(35, 'Business Intelligence Development', 'Microsoft', '2023-09-25', 1),
(36, 'Test Automation with Selenium', 'Selenium HQ', '2023-04-15', 1),
(36, 'API Testing with Postman', 'Postman', '2023-11-12', 0),
(37, 'Mobile App Testing', 'Appium', '2023-01-12', 1),
(37, 'Performance Testing', 'LoadRunner', '2023-08-28', 1),
(38, 'Motion Design Principles', 'School of Motion', '2023-03-25', 1),
(38, 'Prototyping with Principle', 'Principle', '2023-10-15', 0),
(39, 'Brand Identity Design', 'Logo Design Love', '2023-06-18', 1),
(39, 'Typography Mastery', 'Typography.com', '2023-12-08', 1);



INSERT INTO EmployeeFeedback (employee_id, feedback_date, sentiment_score, feedback_text) VALUES
(1, '2024-01-15', 0.8, 'Great collaborative environment and challenging projects. Management is supportive.'),
(2, '2024-01-16', 0.9, 'Love the agile culture here. Team dynamics are excellent and processes are smooth.'),
(3, '2024-01-17', 0.6, 'Product strategy alignment could be better. Sometimes unclear priorities from stakeholders.'),
(4, '2024-01-18', 0.85, 'Infrastructure challenges are interesting to solve. Good work-life balance overall.'),
(5, '2024-01-19', 0.7, 'Data quality issues sometimes slow down analysis. Tools and resources are adequate.'),
(6, '2024-01-20', 0.75, 'Codebase is well-maintained. More pair programming opportunities would be beneficial.'),
(7, '2024-01-21', 0.9, 'Design system implementation has been rewarding. Great feedback loop with development.'),
(8, '2024-01-22', 0.65, 'Stakeholder requirements gathering process needs improvement. Communication gaps exist.'),
(9, '2024-01-23', 0.8, 'DevOps automation initiatives are progressing well. Team collaboration is strong.'),
(10, '2024-01-24', 0.95, 'Exciting machine learning projects. Access to cutting-edge tools and technologies.'),
(11, '2024-01-25', 0.7, 'Code reviews are thorough but sometimes slow. Learning opportunities are abundant.'),
(12, '2024-01-26', 0.85, 'Microservices migration project is challenging but rewarding. Good technical mentorship.'),
(13, '2024-01-27', 0.8, 'Design feedback cycles are efficient. Cross-functional collaboration works well.'),
(14, '2024-01-28', 0.6, 'Product roadmap changes frequently. Need more stable long-term vision.'),
(15, '2024-01-29', 0.75, 'Business analysis tools are modern. Some processes could be more streamlined.'),
(16, '2024-01-30', 0.9, 'Scrum ceremonies are well-organized. Team velocity has improved significantly.'),
(17, '2024-02-01', 0.55, 'Requirements documentation process is cumbersome. Tool integration issues persist.'),
(18, '2024-02-02', 0.7, 'Team dynamics are improving. Retrospectives lead to actionable improvements.'),
(19, '2024-02-03', 0.85, 'Product metrics dashboard is very helpful. Customer feedback integration is smooth.'),
(20, '2024-02-04', 0.8, 'Backend architecture is solid. Performance optimization challenges are engaging.'),
(21, '2024-02-05', 0.75, 'Business intelligence reports are impactful. Data pipeline reliability has improved.'),
(22, '2024-02-06', 0.9, 'Cloud infrastructure migration went smoothly. Monitoring and alerting are comprehensive.'),
(23, '2024-02-07', 0.65, 'Product launch coordination could be better. Multiple stakeholder management is complex.'),
(24, '2024-02-08', 0.85, 'User research insights are valuable. Design system adoption is increasing.'),
(25, '2024-02-09', 0.8, 'Cross-team coordination has improved. Agile coaching sessions are beneficial.'),
(26, '2024-02-10', 0.9, 'Technical leadership opportunities are growing. Architecture decisions have good impact.'),
(27, '2024-02-11', 0.7, 'Product strategy communication needs work. Market research resources are limited.'),
(28, '2024-02-12', 0.8, 'Full-stack development is engaging. Code quality standards are high.'),
(29, '2024-02-13', 0.75, 'Process improvements are showing results. Change management support is adequate.'),
(30, '2024-02-14', 0.85, 'Infrastructure automation is advancing well. Security practices are robust.'),
(31, '2024-02-15', 0.7, 'Customer support tools are improving. Response time targets are challenging.'),
(32, '2024-02-16', 0.8, 'Technical documentation quality has improved. Knowledge sharing sessions are helpful.'),
(33, '2024-02-17', 0.85, 'Design critique sessions are constructive. Creative freedom is well-balanced.'),
(34, '2024-02-18', 0.75, 'Product analytics setup is comprehensive. Stakeholder reporting could be automated.'),
(35, '2024-02-19', 0.8, 'Business intelligence platform is powerful. Training on advanced features would help.'),
(36, '2024-02-20', 0.7, 'Test automation framework is maturing. Integration with CI/CD pipeline is smooth.'),
(37, '2024-02-21', 0.75, 'Quality assurance processes are thorough. Bug tracking and resolution workflow is efficient.'),
(38, '2024-02-22', 0.9, 'Creative projects are inspiring. Design tool ecosystem is well-integrated.'),
(39, '2024-02-23', 0.85, 'Visual design standards are clear. Brand consistency efforts are paying off.');




INSERT INTO WorkHours (employee_id, date, hours_worked, overtime_hours) VALUES
-- Sample work hours for first 10 employees across recent dates
(1, '2024-01-15', 8.0, 0.5),
(1, '2024-01-16', 7.5, 0.0),
(1, '2024-01-17', 8.5, 0.5),
(1, '2024-01-18', 8.0, 1.0),
(1, '2024-01-19', 7.0, 0.0),
(2, '2024-01-15', 8.0, 0.0),
(2, '2024-01-16', 8.5, 0.5),
(2, '2024-01-17', 8.0, 0.0),
(2, '2024-01-18', 7.5, 0.0),
(2, '2024-01-19', 8.0, 1.5),
(3, '2024-01-15', 8.5, 1.0),
(3, '2024-01-16', 8.0, 0.0),
(3, '2024-01-17', 9.0, 1.0),
(3, '2024-01-18', 7.5, 0.0),
(3, '2024-01-19', 8.0, 0.5),
(4, '2024-01-15', 8.0, 0.0),
(4, '2024-01-16', 8.5, 0.5),
(4, '2024-01-17', 8.0, 2.0),
(4, '2024-01-18', 7.0, 0.0),
(4, '2024-01-19', 8.5, 0.5),
(5, '2024-01-15', 9.0, 1.0),
(5, '2024-01-16', 8.0, 0.0),
(5, '2024-01-17', 8.5, 0.5),
(5, '2024-01-18', 8.0, 1.0),
(5, '2024-01-19', 7.5, 0.0),
(6, '2024-01-15', 8.0, 0.5),
(6, '2024-01-16', 8.5, 1.5),
(6, '2024-01-17', 8.0, 0.0),
(6, '2024-01-18', 9.0, 1.0),
(6, '2024-01-19', 7.5, 0.0),
(7, '2024-01-15', 8.0, 0.0),
(7, '2024-01-16', 8.5, 0.5),
(7, '2024-01-17', 8.0, 0.0),
(7, '2024-01-18', 8.0, 0.5),
(7, '2024-01-19', 8.5, 1.0),
(8, '2024-01-15', 8.5, 0.5),
(8, '2024-01-16', 8.0, 0.0),
(8, '2024-01-17', 7.5, 0.0),
(8, '2024-01-18', 8.0, 1.0),
(8, '2024-01-19', 8.5, 0.5),
(9, '2024-01-15', 8.0, 2.0),
(9, '2024-01-16', 8.5, 0.5),
(9, '2024-01-17', 8.0, 0.0),
(9, '2024-01-18', 7.5, 0.0),
(9, '2024-01-19', 9.0, 1.0),
(10, '2024-01-15', 8.0, 0.0),
(11, '2024-01-15', 8.0, 0.5),
(12, '2024-01-15', 8.5, 1.0),
(13, '2024-01-15', 8.0, 0.0),
(14, '2024-01-15', 9.0, 1.5),
(15, '2024-01-15', 8.0, 0.0),
(16, '2024-01-15', 8.5, 0.5),
(17, '2024-01-15', 7.5, 0.0),
(18, '2024-01-15', 8.0, 1.0),
(19, '2024-01-15', 8.5, 0.5),
(20, '2024-01-15', 8.0, 0.0),
(21, '2024-01-16', 8.0, 0.5),
(22, '2024-01-16', 8.5, 2.0),
(23, '2024-01-16', 8.0, 0.0),
(24, '2024-01-16', 8.5, 1.0),
(25, '2024-01-16', 8.0, 0.0),
(26, '2024-01-16', 9.0, 1.5),
(27, '2024-01-16', 8.0, 0.5),
(28, '2024-01-16', 8.5, 0.5),
(29, '2024-01-16', 8.0, 0.0),
(30, '2024-01-16', 8.0, 1.0),
(31, '2024-01-17', 8.5, 0.0),
(32, '2024-01-17', 8.0, 0.5),
(33, '2024-01-17', 8.5, 1.0),
(34, '2024-01-17', 8.0, 0.0),
(35, '2024-01-17', 8.0, 0.5),
(36, '2024-01-17', 8.5, 0.0),
(37, '2024-01-17', 8.0, 1.0),
(38, '2024-01-17', 8.5, 0.5),
(39, '2024-01-17', 8.0, 0.0);
