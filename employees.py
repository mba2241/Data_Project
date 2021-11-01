
import csv

#Read in user input t for employees and out data as csv file
with open ('employees.csv', 'w+') as file:
    myFile = csv.writer(file)
    myFile.writerow(["Id", "Name", "Age", "Salary", "Department_id", "Address_id", "Manager_id"])
    noOfEmployees = int (input ("Please enter the number of employees you want: "))
    
    for i in range (noOfEmployees):
        id = int (input ( "Employee "+ str(i +1) + "Enter Id\t:"))
        name = input ( "Employee "+ str(i +1) + "Enter Name\t:")
        age = int (input("Employee "+ str(i +1) + "Enter Age\t:"))
        salary = int (input ("Employee "+ str(i +1) + "Enter Salary\t:"))
        department_id = int (input ("Employee "+ str(i +1) +"Enter Department Id\t:"))
        address_id = int (input ("Employee "+ str(i +1) +"Enter Address Id\t:"))
        manager_id = int (input ("Employee "+ str(i +1) +"Enter Manager Id\t:"))

        myFile.writerow([id, name, age, salary, department_id, address_id, manager_id])








