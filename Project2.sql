--Import your CSV data that you created for the Python portion
import pandas AS pd
import pyodbc

# Import CSV
data = pd.read_csv (r'C:\Users\Ron\Desktop\mamadouba\Employees.csv')   
df = pd.DataFrame(data)

# Connect to SQL Server
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=RON\SQLEXPRESS;'
                      'Database=test_database;'
                      'Trusted_Connection=yes;')
cursor = conn.cursor()


        -- Create table for Employee, Address, and Department
        /************************
        * CREATE Employee table *
        *************************/
        CREATE TABLE tmp.Employee 
        (
            employees_id INT PRIMARY KEY IDENTITY,
            employees_name VARCHAR (30) NOT NULL,
            employees_age INT NOT NULL, 
            employees_salary INT NULL,
            dpt_id INT NOT NULL,
            ads_id INT NOT NULL, 
            manager_id INT NOT NULL
        );

        /************************
        * CREATE Address table *
        *************************/

        CREATE TABLE tmp.Address 
        (
            address_id INT IDENTITY (1,1),
            street VARCHAR (50) NOT NULL,
            city VARCHAR (50) NOT NULL,
            st VARCHAR (30) NOT NULL,
            PRIMARY KEY (address_id),
            FOREIGN KEY (st) REFERENCES tmp.Employee (ads_id)
        );


        /************************
        * CREATE Department table *
        *************************/

        CREATE TABLE tmp.Department  
        (
            department_id INT IDENTITY (1,1),
            department_name VARCHAR (50) NOT NULL,
            manager_id INT (50) NOT NULL,
            st VARCHAR (30) NOT NULL,
            PRIMARY KEY (department_id),
            FOREIGN KEY (st) REFERENCES tmp.Employee (dpt_id)
        );


        /****************************************************************
        * The full data for each Employee with their address as a string, 
        department name, and manager name*
        ****************************************************************/

        SELECT 
            department_id, department_name
        FROM 
            tmp.Department
        WHERE 
            department_id LIKE '_1%' AND department_name LIKE 'c%'
        ORDER BY 
            department_id ASC;


        /**********************************************
        * the 5 highest paid and lowest paid employees *
        ***********************************************/
        SELECT TOP 5
            *
        FROM
            tmp.Employee 
        ORDER BY
            employees_salary DESC;

        /***********************************************************************************
        * The total salary for each department, the manager's name, sorted by highest total*
        ************************************************************************************/
        SELECT  
            department_id, 
            COUNT(*) AS 'NUmber of people in a Department ',
            SUM (employees_salary) AS 'Total salary for each Department',
            AVG(employees_salary) AS 'Avg salary',
            MAX(employees_salary) AS 'Highest salary'
        FROM
            tmp.department, tmp.Employee
        GROUP BY
            department_id; 

        /*******************************************************************************
        * Each employee that lives in a given state (The state can be hard coded for now) *
        *********************************************************************************/
        SELECT 
            st
        FROM 
            tmp.Address 
        WHERE 
            st LIKE '%texas%'
        ORDER BY 
            st ;


conn.commit(); 


