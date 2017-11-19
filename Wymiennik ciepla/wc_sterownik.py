#-*- coding: utf-8 -*-

import pid
import MySQLdb
import time

p = pid.PID(5.0, 2.0, 5.0)  # inicjalizaja regulatora PID
wait_time = 1

while True:
	con = MySQLdb.connect('12.12.12.55', 'pkss', 'pkss125', 'pkss')  # połączenie z bazą
	cur = con.cursor()

	cur.execute("SELECT value FROM system where name = 'Tzco' ")
	tzco = cur.fetchall()
	cur.execute("SELECT value FROM system where name = 'To' ")
	to = cur.fetchall()
	to = int(to[0][0])
	tzco = int(tzco[0][0])
	
	print(to, tzco)
	#e =  to- 55 -  tzco # uchyb regulacji: różnica pomiędzy zadaną temperaturą wody wypływającej z wymiennika (to-55), a aktualną wartością
	p.setPoint(55.0-1.75*to)
	um = p.update(tzco) + 20
	if um > 60:  # saturacja
		um = 60
	if um < 20:
		um = 20
	um = (um,)
	update_um = "UPDATE system SET value = %s WHERE name = 'um'"
	cur.execute(update_um, um)
	con.commit()
	con.close()
	time.sleep(wait_time)
