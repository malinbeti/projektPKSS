import MySQLdb
import time
import scipy
from scipy import integrate

#####################################################################################
Autor = "Krzysztof B�achut"
TC = "TC_SYM_B2_V1"
Req = "Req_SYM_B2_V1"
Opis = ""
Data = time.asctime()
#####################################################################################
File = open('Raporty/Req_SYM_B2_V1.txt','w')
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
Tpcob2 = 20.0
To = 10.0
Tr2 = To

# execute SQL query using execute() method.
command1 = "UPDATE system SET value="+ str(Tpcob2) +" where name='Tpcob2'"
command2 = "UPDATE system SET value="+ str(To) +" where name='To'"
command3 = "UPDATE system SET value="+ str(Tr2) +" where name='Tr2'"

cursor.execute(command1)
cursor.execute(command2)
cursor.execute(command3)

#####################################################################################

def d(temp,t):
    return (12*(Tpcob2-Tr2)-15*(Tr2-To))/20000
temp0 = Tr2
t = scipy.arange(0,1,0.01)
temp = scipy.integrate.odeint(d,temp0,t)
T = temp[:,0]
Tr2ref = T[99]

time.sleep(1)

# Fetch a single row using fetchone() method.
cursor.execute("SELECT * from system where name='Tr2'")
Tr2new = cursor.fetchone()[1]
#Tr1new = float(Tr1new)
#print "Tr1 temperature : %s " % Tr1new

#####################################################################################
status_flag = False

if (abs(Tr2new-Tr2ref)<0.05*Tr2ref) :
    status_flag = True
else :
    status_flag = False

#if (Tpcob2<Tr2) & (Tr2new<=Tr2) :
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
File.write("Tpcob2: " + str(Tpcob2) + "       To: " + str(To) + "         Tr2: " + str(Tr2) + "       | Tr2: " + str(Tr2new) +"\n")
File.close()

#####################################################################################
# disconnect from server
db.close()