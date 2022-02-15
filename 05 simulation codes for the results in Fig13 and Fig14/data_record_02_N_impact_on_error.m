
%---------------------------------------------����2--------------------------------------------------------%
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ��ı�N����¼N�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
 
clear;clc;
P=0.9999; R=10;N=300 ;loop=400;  delta=0.02; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r =r_min;
N_array=N:15:N+300;
 
 HCD_theory_N=cell(1,length(N_array)); 
 HCD_simu_N=cell(1,length(N_array));
error_array_N=zeros(1,length(N_array));
KL_array_N=zeros(1,length(N_array));
JS_array_N=zeros(1,length(N_array));
Dis_array_N=zeros(1,length(N_array));

for i=1:length(N_array)
    %i=i
    N=N_array(i);  
    %�����ֲ����ۼ����� 
    hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta*0.1 ) ;
    %������������ֲ�
    hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );
    HCD_theory_N{i}=hops_distri_theory_mean;
    HCD_simu_N{i}=hops_distri_simu_mean;   
    error_array_N(i)=theory_05_RMSE(hops_distri_theory_mean,hops_distri_simu_mean);
    KL_array_N(i)=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean);
    JS_array_N(i)=theory_07_JS(hops_distri_theory_mean,hops_distri_simu_mean);
    Dis_array_N(i)=theory_08_Dis(hops_distri_theory_mean,hops_distri_simu_mean);
end

file_folder='datat_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_N' ,'.mat'];
save(filePath);
 