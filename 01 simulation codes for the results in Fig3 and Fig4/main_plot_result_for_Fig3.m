clear;clc;
load data_record\02_29_12_20-n1-30.mat

figure('Color','white');
hold on

%分别画n1=10 n1=20,n1=30时的三条理论值曲线
hs1=plot(r_array,A2_array_simu_1,'ro:','MarkerSize',3,'MarkerEdgeColor','r','LineWidth',2,'MarkerFaceColor','r');
hs2=plot(r_array,A2_array_simu_2,'ro:','MarkerSize',3,'MarkerEdgeColor','r','LineWidth',2,'MarkerFaceColor','r');
hs3=plot(r_array,A2_array_simu_3,'ro:','MarkerSize',3,'MarkerEdgeColor','r','LineWidth',2,'MarkerFaceColor','r');
% hs1=plot(SF_data,x5,'r :' ,'LineWidth',2);
% hs2=plot(SF_data,x15,'r :', 'LineWidth',2);
% hs3=plot(SF_data,x25,'r :', 'LineWidth',2);
 
%分别画n1=10 n1=20,n1=30时的三条仿真曲线 
h1=plot(r_array,A2_array_theory_1,' k-','LineWidth',1 );
h2=plot(r_array,A2_array_theory_2,' k-','LineWidth',1 );
h3=plot(r_array,A2_array_theory_3,' k-','LineWidth',1 );

le=legend([hs1,h1] ,'Simulation result','theoretical results ' ,'Location',[0.20 -0.25 1 1]);
set(le,'FontSize',14)
rectangle('Position',[2.45 42 0.05 7],'Curvature',[0.7,1],'LineWidth',1.5)
text(2.48,56,'n_1=30','FontSize',14);
 
rectangle('Position',[2.5 33 0.05 7],'Curvature',[0.7,1],'LineWidth',1.5)
text(2.53,44,'n_1=10','FontSize',14);
 
rectangle('Position',[2.55 25 0.05 7],'Curvature',[0.7,1],'LineWidth',1.5)
text(2.62,34,'n_1=5','FontSize',14);

 xlabel('r','FontSize',14);
 ylabel('E(|| A_2 ||)','FontSize',14);
 box on
 ylim([0,70]);
 xlim([1,3.05]);
 set(gca,'FontSize',14);
 set(gcf,'unit','centimeters','position',[10 5 15 10]);
 
