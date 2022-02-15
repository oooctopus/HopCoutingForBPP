%当SN不在圆心，给定v0，求跳数分布,记录实验数据
clear;clc;
 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0 
clear;clc;
P=0.9999; R=10.000000;N=300 ;loop=100; v0=0.9*R;delta=0.0002;
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r=1.2 *r_min;


%跳数分布理论计算结果 
hops_distri_theory_v0= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) ;
 
%仿真计算跳数分布
hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);

error_array_1 =theory_05_RMSE(hops_distri_theory_v0,hops_distri_simu_v0_0);

% %条形图绘制
hops_distri={hops_distri_theory_v0,hops_distri_simu_v0_0};

RMSE=theory_05_RMSE(hops_distri_theory_v0,hops_distri_simu_v0_0);
plot_02_bar(hops_distri);
