clear;clc;
load  data_record\02_16_17_09_variable_N.mat 
figure('Color','white');


 
%%
%------------------------------------------------子图1----------------------------------------------%
N=600;  pho=N/(pi*R^2) ;pho =1.9099;
subplot(3,1,1)
%跳数分布理论计算结果 
hop_distri_theory_N_10=HCD_theory_N{31}; 
%仿真计算跳数分布
hops_distri_simu_N_10=HCD_simu_N{31};
%计算KL 
KL3=theory_06_KL(hop_distri_theory_N_10,hops_distri_simu_N_10); 

%条形图绘制
hopsdistri={hop_distri_theory_N_10,hops_distri_simu_N_10};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
 
% xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h)','FontSize',12);
box on
xlim([0,13]);
ylim([0,0.2]);
set(gca,'xtick',1:1:13)
title('(a) N=600, \rho=1.9099','FontSize',10)
l=legend([b(1),b(2)] ,'Theoretical hop count distribution','Simulational hop count distribution ' ,'Location','East'  ) 
set(l,'FontSize',8,'Position',[0.58 0.82 0.31 0.0726]) 
% legend('boxoff')

%%
%------------------------------------------子图2------------------------------------%
N=450;  pho=N/(pi*R^2) ;pho =1.4324;
subplot(3,1,2)
%跳数分布理论计算结果 
hop_distri_theory_N_5=HCD_theory_N{16}; 
%仿真计算跳数分布
hops_distri_simu_N_5=HCD_simu_N{16};
%计算KL 
KL2=theory_06_KL(hop_distri_theory_N_5,hops_distri_simu_N_5);  

%条形图绘制
hopsdistri={hop_distri_theory_N_5,hops_distri_simu_N_5};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
 
% xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h)','FontSize',12);
box on
xlim([0,13]);
ylim([0,0.2]);
set(gca,'xtick',1:1:13)
 
title('(b) N=450, \rho=1.4324','FontSize',10)

% set(gca,'position',[0.06 0.60 0.31 0.32])
 

%%
%---------------------------------------------r=2.2297------------------------------------------------%
N=300;  pho=N/(pi*R^2) ; pho =0.9549;
subplot(3,1,3)
%跳数分布理论计算结果 
hop_distri_theory_N_0=HCD_theory_N{1}; 
%仿真计算跳数分布
hops_distri_simu_N_0=HCD_simu_N{1};
%计算KL 
KL1=theory_06_KL(hop_distri_theory_N_0,hops_distri_simu_N_0);  

%条形图绘制
hopsdistri={hop_distri_theory_N_0,hops_distri_simu_N_0};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];

xlabel('h (hop count)','FontSize',12);
ylabel('Pr(H=h)','FontSize',12);
box on
xlim([0,13]);
ylim([0,0.2]);
set(gca,'xtick',1:1:13)
title('(c) N=300, \rho=0.9549','FontSize',10)

% set(gca,'position',[0.06 0.60 0.31 0.32])


set(gcf,'unit','centimeters','position',[10 5 18 12]);

 
  


 

 

 
  
 