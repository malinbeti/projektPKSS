clear all
close all
conn = database('pkss','pkss','pkss125',...
                'Vendor','MySQL',...
                'Server','12.12.12.55');

curs =exec(conn,'select * from system');
curs = fetch(curs);
dane_z_bazy = curs.Data;

exec(conn,'UPDATE system SET value = 10 WHERE name = "test"');

curs =exec(conn,'select * from system');
curs = fetch(curs);
dane_z_bazy2 = curs.Data;

dane_z_bazy(1,2)
dane_z_bazy2(1,2)

close(curs);
close(conn);