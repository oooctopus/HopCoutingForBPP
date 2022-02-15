 
%保证网络全连通（连通概率为P），源节点与网络中心间距是v0，改变v0，记录v0对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=2000 ; v0=0;delta=0.0002; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r=r_min;
v0_array= (0 :0.02:1)*R;
% r_array=1.34 *r_min;
 
 HCD_theory_v0=cell(1,length(v0_array)); 
 HCD_simu_v0=cell(1,length(v0_array));
error_array_v0=zeros(1,length(v0_array));
KL_array_v0=zeros(1,length(v0_array));
JS_array_v0=zeros(1,length(v0_array));
Dis_array_v0=zeros(1,length(v0_array));

for i=1:length(v0_array)
    %i=i
    v0=v0_array(i);  
    %跳数分布理论计算结果    
    hops_distri_theory_v0= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) ;
    %仿真计算跳数分布
    hops_distri_simu_v0=simu_04_hops_distri_mean(R,N,r,loop,v0);
    HCD_theory_v0{i}=hops_distri_theory_v0;
    HCD_simu_v0{i}=hops_distri_simu_v0;   
    error_array_v0(i)=theory_05_RMSE(hops_distri_theory_v0,hops_distri_simu_v0);
    KL_array_v0(i)=theory_06_KL(hops_distri_theory_v0,hops_distri_simu_v0);
    JS_array_v0(i)=theory_07_JS(hops_distri_theory_v0,hops_distri_simu_v0);
    Dis_array_v0(i)=theory_08_Dis(hops_distri_theory_v0,hops_distri_simu_v0);
end

file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_v0' ,'.mat'];
save(filePath);
 