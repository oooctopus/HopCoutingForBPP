%---------------------------------------------����1--------------------------------------------------------%
%��֤����ȫ��ͨ����ͨ����ΪP����Դ�ڵ�λ���������ģ��ı�r����¼r�������ֲ�����ģ�͵ľ���Ӱ�� 
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0

clear;clc;
P=0.9999; 
global radius;global N;
radius=10;  N=300; rho= N/(pi*radius^2);
lamda=rho ; way_id=1;
r_min=theory_06_P_full_connection(N,radius,P); %��֤����ȫ��ͨ��rֵ
r=r_min;  R=r;  N_delta=20;delta = R/N_delta;  n_max= ceil( 2*radius/R)*4;
N_array=N:15:N+300;

% N_array=N:300:N+300;

HCD3_N=cell(1,length(N_array));
f_n_v0_N=cell(1,length(N_array));
 
for i=1:length(N_array)
    %i=i
    N=N_array(i);
    %f_n_v0 ��һ��Ԫ�����飬��������Ԫ�أ���һ��Ԫ����S-D���v0ȡ��ֵͬʱ��Ӧ�������ֲ����ڶ���Ԫ����v0��ȡֵ����
    [f_n,f_n_v0]=func_13_f_n_PPP( n_max,R,lamda,delta,N_delta,way_id,radius);    
 
    HCD3_N{1,i}=f_n;
    f_n_v0_N{1,i}=f_n_v0;        
end     

file_folder='���ݼ�¼\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'_variable_N' ,'.mat'];
save(filePath);
 
 