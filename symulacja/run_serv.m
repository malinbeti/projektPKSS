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

%% set connection with database
% download initial parameters from server
To = 5;         %outside temp
time = 1000;    %simulation time??
       

while 1
%   download temporary data from previous cycle from server
%     Um = 60;
%     Ub1 = 60;
%     Ub2 = 60;
%     Tpco1_in = ;
%     Tr1_in = ;
%     Tpco2_in = ;
%     Tr2_in = ;
%     Tzco_in = ;
%     Tpm_in = ;
       
    sim('symulacja2012_serv',time)
    
    pause(3);
    
    
    = Tpco1(end);
    = Tr1(end);
    = Fcob1(end);
    = Tpco2(end);
    = Tr2(end);
    = Fcob2(end);
    = Tzco(end);
    = Fzm(end);
    = Tzm(end);
   
end