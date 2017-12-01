% uruchomienie panelu sterowania
panel   = panel_sterowania;

% pobranie warto�ci z panelu sterowania;
To      = panel.TempOtocz.Value;
Tr1     = panel.TempB1.Value;
Tr2     = panel.TempB2.Value;
Start   = panel.Start.Value;
Stop    = panel.Stop.Value;

% wyswietlanie danych z symulacji
T = tout;
labelT = 'Czas []';

f = figure('Name','Panel kontrolny','NumberTitle','off');
set(f, 'ToolBar', 'none');
set(f, 'MenuBar', 'none');
hTabGroup = uitabgroup(f); 
tab1 = uitab(hTabGroup, 'title','Elektrociep�ownia');

a1 = axes('parent', tab1); 
yyaxis left
plot(T,Tzm);
xlim([0 T(end)]);
ylim([65 140]);
ylabel('Temperatura [�C]');
xlabel(labelT);

yyaxis right
plot(T,Fzm);
xlim([0 T(end)]);
ylim([-5 80]);
ylabel('Strumie� wody [t/h]');
xlabel(labelT);
title('Parametry pochodz�ce z elektrociep�owni');
legend('Temperatura wody zasilaj�cej z elektrociep�owni',...
       'Strumie� wody wyp�ywaj�cej z elektrociep�owni');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tab2 = uitab(hTabGroup, 'title','Wymiennik ciep�a');
a2 = axes('parent', tab2); 
%%%
subplot(2,1,1);
plot(T,Fcob1);
hold on
plot(T,Fcob2);
xlim([0 T(end)])
ylim([-5 40])
ylabel('Strumie� wody [t/h]');
xlabel(labelT);
legend('Strumie� wody wp�ywaj�cy do budynku 1',...
       'Strumie� wody wp�ywaj�cy do budynku 2');
title('Strumienie wody wp�ywaj�ce do budynk�w');
grid on
%%%
subplot(2,1,2);
title('Temperatura wody kr���cej w lokalej sieci CO');
yyaxis left
plot(T,Tpco1);
hold on
plot(T,Tpco2);
xlim([0 T(end)])
ylim([0 135])
ylabel('Temperatura [�C]');
xlabel(labelT);

yyaxis right
plot(T,Tzco);
xlim([0 T(end)])
ylim([0 135])
ylabel('Temperatura [�C]');
xlabel(labelT);
legend('Temperatura wody wyp�ywaj�cej z budynku 1',...
       'Temperatura wody wyp�ywaj�cej z budynku 2',...
       'Temperatura wody wp�ywaj�cej do budynk�w');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tab3 = uitab(hTabGroup, 'title','Charakterystyka budynk�w');
a3 = axes('parent', tab3); 
%%%
subplot(2,2,1);
plot(T,Tr1);
hold on
plot(T,Tr2);
xlim([0 T(end)])
ylim([0 30])
ylabel('Temperatura [�C]');
xlabel(labelT);
title('Temperatura w budynkach');
legend('U�redniona temperatura pomieszcze� w budynku 1',...
       'U�redniona temperatura pomieszcze� w budynku 2');
grid on
%%%
subplot(2,2,2);
plot(T,Ub1);
xlim([0 T(end)])
ylim([20 60])
ylabel('Napi�cie [V]');
xlabel(labelT);
title('Sygna� steruj�cy zaworem w budynku 1');
legend('Sygna� steruj�cy generowany przez regulator zaworu budynku 1');
grid on
%%%
subplot(2,2,3);

plot(T,Ub2);
xlim([0 T(end)])
ylim([20 60])
ylabel('Napi�cie [V]');
xlabel(labelT);
title('Sygna� steruj�cy zaworem w budynku 2');
legend('Sygna� steruj�cy generowany przez regulator zaworu budynku 2');
grid on
%%%
subplot(2,2,4);
plot(T,Um);
xlim([0 T(end)])
ylim([20 60])
ylabel('Napi�cie [V]');
xlabel(labelT);
title('Sygna� steruj�cy zaworem w wymienniku ciep�a');
legend('Sygna� steruj�cy generowany przez regulator zaworu wymiennika ciep�a');
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




