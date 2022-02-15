 
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ���֤N,r���䣬��¼R�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=2000;  delta=0.02; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=r_min;
R_array=R.* (1:-0.01:0.5);
 
 
HCD_theory_R=cell(1,length(R_array)); 
HCD_simu_R=cell(1,length(R_array));
KL_array_cell_R=cell(1,length(R_array));
distri_error_cell_R=cell(1,length(R_array));
KL_array_R=zeros(1,length(R_array));
 
 

for i=1:length(R_array)
 
    R=R_array(i);  
    %�����ֲ����ۼ�����
    hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta  ) ;
    %������������ֲ�
    hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );
    HCD_theory_R{i }=hops_distri_theory_mean;
    HCD_simu_R{i}=hops_distri_simu_mean;
    
    [KL,KL_array,distri_error]=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean) ;
    KL_array_R(i)=KL;
    KL_array_cell_R{1,i}=KL_array;
    distri_error_cell_R{1,i}=distri_error;
  
end
 

file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_R' ,'.mat'];
save(filePath);
 