%����������¼ʵ������
clear;clc;
%���ݹ�ʽ12�������۽��
%����չʾE(A_h)�� a_h_i���ھ�����a_h_o���⾶����n_h���ڵ���������r������뾶��֮��Ĺ�ϵ
 
%%------------------------n1=5,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-------------------------%
loop=100;delta=0.001; ri=0; r=2; ro=r; 
 
n1=5;
r_array=1:0.2:3;
A2_array_theory_1=zeros(1,length(r_array)); 
A2_array_simu_1=zeros(1,length(r_array));

for i=1:length(r_array)
    r=r_array(i); ro=r;
    %function [Ah1,ri_2,ro_2]=theory_01_Ah_nh(r,ri,ro,delta,nh)
    s_A2_theory  =theory_01_Ah_nh( r, ri,ro,delta,n1);
    s_A2_simu=simu_03_A2_mean(ri,ro,r,n1,500,loop); %1/delta ����������ʱ�ĵ���ά��
    A2_array_theory_1(i)=s_A2_theory;
    A2_array_simu_1(i)=s_A2_simu;   
end

file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n1-',num2str(n1),'.mat'];
save(filePath);

% % % % % % %%------------------------n1=10,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-------------------------%
loop=100;delta=0.001; ri=0; r=2; ro=r;  
n1=10;
r_array=1:0.2:3;
A2_array_theory_2=zeros(1,length(r_array)); 
A2_array_simu_2=zeros(1,length(r_array));

for i=1:length(r_array)
    r=r_array(i); ro=r;
    %function [Ah1,ri_2,ro_2]=theory_01_Ah_nh(r,ri,ro,delta,nh)
    s_A2_theory  =theory_01_Ah_nh( r, ri,ro,delta,n1);
    s_A2_simu=simu_03_A2_mean(ri,ro,r,n1,500,loop); %1/delta ����������ʱ�ĵ���ά��
    A2_array_theory_2(i)=s_A2_theory;
    A2_array_simu_2(i)=s_A2_simu;   
end

file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n1-',num2str(n1),'.mat'];
save(filePath);
 
% % % % %%-----------------------n1=30,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-----------------------%%
loop=100;delta=0.001; ri=0; r=2; ro=r; 
n1=30;
r_array=1:0.2:3;
  
A2_array_theory_3=zeros(1,length(r_array)); 
A2_array_simu_3=zeros(1,length(r_array));

for i=1:length(r_array)
    r=r_array(i); ro=r;
    %function [Ah1,ri_2,ro_2]=theory_01_Ah_nh(r,ri,ro,delta,nh)
    s_A2_theory  =theory_01_Ah_nh( r, ri,ro,delta,n1);
    s_A2_simu=simu_03_A2_mean(ri,ro,r,n1,500,loop); %1/delta ����������ʱ�ĵ���ά��
    A2_array_theory_3(i)=s_A2_theory;
    A2_array_simu_3(i)=s_A2_simu;   
end

file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n1-',num2str(n1),'.mat'];
save(filePath);

 
    
    