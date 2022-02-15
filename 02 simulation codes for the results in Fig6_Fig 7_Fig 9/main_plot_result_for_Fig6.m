%绘制文章Hop Count Distribution for Minimum Hop-Count Routing in Finite Ad Hoc Networks中的 Fig.6
clear;clc;
figure('Color','white');

%导入仿真结果 
load  data_record\02_11_00_46_variable_r.mat

%跳数分布理论计算结果 
 hop_distri_theory_v0_0=HCD_theory_r{13};
 
%仿真计算跳数分布
 hops_distri_simu_v0_0=HCD_simu_r{13};

%条形图绘制
hopsdistri={hop_distri_theory_v0_0,hops_distri_simu_v0_0};
b=plot_02_bar(hopsdistri);
b(1).CData=[0.73 0.83 0.96];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.49 0.49 0.49];
b(2).EdgeColor=[0.93 0.84 0.84];
legend([b(1),b(2)] ,'Theoretical hop count distribution','Simulational hop count distribution ' ,  'Location','northeast' );
xlabel('h(hop count)','FontSize',12);
ylabel('Pr(H=h|v=0)','FontSize',12);
box on
xlim([0,6]);
ylim([0,0.5]);
set(gcf,'unit','centimeters','position',[10 5 15 10]);

 
  
