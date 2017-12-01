import MySQLdb
import time

#####################################################################################
Autor = "Krzysztof B³achut"
TC = "TC_SYM_EC_V1"
Req = "Req_SYM_EC_V1"
Opis = ""
Data = time.asctime()
#####################################################################################
File = open('Raporty/Req_SYM_EC_V1.txt','w')
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
#Tpcob1 = 20.0
To = 10.0
#Tr1 = To
Tzm = 70-2.5*(To-6)

# execute SQL query using execute() method.
#command1 = "UPDATE system SET value="+ str(Tpcob1) +" where name='Tpcob1'"
command2 = "UPDATE system SET value="+ str(To) +" where name='To'"
#command3 = "UPDATE system SET value="+ str(Tr1) +" where name='Tr1'"

#cursor.execute(command1)
cursor.execute(command2)
#cursor.execute(command3)

#####################################################################################

time.sleep(1)

# Fetch a single row using fetchone() method.
cursor.execute("SELECT * from system where name='Tzm'")
Tzmnew = cursor.fetchone()[1]
#Tr1new = float(Tr1new)
#print "Tr1 temperature : %s " % Tr1new

#####################################################################################
status_flag = False

if (abs(Tzmnew-Tzm)<=0.05*Tzm) :
    status_flag = True
else :
    status_flag = False

#if (Tpcob1<Tr1) & (Tr1new<=Tr1) :
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
File.write("To: " + str(To) + "       | Tzm: " + str(Tzmnew) +"\n")
File.close()

#####################################################################################
# disconnect from server
db.close()