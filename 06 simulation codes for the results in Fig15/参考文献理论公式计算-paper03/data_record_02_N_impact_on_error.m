%---------------------------------------------仿真1--------------------------------------------------------%
%保证网络全连通（连通概率为P），源节点位于网络中心，改变r，记录r对跳数分布理论模型的精度影响 
% R网络半径，r传输半径，N网络节点总个数，L网格维度，节点密度pho=N/(pi*R^2)，场景个数loop，SN位置v0

clear;clc;
P=0.9999; 
global radius;global N;
radius=10;  N=300; rho= N/(pi*radius^2);
lamda=rho ; way_id=1;
r_min=theory_06_P_full_connection(N,radius,P); %保证网络全连通的r值
r=r_min;  R=r;  N_delta=20;delta = R/N_delta;  n_max= ceil( 2*radius/R)*4;
N_array=N:15:N+300;

% N_array=N:300:N+300;

HCD3_N=cell(1,length(N_array));
f_n_v0_N=cell(1,length(N_array));
 
for i=1:length(N_array)
    %i=i
    N=N_array(i);
    %f_n_v0 是一个元胞数组，含有两个元素，第一个元素是S-D间距v0取不同值时对应的跳数分布，第二个元素是v0的取值数组
    [f_n,f_n_v0]=func_13_f_n_PPP( n_max,R,lamda,delta,N_delta,way_id,radius);    
 
    HCD3_N{1,i}=f_n;
    f_n_v0_N{1,i}=f_n_v0;        
end     

file_folder='数据记录\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_N' ,'.mat'];
save(filePath);
 
 