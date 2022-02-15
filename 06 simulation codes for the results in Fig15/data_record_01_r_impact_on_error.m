%---------------------------------------------仿真1--------------------------------------------------------%
%保证网络全连通（连通概率为P），源节点位于网络中心，改变r，记录r对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0
clear;clc;
P=0.9999; R=10;N=300 ; 
r_min=theory_06_P_full_connection(N,R,P); %保证网络全连通的r值
r_array=r_min.* (1:0.02:2);
% r_array=r_min ;

HCD1_r=cell(1,length(r_array));
HCD2_r=cell(1,length(r_array));
% HCD3_r=cell(1,length(r_array));
% f_n_v0_r=cell(1,length(r_array));
 
for i=1:length(r_array)
    %i=i
    r=r_array(i);  
    %paper01 跳数分布理论计算结果
    HCD1=paper_01_theoretical_HCD_ER(N,R,r);
    HCD2=paper_02_theoretical_HCD_ER(N,R,r);
    %f_n_v0 是一个元胞数组，含有两个元素，第一个元素是S-D间距v0取不同值时对应的跳数分布，第二个元素是v0的取值数组
%     [HCD3,f_n_v0]=paper_03_theoretical_HCD_GR(N,R,r);
    
    HCD1_r{1,i}=HCD1;
    HCD2_r{1,i}=HCD2;
%     HCD3_r{1,i}=HCD3;
%     f_n_v0_r{1,i}=f_n_v0;
        
end     

file_folder='数据记录\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_r' ,'.mat'];
save(filePath);
 
 