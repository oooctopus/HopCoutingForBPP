 
%保证网络全连通（连通概率为P），源节点与网络中心间距是v0，改变v0,R，记录v0,R对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=2000  ; v0=0;delta=0.0002; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r=r_min;
 
R_array=R.* (1:-0.01:0.5);
v0_array=zeros(1,length(R_array)); 
 
 HCD_theory_v_R=cell(length(v0_array),length(R_array)); 
 HCD_simu_v_R=cell(length(v0_array),length(R_array));
 KL_array_v_R=zeros(length(v0_array),length(R_array));
 KL_array_cell_v_R=cell(length(v0_array),length(R_array));
 distri_error_cell_v_R=cell(length(v0_array),length(R_array));
 
 

for i=1:length(R_array)
    R=R_array(i);
    v0_array=R.*(0:0.02:1);
    for j=1 :length(v0_array)    
        v0=v0_array(j);
        display(['i=',num2str(i),'; j=',num2str(j)])
        %跳数分布理论计算结果 
        hops_distri_theory_v0= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) ;
        %仿真计算跳数分布
        hops_distri_simu_v0=simu_04_hops_distri_mean(R,N,r,loop,v0);
        HCD_theory_v_R{i,j}=hops_distri_theory_v0;
        HCD_simu_v_R{i,j}=hops_distri_simu_v0;  
        
        [KL,KL_array,distri_error]=theory_06_KL(hops_distri_theory_v0,hops_distri_simu_v0) ;     
        KL_array_v_R(i,j)=KL;
        KL_array_cell_v_R{i,j}=KL_array;
        distri_error_cell_v_R{i,j}=distri_error;
        
 
    end
end


file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_v0_R' ,'.mat'];
save(filePath);
 
