%主函数，记录实验数据
clear;clc;
%根据公式12计算理论结果
%计算展示E(A_h)与 a_h_i（内径）、a_h_o（外径）、n_h（节点总数）、r（传输半径）之间的关系
%计算E(A_3) 
%%------------------------h=3, n2=5,改变r,计算多组A3面积平均值 仿真与理论比较-------------------------%
loop=200;delta=0.001; ri=10; %r=2; %ro=r+ri; 
 
n2=5; 
r_array=1:0.25:3;  ro_array=12.5:0.25:14.5 ;
 
%横坐标对应r值,纵坐标对应ro值,z坐标对应面积
A3Theory_1=zeros( length(r_array), length(ro_array) );
A3Simu_1=zeros( length(r_array), length(ro_array) );

for i=1:length(r_array)
    r=r_array(i);
    a=i
    for j=1:length(ro_array)
        ro=ro_array(j);
        b=j
        s_A3_theory  =theory_01_Ah_nh( r, ri,ro,delta,n2);
        s_A3_simu=simu_03_A2_mean(ri,ro,r,n2,500,loop); %1/delta 仿真计算面积时的点阵维度
        A3Theory_1(i,j)=s_A3_theory;
        A3Simu_1(i,j)=s_A3_simu;
    end
end

%%------------------------n2=10,改变r,计算多组A2面积平均值 仿真与理论比较-------------------------%
n2=10; 
r_array=1:0.25:3;  ro_array=12.5:0.25:14.5 ;
 
%横坐标对应r值,纵坐标对应ro值,z坐标对应面积
A3Theory_2=zeros( length(r_array), length(ro_array) );
A3Simu_2=zeros( length(r_array), length(ro_array) );

for i=1:length(r_array)
    r=r_array(i);
    a=i
    for j=1:length(ro_array)
        ro=ro_array(j);
        b=j
        s_A3_theory  =theory_01_Ah_nh( r, ri,ro,delta,n2);
        s_A3_simu=simu_03_A2_mean(ri,ro,r,n2,500,loop); %1/delta 仿真计算面积时的点阵维度
        A3Theory_2(i,j)=s_A3_theory;
        A3Simu_2(i,j)=s_A3_simu;
    end
end


%%------------------------n2=30,改变r,计算多组A2面积平均值 仿真与理论比较-------------------------%
n2=30; 
r_array=1:0.25:3;  ro_array=12.5:0.25:14.5 ;
 
%横坐标对应r值,纵坐标对应ro值,z坐标对应面积
A3Theory_3=zeros( length(r_array), length(ro_array) );
A3Simu_3=zeros( length(r_array), length(ro_array) );

for i=1:length(r_array)
    r=r_array(i);
    a=i
    for j=1:length(ro_array)
        ro=ro_array(j);
        b=j
        s_A3_theory  =theory_01_Ah_nh( r, ri,ro,delta,n2);
        s_A3_simu=simu_03_A2_mean(ri,ro,r,n2,500,loop); %1/delta 仿真计算面积时的点阵维度
        A3Theory_3(i,j)=s_A3_theory;
        A3Simu_3(i,j)=s_A3_simu;
    end
end 

file_folder='data_record\';
%以系统时间为文件名保存所有数据至指定文件夹
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n2-',num2str(n2),'.mat'];
save(filePath);
    
    