 
 
%保证网络全连通（连通概率为P），源节点位于网络中心，通过网络半径R pho，记录R对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=400;  delta=0.02; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
N_array=N:6:N+300;
pho_array=N_array/(pi*R^2);
r_array=r_min.* (1:0.02:3);
 
 
HCD_theory_N_r=cell(length(N_array),length(r_array)); 
HCD_simu_N_r=cell(length(N_array),length(r_array)); 
KL_array_N_r=zeros(length(N_array),length(r_array));
KL_array_cell_N_r=cell(length(N_array),length(r_array));
distri_error_cell_N_r=cell(length(N_array),length(r_array));
 

for i=1:length(N_array)
    N=N_array(i);  
    for j=1:length(r_array)   
        r=r_array(j);
        %跳数分布理论计算结果
        hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta  ) ;
        %仿真计算跳数分布
        hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );
        HCD_theory_N_r{i,j}=hops_distri_theory_mean;
        HCD_simu_N_r{i,j}=hops_distri_simu_mean;   
        
        [KL,KL_array,distri_error]=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean) ;     
        KL_array_N_r(i,j)=KL;
        KL_array_cell_N_r{i,j}=KL_array;
        distri_error_cell_N_r{i,j}=distri_error;
    end
end

 
file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_pho_r' ,'.mat'];
save(filePath);
 