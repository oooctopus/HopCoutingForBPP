%当SN不在圆心，在网络中随机均匀分布，求跳数分布,记录实验数据
clear;clc;


% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN随机分布
clear;clc;
P=0.9999; R=10.000000;N=300 ;loop=200 ;delta=0.02;
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r=1.2 *r_min;

%跳数分布理论计算结果 
hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta ) ;
 
%仿真计算跳数分布
% hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop );
hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );

%条形图绘制
hops_distri={hops_distri_theory_mean,hops_distri_simu_mean};

distri_array=plot_02_bar(hops_distri);

KL=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean)