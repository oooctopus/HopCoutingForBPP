%---------------------------------------------����3--------------------------------------------------------%
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ��ı�R����¼N�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ; 
r_min=theory_06_P_full_connection(N,R,P); %��֤����ȫ��ͨ��rֵ
r=r_min ;
R_array=R:-0.1:R-5 ;
R_array=10:-0.5:5;


HCD1_R=cell(1,length(R_array));
HCD2_R=cell(1,length(R_array));
% HCD3_R=cell(1,length(R_array));
% f_n_v0_R=cell(1,length(R_array));
 
for i=1:length(R_array)
    %i=i
    R=R_array(i);  
    %paper01 �����ֲ����ۼ�����
    HCD1=paper_01_theoretical_HCD_ER(N,R,r);
    HCD2=paper_02_theoretical_HCD_ER(N,R,r);
    %f_n_v0 ��һ��Ԫ�����飬��������Ԫ�أ���һ��Ԫ����S-D���v0ȡ��ֵͬʱ��Ӧ�������ֲ����ڶ���Ԫ����v0��ȡֵ����
%     [HCD3,f_n_v0]=paper_03_theoretical_HCD_GR(N,R,r);
    
    HCD1_R{1,i}=HCD1;
    HCD2_R{1,i}=HCD2;
%     HCD3_R{1,i}=HCD3;
%     f_n_v0_R{1,i}=f_n_v0;
        
end     

file_folder='���ݼ�¼\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_R' ,'.mat'];
save(filePath);
 
 