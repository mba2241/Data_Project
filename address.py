import csv

#Read in user input t for address and out data as csv file
with open ('address.csv', 'w+') as file:
    myFile = csv.writer(file)
    myFile.writerow(["Street_number", "Street_Name", "City", "State", "Postcode"])
    noOfAddress = int (input ("Please enter the number of addresses you want: "))
    
    for i in range (noOfAddress):
        street_nb = int (input ( "Address " + str(i +1) + "Enter street number\t:"))
        street_name = input ( "Address " + str(i +1) + "Enter street name\t:")
        city = input ( "Address " + str(i +1) + "Enter cit/town name\t:")
        state = input ( "Address " + str(i +1) + "Enter state name\t:")
        postcode = int (input ("Address " + str(i +1) +"Enter postcode\t:"))
        

        myFile.writerow([])


