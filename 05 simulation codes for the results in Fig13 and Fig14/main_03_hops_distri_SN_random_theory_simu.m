%��SN����Բ�ģ���������������ȷֲ����������ֲ�,��¼ʵ������
clear;clc;


% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SN����ֲ�
clear;clc;
P=0.9999; R=10.000000;N=300 ;loop=200 ;delta=0.02;
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=1.2 *r_min;

%�����ֲ����ۼ����� 
hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta ) ;
 
%������������ֲ�
% hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop );
hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );

%����ͼ����
hops_distri={hops_distri_theory_mean,hops_distri_simu_mean};

distri_array=plot_02_bar(hops_distri);

KL=theory_06_KL(hops_distri_theory_mean,hops_distri_simu_mean)