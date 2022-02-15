   
%---------------------------------------------����1--------------------------------------------------------%
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ��ı�r����¼r�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=400; delta=0.02; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r_array=r_min.* (1:0.05:2);
 
 
 
 HCD_theory_r=cell(1,length(r_array)); 
 HCD_simu_r=cell(1,length(r_array));
error_array_r=zeros(1,length(r_array));
KL_array_r=zeros(1,length(r_array));
JS_array_r=zeros(1,length(r_array));
Dis_array_r=zeros(1,length(r_array));

for i=1:length(r_array)
    %i=i
    r=r_array(i);  
    %�����ֲ����ۼ����� 
    hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta*0.1 ) ;
    %������������ֲ�
    hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );
    HCD_theory_r{i}=hops_distri_theory_mean;
    HCD_simu_r{i}=hops_distri_simu_mean;   
    error_array_r(i)=theory_05_RMSE(hops_distri_theory_mean,hops_distri_simu_mean);
    KL_array_r(i)=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean);
    JS_array_r(i)=theory_07_JS(hops_distri_theory_mean,hops_distri_simu_mean);
    Dis_array_r(i)=theory_08_Dis(hops_distri_theory_mean,hops_distri_simu_mean);
end

file_folder='datat_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_r' ,'.mat'];
save(filePath);

 
 