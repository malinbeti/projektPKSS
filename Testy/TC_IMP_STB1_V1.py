import MySQLdb
import time

#####################################################################################
Autor = "Krzysztof B³achut"
TC = "TC_IMP_STB1_V1"
Req = "Req_IMP_STB1_V1"
Opis = ""
Data = time.asctime()
#####################################################################################
File = open('Raporty/Req_IMP_STB1_V1.txt','w')
File.write("##############################     " + TC + "     ##############################\n")
File.write("Requirement: " + Req + "\n")
File.write("Opis: " + Opis + "\n")
File.write("Autor: " + Autor + "\n")
File.write("Data wykonania testu: " + Data + "\n")
File.write("##################################################################################\n\n")
#####################################################################################

# Open database connection
db = MySQLdb.connect(host="12.12.12.55", port=3306, user="pkss", passwd="pkss125", db="pkss")

# prepare a cursor object using cursor() method
cursor = db.cursor()

#####################################################################################
Tr1 = 10.0
Tr1zad = 20.0
#Um = To

# execute SQL query using execute() method.
command1 = "UPDATE system SET value="+ str(Tr1) +" where name='Tr1'"
command2 = "UPDATE system SET value="+ str(Tr1zad) +" where name='Tr1zad'"
#command3 = "UPDATE system SET value="+ str(Um) +" where name='Um'"

cursor.execute(command1)
cursor.execute(command2)
#cursor.execute(command3)

#####################################################################################

time.sleep(1)

# Fetch a single row using fetchone() method.
cursor.execute("SELECT * from system where name='Ub1'")
Ub1 = cursor.fetchone()[1]
cursor.execute("SELECT * from system where name='Tr1'")
Tr1new = cursor.fetchone()[1]
#Tr1new = float(Tr1new)
#print "Tr1 temperature : %s " % Tr1new

#####################################################################################
status_flag = False

if (Ub1<=60) & (Ub1>=20) & abs(Tr1new-Tr1zad)<0.05*Tr1zad :
    status_flag = True
else :
    status_flag = False

#if (Tzco<Um) & (Umnew<=Um) :
    #status_flag = True
#else :
    #status_flag = False
    
#if status_flag==True:
    #print "Test passed"
#else :
    #print "Test failed"  

if status_flag==True:
    File.write("##############################   PASSED   ##############################\n")
else :
    File.write("##############################   FAILED   ##############################\n")
File.write("Tr1: " + str(Tr1) + "       Tr1zad: " + str(Tr1zad) + "         | Ub1: " + str(Ub1) + "       Tr1: " + str(Tr1new) +"\n")
File.close()

#####################################################################################
# disconnect from server
db.close()