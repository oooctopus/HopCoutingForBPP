 
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ����������ļ����v0���ı�v0,R����¼v0,R�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=2000  ; v0=0;delta=0.0002; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=r_min;
 
R_array=R.* (1:-0.01:0.5);
v0_array=zeros(1,length(R_array)); 
 
 HCD_theory_v_R=cell(length(v0_array),length(R_array)); 
 HCD_simu_v_R=cell(length(v0_array),length(R_array));
 KL_array_v_R=zeros(length(v0_array),length(R_array));
 KL_array_cell_v_R=cell(length(v0_array),length(R_array));
 distri_error_cell_v_R=cell(length(v0_array),length(R_array));
 
 

for i=1:length(R_array)
    R=R_array(i);
    v0_array=R.*(0:0.02:1);
    for j=1 :length(v0_array)    
        v0=v0_array(j);
        display(['i=',num2str(i),'; j=',num2str(j)])
        %�����ֲ����ۼ����� 
        hops_distri_theory_v0= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) ;
        %������������ֲ�
        hops_distri_simu_v0=simu_04_hops_distri_mean(R,N,r,loop,v0);
        HCD_theory_v_R{i,j}=hops_distri_theory_v0;
        HCD_simu_v_R{i,j}=hops_distri_simu_v0;  
        
        [KL,KL_array,distri_error]=theory_06_KL(hops_distri_theory_v0,hops_distri_simu_v0) ;     
        KL_array_v_R(i,j)=KL;
        KL_array_cell_v_R{i,j}=KL_array;
        distri_error_cell_v_R{i,j}=distri_error;
        
 
    end
end


file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_v0_R' ,'.mat'];
save(filePath);
 
