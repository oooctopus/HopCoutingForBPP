clear;clc;
load  data_record\02_17_16_06_variable_r.mat 
figure('Color','white');
 
%%
%------------------------------------------------子图1----------------------------------------------%
subplot(3,1,1)
%跳数分布理论计算结果 
hop_distri_theory_r_10=HCD_theory_r{21}; 
%仿真计算跳数分布
hops_distri_simu_r_10=HCD_simu_r{21};
%计算KL 
KL3=theory_06_KL(hop_distri_theory_r_10,hops_distri_simu_r_10); 

%条形图绘制
hopsdistri={hop_distri_theory_r_10,hops_distri_simu_r_10};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
 
% xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h)','FontSize',12);
box on
xlim([0,13]);
ylim([0,0.4]);
set(gca,'xtick',1:1:13)
title('(a) r=4.4593','FontSize',11)
l=legend([b(1),b(2)] ,'Theoretical hop count distribution','Simulational hop count distribution ' ,'Location','East'  ) 
set(l,'FontSize',10,'Position',[0.52 0.79 0.3536 0.0726]) 

%%
%------------------------------------------子图2------------------------------------%
subplot(3,1,2)
%跳数分布理论计算结果 
hop_distri_theory_r_5=HCD_theory_r{11}; 
%仿真计算跳数分布
hops_distri_simu_r_5=HCD_simu_r{11};
%计算KL 
KL2=theory_06_KL(hop_distri_theory_r_5,hops_distri_simu_r_5);  

%条形图绘制
hopsdistri={hop_distri_theory_r_5,hops_distri_simu_r_5};
b=plot_02_bar(hopsdistri);

b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
 
% xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h)','FontSize',12);
box on
xlim([0,13]);
ylim([0,0.3]);
set(gca,'xtick',1:1:13)
 
title('(b) r=3.2330','FontSize',11)

% set(gca,'position',[0.06 0.60 0.31 0.32])
 

%%
%---------------------------------------------r=2.2297------------------------------------------------%
subplot(3,1,3)
%跳数分布理论计算结果 
hop_distri_theory_r_0=HCD_theory_r{1}; 
%仿真计算跳数分布
hops_distri_simu_r_0=HCD_simu_r{1};
%计算KL 
KL1=theory_06_KL(hop_distri_theory_r_0,hops_distri_simu_r_0);  

%条形图绘制
hopsdistri={hop_distri_theory_r_0,hops_distri_simu_r_0};
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
title('(c) r=2.2297','FontSize',11)

% set(gca,'position',[0.06 0.60 0.31 0.32])


set(gcf,'unit','centimeters','position',[10 5 18 12]);

 
  


 

 

 
  
 