
%保证网络全连通（连通概率为P），源节点位于网络中心，改变N，记录N对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=100; v0=0;delta=0.0001; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r =r_min;
N_array=N:10:N+300;

 
HCD_theory_N=cell(1,length(N_array)); 
HCD_simu_N=cell(1,length(N_array));
KL_array_cell_N=cell(1,length(N_array));
distri_error_cell_N=cell(1,length(N_array));
KL_array_N=zeros(1,length(N_array));

for i=1:length(N_array)
    N=N_array(i);  
    %跳数分布理论计算结果 
    [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
    %仿真计算跳数分布
    hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
    HCD_theory_N{i}=hop_distri_theory_v0_0;
    HCD_simu_N{i}=hops_distri_simu_v0_0;   
    
    [KL,KL_array,distri_error]=theory_06_KL(hop_distri_theory_v0_0,hops_distri_simu_v0_0) ;
    KL_array_N(i)=KL;
    KL_array_cell_N{1,i}=KL_array;
    distri_error_cell_N{1,i}=distri_error;
end

file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_N' ,'.mat'];
save(filePath);
 
 