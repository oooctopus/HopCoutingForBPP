%����������¼ʵ�����ݡ�ͨ����״ͼ�Ƚ� ���������ֲ��ͷ��������ֲ�����ϳ̶ȡ�
%R��ʾ����뾶��r��ʾ�ڵ㴫��뾶��N��ʾ����ڵ��ܸ�����
%�ڵ��ܶ���pho=N/(pi*R^2)��loop��ʾ���泡��ģ�������v0��ʾԴ�ڵ�SN����������֮��ľ��룬��v0=0ʱ��ʾSNλ���������ġ�
clear;clc;
P=0.9999; R=10;N=300 ;r=2.7468;  v0=0;delta=0.0001; 
%���ݸ����������������ֲ����۽�� 
[hop_distri_theory_v0_0,~,~,~,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
%���ݸ����������������ֲ�������  
loop=2000 ; 
hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
%������״ͼ��ʾ�����ֲ����۽���Լ�������
hopsdistri={hop_distri_theory_v0_0,hops_distri_simu_v0_0};

figure();
distri_array=plot_02_bar(hopsdistri);
[KL,KL_array,distri_error]=theory_06_KL(hop_distri_theory_v0_0,hops_distri_simu_v0_0) ;

title(['KL=',num2str(KL),';   r=',num2str(r ) ]);
ylim([0,max([hop_distri_theory_v0_0,hops_distri_simu_v0_0])+0.05]);

