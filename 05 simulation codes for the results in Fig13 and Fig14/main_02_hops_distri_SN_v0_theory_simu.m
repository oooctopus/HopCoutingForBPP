%��SN����Բ�ģ�����v0���������ֲ�,��¼ʵ������
clear;clc;
 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0 
clear;clc;
P=0.9999; R=10.000000;N=300 ;loop=100; v0=0.9*R;delta=0.0002;
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=1.2 *r_min;


%�����ֲ����ۼ����� 
hops_distri_theory_v0= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) ;
 
%������������ֲ�
hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);

error_array_1 =theory_05_RMSE(hops_distri_theory_v0,hops_distri_simu_v0_0);

% %����ͼ����
hops_distri={hops_distri_theory_v0,hops_distri_simu_v0_0};

RMSE=theory_05_RMSE(hops_distri_theory_v0,hops_distri_simu_v0_0);
plot_02_bar(hops_distri);
