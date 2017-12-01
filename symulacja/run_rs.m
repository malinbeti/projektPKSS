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
Tzm = 70 - 2.5*(To - 6);

% while 1         %ci¹g³a pêtla oczekuj¹ca na warunek 
%     if flaga == 1 & flaga_prev == 0         %synchranizacja z serwerem
        
%   download temporary data from previous cycle from server

    Fcob1 = 60/3600;
    Fcob2 = 60/3600;
    Fzm = 60/3600;
    Fzco = Fcob1 + Fcob2;
    

    Tpco1_in = 5;
    Tr1_in = 5;
    Tpco2_in = 5;
    Tr2_in = 5;
    
    Tzco_in = 5;
    Tpm_in = 5;
   

    A = [-(Fzm*dz*cw+kw)/(mm*cwym) kw/(mm*cwym) 0 0 0 0 0 (Fzm*dz*cw)/(mm*cwym)
        kw/(mco*cwym) -(kw+Fzco*dz*cw)/(mco*cwym) (Fcob1*Fzco*dz*cw)/((Fcob1+Fcob2)*mco*cwym) 0 (Fcob2*Fzco*dz*cw)/((Fcob1+Fcob2)*mco*cwym) 0 0 0
        0 (Fcob1*dz*cw)/(mh*ch) -(Fcob1*dz*cw+kh)/(mh*ch) kh/(mh*ch) 0 0 0 0
        0 0 kh/(mb*cb) -(kh+kext)/(mb*cb) 0 0 kext/(mb*cb) 0
        0 (Fcob2*dz*cw)/(mh*ch)  0 0 -(Fcob2*dz*cw+kh)/(mh*ch) kh/(mh*ch) 0 0
        0 0  0 0 kh/(mb*cb) -(kh+kext)/(mb*cb) kext/(mb*cb) 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0];
        
    B = [0 0 0 0 0 0 0 0]';
    
    C = [1 0 0 0 0 0 0 0
        0 1 0 0 0 0 0 0
        0 0 1 0 0 0 0 0
        0 0 0 1 0 0 0 0
        0 0 0 0 1 0 0 0
        0 0 0 0 0 1 0 0];
    
    D = [0 0 0 0 0 0]';
    
    init = [Tpm_in Tzco_in Tpco1_in Tr1_in Tpco2_in Tr2_in To Tzm];
    
%     sim('symulacja_rs_2012',time)

%   upload results from this cycle on server
%     end
% end
    