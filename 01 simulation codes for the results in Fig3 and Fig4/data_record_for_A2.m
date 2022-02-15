%主函数，记录实验数据
clear;clc;
%根据公式12计算理论结果
%计算展示E(A_h)与 a_h_i（内径）、a_h_o（外径）、n_h（节点总数）、r（传输半径）之间的关系
 
%%------------------------n1=5,改变r,计算多组A2面积平均值 仿真与理论比较-------------------------%
loop=100;delta=0.001; ri=0; r=2; ro=r; 
 
n1=5;
r_array=1:0.2:3;
A2_array_theory_1=zeros(1,length(r_array)); 
A2_array_simu_1=zeros(1,length(r_array));

for i=1:length(r_array)
    r=r_array(i); ro=r;
    %function [Ah1,ri_2,ro_2]=theory_01_Ah_nh(r,ri,ro,delta,nh)
    s_A2_theory  =theory_01_Ah_nh( r, ri,ro,delta,n1);
    s_A2_simu=simu_03_A2_mean(ri,ro,r,n1,500,loop); %1/delta 仿真计算面积时的点阵维度
    A2_array_theory_1(i)=s_A2_theory;
    A2_array_simu_1(i)=s_A2_simu;   
end

file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n1-',num2str(n1),'.mat'];
save(filePath);

% % % % % % %%------------------------n1=10,改变r,计算多组A2面积平均值 仿真与理论比较-------------------------%
loop=100;delta=0.001; ri=0; r=2; ro=r;  
n1=10;
r_array=1:0.2:3;
A2_array_theory_2=zeros(1,length(r_array)); 
A2_array_simu_2=zeros(1,length(r_array));

for i=1:length(r_array)
    r=r_array(i); ro=r;
    %function [Ah1,ri_2,ro_2]=theory_01_Ah_nh(r,ri,ro,delta,nh)
    s_A2_theory  =theory_01_Ah_nh( r, ri,ro,delta,n1);
    s_A2_simu=simu_03_A2_mean(ri,ro,r,n1,500,loop); %1/delta 仿真计算面积时的点阵维度
    A2_array_theory_2(i)=s_A2_theory;
    A2_array_simu_2(i)=s_A2_simu;   
end

file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n1-',num2str(n1),'.mat'];
save(filePath);
 
% % % % %%-----------------------n1=30,改变r,计算多组A2面积平均值 仿真与理论比较-----------------------%%
loop=100;delta=0.001; ri=0; r=2; ro=r; 
n1=30;
r_array=1:0.2:3;
  
A2_array_theory_3=zeros(1,length(r_array)); 
A2_array_simu_3=zeros(1,length(r_array));

for i=1:length(r_array)
    r=r_array(i); ro=r;
    %function [Ah1,ri_2,ro_2]=theory_01_Ah_nh(r,ri,ro,delta,nh)
    s_A2_theory  =theory_01_Ah_nh( r, ri,ro,delta,n1);
    s_A2_simu=simu_03_A2_mean(ri,ro,r,n1,500,loop); %1/delta 仿真计算面积时的点阵维度
    A2_array_theory_3(i)=s_A2_theory;
    A2_array_simu_3(i)=s_A2_simu;   
end

file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n1-',num2str(n1),'.mat'];
save(filePath);

 
    
    