%��SN����Բ�ģ���������������ȷֲ����������ֲ�,��¼ʵ������
clear;clc;
 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
R=10;r=3;N=200 ;loop=10 ;delta=0.01;

%�����ֲ����ۼ����� 
hops_distri_theory_mean = theory_04_hops_distri_SN_random (R,r,N,delta ) ;
 
%������������ֲ�
hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta );

%����ͼ����
hops_distri={hops_distri_theory_mean,hops_distri_simu_mean};

distri_array=plot_02_bar(hops_distri);