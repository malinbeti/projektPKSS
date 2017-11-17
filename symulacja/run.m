clear all
close all

%%% initializing data
time = 5000; %?? czas jednego cyklu symulacji??

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

%%% download initial parameters from server
To = 5;

% while 1         %ci�g�a p�tla oczekuj�ca na warunek 
%     if flaga == 1 & flaga_prev == 0         %synchranizacja z serwerem
        
%   download temporary data from previous cycle from server

    Um = 60;
    Ub1 = 60;
    Ub2 = 60;
    
    Tpco1_in = 5;
    Tr1_in = 5;
    Tpco2_in = 5;
    Tr2_in = 5;
    
    Tzco_in = 5;
    Tpm_in = 5;
    
    
    
    sim('symulacja2012',time)

%   upload results from this cycle on server

%     end
% end
    