%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
cImat = []
PAbarmat = []
Pabarmat = []
Pvmat = []
cAbarmat = []
cabarmat = []
cvmat = []
cref=0.2/(22.4*(310/273))
cstar = 0.5*cref
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

altitudes = linspace(0,19000,length(cImat));

figure(300)
plot(altitudes,PAbarmat(end:-1:1),'g.', 'Markersize',24)
hold on
plot(altitudes,Pabarmat(end:-1:1),'b.', 'Markersize',24)
plot(altitudes,Pvmat(end:-1:1),'k.', 'Markersize',24)
xlabel('Altitudes (feet)')
ylabel('Partial Pressure')
title('Various Partial Pressures vs Altitude for an Anemic with cstar = 0.5*cref')
legend('PAbar - mean alveolar partial pressure of oxygen', 'Pabar - mean arterial partial pressure of oxygen', 'Pv - venous partial pressure of oxygen')

figure(400)
plot(altitudes,cAbarmat(end:-1:1),'g.', 'Markersize',24)
hold on
plot(altitudes,cabarmat(end:-1:1),'b.', 'Markersize',24)
plot(altitudes,cvmat(end:-1:1),'k.', 'Markersize',24)
xlabel('Altitude (feet)')
ylabel('Oxygen Concentration')
title('Various oxygen concentrations vs Altitude for an Anemic with cstar = 0.5*cref')
legend('cAbar - mean alveolar concentration of oxygen', 'cabar - mean arterial concentration of oxygen', 'cv - venous concentration of oxygen')
