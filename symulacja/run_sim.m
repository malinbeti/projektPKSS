clear all
close all

%%% initializing data
time = 20000; %?? czas jednego cyklu symulacji??

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

% %% download initial parameters from server
To = -30;

% while 1         %ci¹g³a pêtla oczekuj¹ca na warunek 

        
%%   download temporary data from previous cycle from server
% 
%     Um = 60;
%     Ub1 = 60;
%     Ub2 = 60;
    

    Tpco1_in = 5;
    Tr1_in = 5;
    Tpco2_in = 5;
    Tr2_in = 5;
    Tzco_in = 5;
    Tpm_in = 5;
       
    Set_Tzco = 55 - 1.75*To;
    
    sim('symulacja_indep',time)
    
    figure(1)
    plot(Tr1)
    figure(2)
    plot(Fcob1)
    figure(3)
    plot(Tzco)
    figure(4)
    plot(Fzm)
    

%%   upload results from this cycle on server
% end
    