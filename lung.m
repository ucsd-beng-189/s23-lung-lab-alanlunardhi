%filename: lung.m (main program)
clear all
clf
cref=0.2/(22.4*(310/273))

global Pstar cstar n maxcount M Q camax RT cI;
for beta = 0:0.25:1
    cstarmat = []
    cImat = []
    PImat = []
    PAbarmat = []
    Pabarmat = []
    Pvmat = []
    cAbarmat = []
    cabarmat = []
    cvmat = []
    for cstar = cref*(1:-0.1:0.5)
        setup_lung
        cvsolve
        outchecklung
        cstarmat = [cstarmat cstar]
        cImat = [cImat cI]
        PImat = [PImat PI]
        PAbarmat = [PAbarmat PAbar]
        Pabarmat = [Pabarmat Pabar]
        Pvmat = [Pvmat Pv]
        cAbarmat = [cAbarmat cAbar]
        cabarmat = [cabarmat cabar]
        cvmat = [cvmat cv]
    end

    figure
    plot(cstarmat,PImat,'r.','MarkerSize',24)
    hold on
    plot(cstarmat,PAbarmat,'g.', 'Markersize',24)
    plot(cstarmat,Pabarmat,'b.', 'Markersize',24)
    plot(cstarmat,Pvmat,'k.', 'Markersize',24)
    xlabel('cstar')
    ylabel('Partial Pressure')
    title(sprintf('Various Partial Pressures vs cstar at beta = %d',beta))
    legend('PI - oxygen partial pressure in inhaled air', 'PAbar - mean alveolar partial pressure of oxygen', 'Pabar - mean arterial partial pressure of oxygen', 'Pv - venous partial pressure of oxygen')
    
    figure
    plot(cstarmat,cImat,'r.','MarkerSize',24)
    hold on
    plot(cstarmat,cAbarmat,'g.', 'Markersize',24)
    plot(cstarmat,cabarmat,'b.', 'Markersize',24)
    plot(cstarmat,cvmat,'k.', 'Markersize',24)
    xlabel('cstar')
    ylabel('Oxygen Concentration')
    title(sprintf('Various oxygen concentrations vs cstar at beta = %d',beta))
    legend('cI - inspired air concentration of oxygen','cAbar - mean alveolar concentration of oxygen', 'cabar - mean arterial concentration of oxygen', 'cv - venous concentration of oxygen')
end
