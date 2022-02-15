%主函数，记录实验数据。通过柱状图比较 理论跳数分布和仿真跳数分布的拟合程度。
%R表示网络半径，r表示节点传输半径，N表示网络节点总个数，
%节点密度是pho=N/(pi*R^2)，loop表示仿真场景模拟次数，v0表示源节点SN与网络中心之间的距离，当v0=0时表示SN位于网络中心。
clear;clc;
P=0.9999; R=10;N=300 ;r=2.7468;  v0=0;delta=0.0001; 
%根据给定参数计算跳数分布理论结果 
[hop_distri_theory_v0_0,~,~,~,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
%根据给定参数计算跳数分布仿真结果  
loop=2000 ; 
hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
%绘制柱状图表示跳数分布理论结果以及仿真结果
hopsdistri={hop_distri_theory_v0_0,hops_distri_simu_v0_0};

figure();
distri_array=plot_02_bar(hopsdistri);
[KL,KL_array,distri_error]=theory_06_KL(hop_distri_theory_v0_0,hops_distri_simu_v0_0) ;

title(['KL=',num2str(KL),';   r=',num2str(r ) ]);
ylim([0,max([hop_distri_theory_v0_0,hops_distri_simu_v0_0])+0.05]);

