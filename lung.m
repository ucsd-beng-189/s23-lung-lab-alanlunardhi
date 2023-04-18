%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
for beta = 0:0.1:1
    setup_lung
    cvsolve
    outchecklung
    figure(100)
    plot(beta,PI,'r.')
    hold on
    plot(beta,PAbar,'g.')
    plot(beta,Pabar,'b.')
    plot(beta,Pv,'k.')
end
legend('PI', 'PAbar', 'Pabar', 'Pv')