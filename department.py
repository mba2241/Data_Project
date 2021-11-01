

import csv
import yaml

#Read in user input t for department and out data as csv file 
with open ('department.csv', 'w+') as file:
    myFile = csv.writer(file)
    myFile.writerow(["Department_Id", "Department_Name", "Manager_Id", "Headquarters_id"])
    noOfDepartment = int (input ("Please enter the number of Department you want: "))
    
    for i in range (noOfDepartment):
        department_id = int (input ( "Department " + str(i +1) + "Enter Department Id\t:"))
        department_name = input ( "Department " + str(i +1) + "Ente Department Name\t:")
        manager_id = int (input ("Department " + str(i +1) +"Enter Manager Id\t:"))
        hq_id = int (input ("Department " + str(i +1) +"Enter Headquarters Id\t:"))

        myFile.writerow([department_id, department_name, manager_id, hq_id])

#EXport department as yaml file
dict_file = (["Department_Id", "Department_Name", "Manager_Id", "Headquarters_id"])

with open(r'E:\data\department.yaml', 'w') as file:
    documents = yaml.dump(dict_file, file)