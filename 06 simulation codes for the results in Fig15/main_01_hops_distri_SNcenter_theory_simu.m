%����������¼ʵ������

%%---------------------------------����1 ��״ͼ�Ƚ� ����-���� �����ֲ�------------%%
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
% clear;clc;
P=0.9999; R=10.000000;N=350 ;loop=1; v0=0;delta=0.0002;
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=1.1 *r_min;
 
r=2.4526;
% r=2.5864;
% r=2.4974;

%�����ֲ����ۼ����� 
 [hop_distri_theory_v0_0,A_array,n_array,ri_array,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
 
% %������������ֲ�
   hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
% 
% %����ͼ����
  hopsdistri={hop_distri_theory_v0_0,hops_distri_simu_v0_0};
% 
  distri_array=plot_02_bar(hopsdistri);
  
  KL=theory_06_KL(hop_distri_theory_v0_0,hops_distri_simu_v0_0)
