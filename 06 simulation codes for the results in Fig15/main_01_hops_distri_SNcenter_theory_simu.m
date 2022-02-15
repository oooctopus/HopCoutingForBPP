%主函数，记录实验数据

%%---------------------------------仿真1 柱状图比较 理论-仿真 跳数分布------------%%
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
% clear;clc;
P=0.9999; R=10.000000;N=350 ;loop=1; v0=0;delta=0.0002;
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r=1.1 *r_min;
 
r=2.4526;
% r=2.5864;
% r=2.4974;

%跳数分布理论计算结果 
 [hop_distri_theory_v0_0,A_array,n_array,ri_array,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
 
% %仿真计算跳数分布
   hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
% 
% %条形图绘制
  hopsdistri={hop_distri_theory_v0_0,hops_distri_simu_v0_0};
% 
  distri_array=plot_02_bar(hopsdistri);
  
  KL=theory_06_KL(hop_distri_theory_v0_0,hops_distri_simu_v0_0)
