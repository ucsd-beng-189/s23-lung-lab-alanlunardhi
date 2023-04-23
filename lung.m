%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
for beta = 0:0.25:1
    cImat = []
    PAbarmat = []
    Pabarmat = []
    Pvmat = []
    cAbarmat = []
    cabarmat = []
    cvmat = []
    for cI = (0.15:0.01:0.2)/(22.4*(310/273)) 
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
    
    altitudes = linspace(0,8000,length(cImat));
    
    figure
    plot(altitudes,PAbarmat(end:-1:1),'g.', 'Markersize',24)
    hold on
    plot(altitudes,Pabarmat(end:-1:1),'b.', 'Markersize',24)
    plot(altitudes,Pvmat(end:-1:1),'k.', 'Markersize',24)
    xlabel('Altitudes (feet)')
    ylabel('Partial Pressure')
    title(sprintf('Various Partial Pressures vs Altitude at beta = %d',beta))
    legend('PAbar - mean alveolar partial pressure of oxygen', 'Pabar - mean arterial partial pressure of oxygen', 'Pv - venous partial pressure of oxygen')
    
    figure
    plot(altitudes,cAbarmat(end:-1:1),'g.', 'Markersize',24)
    hold on
    plot(altitudes,cabarmat(end:-1:1),'b.', 'Markersize',24)
    plot(altitudes,cvmat(end:-1:1),'k.', 'Markersize',24)
    xlabel('Altitude (feet)')
    ylabel('Oxygen Concentration')
    title(sprintf('Various oxygen concentrations vs Altitude at beta = %d',beta))
    legend('cAbar - mean alveolar concentration of oxygen', 'cabar - mean arterial concentration of oxygen', 'cv - venous concentration of oxygen')
end
