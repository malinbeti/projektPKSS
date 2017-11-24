clear all
close all

%% initializing data

mm = 3000;
mco = 3000;
cwym = 2700;
dz = 1000;
cw = 4200;
kw = 250000;
cco = 3000;

mh = 3000;
ch = 2700;
kh = 12000;

mb = 20000;
cb = 1000;
kext = 15000;

%% download initial parameters from server
To = ???;
time = 1000; %?? czas jednego cyklu symulacji??
       





%%   download temporary data from previous cycle from server

while 1


%     Um = 60;
%     Ub1 = 60;
%     Ub2 = 60;
    
%     Tpco1_in = ;
%     Tr1_in = ;
%     Tpco2_in = ;
%     Tr2_in = ;
%     Tzco_in = ;
%     Tpm_in = ;
   
    
       
    
    sim('symulacja2012',time)
    
    
    = Tpco1(end);
    = Tr1(end);
    = Fcob1(end);
    = Tpco2(end);
    = Tr2(end);
    = Fcob2(end);
    = Tzco(end);
    = Fzm(end);
    = Tzm(end);
   
    
    

%%   upload results from this cycle on server
end
    