clear;clc; 

%---------------------------------------------仿真1--------------------------------------------------------%
%保证网络全连通（连通概率为P），源节点位于网络中心，改变N，记录N对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=300; v0=0;delta=0.0002; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r=r_min ;

N_array=N:20:N+200;
 
 
 HCD_theory_2=cell(1,length(N_array)); 
 HCD_simu_2=cell(1,length(N_array));
error_array_2=zeros(1,length(N_array));

for i=1:length(N_array)
    i=i
    N=N_array(i);  
    %跳数分布理论计算结果 
    [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
    %仿真计算跳数分布
    hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
    HCD_theory_2{i}=hop_distri_theory_v0_0;
    HCD_simu_2{i}=hops_distri_simu_v0_0;   
    error_array_2(i)=theory_05_RMSE(hop_distri_theory_v0_0,hops_distri_simu_v0_0);
end

file_folder='数据记录\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-r-',num2str(r_min),'-R-',num2str(R) ,'.mat'];
save(filePath);

% 
% 
% % % % % % %%------------------------N=200,改变r,计算多组A2面积平均值 仿真与理论比较-------------------------%
% N2=350 ;   
%  
%  HCD_theory_2=cell(1,length(r_array)); 
%  HCD_simu_2=cell(1,length(r_array));
% error_array_2=zeros(1,length(r_array));
% 
% for i=1:length(r_array)
%     i=i
%     r=r_array(i);  
%     %跳数分布理论计算结果 
%     [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N2,delta);
%     %仿真计算跳数分布
%     hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N2,r,loop,v0);
%     HCD_theory_2{i}=hop_distri_theory_v0_0;
%     HCD_simu_2{i}=hops_distri_simu_v0_0;   
%     error_array_2(i)=theory_05_RMSE(hop_distri_theory_v0_0,hops_distri_simu_v0_0);
% end 
% % % %-----------------------N=300,改变r,计算多组A2面积平均值 仿真与理论比较-----------------------%%
% 
% N3=400  
%  
%  HCD_theory_3=cell(1,length(r_array)); 
%  HCD_simu_3=cell(1,length(r_array));
% error_array_3=zeros(1,length(r_array));
% 
% for i=1:length(r_array)
%     i=i
%     r=r_array(i);  
%     %跳数分布理论计算结果 
%     [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N3,delta);
%     %仿真计算跳数分布
%     hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N3,r,loop,v0);
%     HCD_theory_3{i}=hop_distri_theory_v0_0;
%     HCD_simu_3{i}=hops_distri_simu_v0_0;   
%     error_array_3(i)=theory_05_RMSE(hop_distri_theory_v0_0,hops_distri_simu_v0_0);
% end 
% 
% file_folder='数据记录\';
% %以系统时间为文件名保存所有数据至指定文件夹
% t=datestr(clock,'mm_dd_HH_MM');
% filePath=[file_folder,t,'-N-300-400','.mat'];
% save(filePath);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% % %以系统时间为文件名保存图片至指定文件夹
% % figPath=[file_folder,t,'-N-',num2str(N),'.fig'];
% % saveas(gcf,figPath);
%     
%     