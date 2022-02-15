%当SN不在圆心，在网络中随机均匀分布，求跳数分布,记录实验数据
clear;clc;
 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
R=10;r=3;N=200 ;loop=10 ;delta=0.01;

%跳数分布理论计算结果 
hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta ) ;
 
%仿真计算跳数分布
hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );

%条形图绘制
hops_distri={hops_distri_theory_mean,hops_distri_simu_mean};

distri_array=plot_02_bar(hops_distri);