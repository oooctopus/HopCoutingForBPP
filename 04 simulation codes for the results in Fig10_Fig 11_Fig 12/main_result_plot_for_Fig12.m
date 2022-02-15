clear;clc;
load  data_record\02_13_22_49_variable_v0.mat 
figure('Color','white');
 
%%
%---------------------------------------------v=0------------------------------------------------%
subplot(3,1,1)
%跳数分布理论计算结果 
hop_distri_theory_v0_0=HCD_theory_v0{1}; 
%仿真计算跳数分布
hops_distri_simu_v0_0=HCD_simu_v0{1};
%计算KL 
KL1=theory_06_KL(hop_distri_theory_v0_0,hops_distri_simu_v0_0);  

%条形图绘制
hopsdistri={hop_distri_theory_v0_0,hops_distri_simu_v0_0};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];

l=legend([b(1),b(2)] ,'Theoretical hop count distribution','Simulational hop count distribution ' ,'Location','East'  ) 
set(l,'FontSize',10,'Position',[0.5327 0.82 0.3536 0.0726])


% xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h|v=0)','FontSize',12);
box on
xlim([0,13]);
% ylim([0,0.5]);
title('(a) v=0','FontSize',10)

% set(gca,'position',[0.06 0.60 0.31 0.32])

%%
%------------------------------------------子图2------------------------------------%
subplot(3,1,2)
%跳数分布理论计算结果 
hop_distri_theory_v0_5=HCD_theory_v0{26}; 
%仿真计算跳数分布
hops_distri_simu_v0_5=HCD_simu_v0{26};
%计算KL 
KL2=theory_06_KL(hop_distri_theory_v0_5,hops_distri_simu_v0_5);  

%条形图绘制
hopsdistri={hop_distri_theory_v0_5,hops_distri_simu_v0_5};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
 
% xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h|v=5)','FontSize',12);
box on
xlim([0,13]);
ylim([0,0.2]);
title('(b) v=5','FontSize',10)

% set(gca,'position',[0.06 0.60 0.31 0.32])
%%
%------------------------------------------------子图3----------------------------------------------%
subplot(3,1,3)
%跳数分布理论计算结果 
hop_distri_theory_v0_10=HCD_theory_v0{51}; 
%仿真计算跳数分布
hops_distri_simu_v0_10=HCD_simu_v0{51};
%计算KL 
KL3=theory_06_KL(hop_distri_theory_v0_10,hops_distri_simu_v0_10); 

%条形图绘制
hopsdistri={hop_distri_theory_v0_10,hops_distri_simu_v0_10};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
 
xlabel('h (hop count)','FontSize',12);
ylabel('Pr(H=h|v=10)','FontSize',12);
title('(c) v=10','FontSize',10)
box on
xlim([0,13]);
 
 
set(gcf,'unit','centimeters','position',[10 5 18 12]);

 
  


 

 

 
  
 