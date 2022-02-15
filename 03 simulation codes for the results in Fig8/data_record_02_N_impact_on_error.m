clear;clc; 

%---------------------------------------------����1--------------------------------------------------------%
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ��ı�N����¼N�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=300; v0=0;delta=0.0002; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=r_min ;

N_array=N:20:N+200;
 
 
 HCD_theory_2=cell(1,length(N_array)); 
 HCD_simu_2=cell(1,length(N_array));
error_array_2=zeros(1,length(N_array));

for i=1:length(N_array)
    i=i
    N=N_array(i);  
    %�����ֲ����ۼ����� 
    [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
    %������������ֲ�
    hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N,r,loop,v0);
    HCD_theory_2{i}=hop_distri_theory_v0_0;
    HCD_simu_2{i}=hops_distri_simu_v0_0;   
    error_array_2(i)=theory_05_RMSE(hop_distri_theory_v0_0,hops_distri_simu_v0_0);
end

file_folder='���ݼ�¼\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-r-',num2str(r_min),'-R-',num2str(R) ,'.mat'];
save(filePath);

% 
% 
% % % % % % %%------------------------N=200,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-------------------------%
% N2=350 ;   
%  
%  HCD_theory_2=cell(1,length(r_array)); 
%  HCD_simu_2=cell(1,length(r_array));
% error_array_2=zeros(1,length(r_array));
% 
% for i=1:length(r_array)
%     i=i
%     r=r_array(i);  
%     %�����ֲ����ۼ����� 
%     [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N2,delta);
%     %������������ֲ�
%     hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N2,r,loop,v0);
%     HCD_theory_2{i}=hop_distri_theory_v0_0;
%     HCD_simu_2{i}=hops_distri_simu_v0_0;   
%     error_array_2(i)=theory_05_RMSE(hop_distri_theory_v0_0,hops_distri_simu_v0_0);
% end 
% % % %-----------------------N=300,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-----------------------%%
% 
% N3=400  
%  
%  HCD_theory_3=cell(1,length(r_array)); 
%  HCD_simu_3=cell(1,length(r_array));
% error_array_3=zeros(1,length(r_array));
% 
% for i=1:length(r_array)
%     i=i
%     r=r_array(i);  
%     %�����ֲ����ۼ����� 
%     [hop_distri_theory_v0_0,~,~,~,~]=theory_02_A_h_rio_hops_distri(R,r,N3,delta);
%     %������������ֲ�
%     hops_distri_simu_v0_0=simu_04_hops_distri_mean(R,N3,r,loop,v0);
%     HCD_theory_3{i}=hop_distri_theory_v0_0;
%     HCD_simu_3{i}=hops_distri_simu_v0_0;   
%     error_array_3(i)=theory_05_RMSE(hop_distri_theory_v0_0,hops_distri_simu_v0_0);
% end 
% 
% file_folder='���ݼ�¼\';
% %��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
% t=datestr(clock,'mm_dd_HH_MM');
% filePath=[file_folder,t,'-N-300-400','.mat'];
% save(filePath);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% % %��ϵͳʱ��Ϊ�ļ�������ͼƬ��ָ���ļ���
% % figPath=[file_folder,t,'-N-',num2str(N),'.fig'];
% % saveas(gcf,figPath);
%     
%     