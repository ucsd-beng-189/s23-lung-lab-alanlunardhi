%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
%must comment cI out of setup_lung.m and uncomment beta value for this script to work
cImat = []
PAbarmat = []
Pabarmat = []
Pvmat = []
cAbarmat = []
cabarmat = []
cvmat = []
for cI = (0.1:0.01:0.2)/(22.4*(310/273)) 
    setup_lung
    cvsolve
    outchecklung
    cImat = [cImat cI]
    PAbarmat = [PAbarmat PAbar]
    Pabarmat = [Pabarmat Pabar]
    Pvmat = [Pvmat Pv]
    cAbarmat = [cAbarmat cAbar]
    cabarmat = [cabarmat cabar]
    cvmat = [cvmat cv]
end

figure(100)
plot(cImat,PAbarmat,'g.', 'Markersize',24)
hold on
plot(cImat,Pabarmat,'b.', 'Markersize',24)
plot(cImat,Pvmat,'k.', 'Markersize',24)
xlabel('cI')
ylabel('Partial Pressure')
title('Various Partial Pressures vs cI')
legend('PAbar - mean alveolar partial pressure of oxygen', 'Pabar - mean arterial partial pressure of oxygen', 'Pv - venous partial pressure of oxygen')

figure(200)
plot(cImat,cAbarmat,'g.', 'Markersize',24)
hold on
plot(cImat,cabarmat,'b.', 'Markersize',24)
plot(cImat,cv,'k.', 'Markersize',24)
xlabel('cI')
ylabel('Oxygen Concentration')
title('Various oxygen concentrations vs cI')
legend('cAbar - mean alveolar concentration of oxygen', 'cabar - mean arterial concentration of oxygen', 'cv - venous concentration of oxygen')
