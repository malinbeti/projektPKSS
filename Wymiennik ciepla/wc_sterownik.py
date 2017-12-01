import pid
import MySQLdb
import time

p = pid.PID(5.0, 5.0, 0)  # inicjalizaja regulatora PID
wait_time = 5000
flag = 1
while True:
    flag_prev = flag
    con = MySQLdb.connect('12.12.12.55', 'pkss', 'pkss125', 'pkss')  # połączenie z bazą
    cur = con.cursor()

    cur.execute("SELECT value FROM status")
    flag = cur.fetchall()
    if flag<flag_prev:
        cur.execute("SELECT value FROM system where name = 'Tzco' ")
        tzco = cur.fetchall()
        cur.execute("SELECT value FROM system where name = 'To' ")
        to = cur.fetchall()

        e = to - 55 - tzco  # uchyb regulacji: różnica pomiędzy zadaną temperaturą wody wypływającej z wymiennika (to-55), a aktualną wartością
        p.setPoint(to-55.0)
        um = p.update(e)
        if um > 60:  # saturacja
            um = 60
        if um < 20:
            um = 20

        update_um = "UPDATE system SET value = %s WHERE name = 'Um'"
        cur.execute(update_um, um)
    con.commit()
    con.close()
