 
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ����������ļ����v0���ı�v0����¼v0�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=2000 ; v0=0;delta=0.0002; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=r_min;
v0_array= (0 :0.02:1)*R;
% r_array=1.34 *r_min;
 
 HCD_theory_v0=cell(1,length(v0_array)); 
 HCD_simu_v0=cell(1,length(v0_array));
error_array_v0=zeros(1,length(v0_array));
KL_array_v0=zeros(1,length(v0_array));
JS_array_v0=zeros(1,length(v0_array));
Dis_array_v0=zeros(1,length(v0_array));

for i=1:length(v0_array)
    %i=i
    v0=v0_array(i);  
    %�����ֲ����ۼ�����    
    hops_distri_theory_v0= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) ;
    %������������ֲ�
    hops_distri_simu_v0=simu_04_hops_distri_mean(R,N,r,loop,v0);
    HCD_theory_v0{i}=hops_distri_theory_v0;
    HCD_simu_v0{i}=hops_distri_simu_v0;   
    error_array_v0(i)=theory_05_RMSE(hops_distri_theory_v0,hops_distri_simu_v0);
    KL_array_v0(i)=theory_06_KL(hops_distri_theory_v0,hops_distri_simu_v0);
    JS_array_v0(i)=theory_07_JS(hops_distri_theory_v0,hops_distri_simu_v0);
    Dis_array_v0(i)=theory_08_Dis(hops_distri_theory_v0,hops_distri_simu_v0);
end

file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_v0' ,'.mat'];
save(filePath);
 