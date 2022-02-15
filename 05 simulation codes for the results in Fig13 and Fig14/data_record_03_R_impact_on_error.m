 
%---------------------------------------------仿真3--------------------------------------------------------%
%保证网络全连通（连通概率为P），源节点位于网络中心，通过网络半径R pho，记录R对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=400;  delta=0.02; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r =r_min;
R_array=R.* (1:-0.025:0.5);
 
 HCD_theory_R=cell(1,length(R_array)); 
 HCD_simu_R=cell(1,length(R_array));
error_array_R=zeros(1,length(R_array));
KL_array_R=zeros(1,length(R_array));
JS_array_R=zeros(1,length(R_array));
Dis_array_R=zeros(1,length(R_array));

for i=1:length(R_array)
    %i=i
    R=R_array(i);  
    %跳数分布理论计算结果 
    hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta*0.1 ) ;
    %仿真计算跳数分布
    hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );
    
    HCD_theory_R{i}=hops_distri_theory_mean;
    HCD_simu_R{i}=hops_distri_simu_mean;   
    error_array_R(i)=theory_05_RMSE(hops_distri_theory_mean,hops_distri_simu_mean);
    KL_array_R(i)=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean);
    JS_array_R(i)=theory_07_JS(hops_distri_theory_mean,hops_distri_simu_mean);
    Dis_array_R(i)=theory_08_Dis(hops_distri_theory_mean,hops_distri_simu_mean);
end

file_folder='datat_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_R' ,'.mat'];
save(filePath);
 