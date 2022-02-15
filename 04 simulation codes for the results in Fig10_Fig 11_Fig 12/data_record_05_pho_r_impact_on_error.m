 
 
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ�ͨ������뾶R pho����¼R�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=400;  delta=0.02; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
N_array=N:6:N+300;
pho_array=N_array/(pi*R^2);
r_array=r_min.* (1:0.02:3);
 
 
HCD_theory_N_r=cell(length(N_array),length(r_array)); 
HCD_simu_N_r=cell(length(N_array),length(r_array)); 
KL_array_N_r=zeros(length(N_array),length(r_array));
KL_array_cell_N_r=cell(length(N_array),length(r_array));
distri_error_cell_N_r=cell(length(N_array),length(r_array));
 

for i=1:length(N_array)
    N=N_array(i);  
    for j=1:length(r_array)   
        r=r_array(j);
        %�����ֲ����ۼ�����
        hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta  ) ;
        %������������ֲ�
        hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );
        HCD_theory_N_r{i,j}=hops_distri_theory_mean;
        HCD_simu_N_r{i,j}=hops_distri_simu_mean;   
        
        [KL,KL_array,distri_error]=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean) ;     
        KL_array_N_r(i,j)=KL;
        KL_array_cell_N_r{i,j}=KL_array;
        distri_error_cell_N_r{i,j}=distri_error;
    end
end

 
file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_pho_r' ,'.mat'];
save(filePath);
 