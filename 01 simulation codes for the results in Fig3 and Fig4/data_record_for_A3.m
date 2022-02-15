%����������¼ʵ������
clear;clc;
%���ݹ�ʽ12�������۽��
%����չʾE(A_h)�� a_h_i���ھ�����a_h_o���⾶����n_h���ڵ���������r������뾶��֮��Ĺ�ϵ
%����E(A_3) 
%%------------------------h=3, n2=5,�ı�r,�������A3���ƽ��ֵ ���������۱Ƚ�-------------------------%
loop=200;delta=0.001; ri=10; %r=2; %ro=r+ri; 
 
n2=5; 
r_array=1:0.25:3;  ro_array=12.5:0.25:14.5 ;
 
%�������Ӧrֵ,�������Ӧroֵ,z�����Ӧ���
A3Theory_1=zeros( length(r_array), length(ro_array) );
A3Simu_1=zeros( length(r_array), length(ro_array) );

for i=1:length(r_array)
    r=r_array(i);
    a=i
    for j=1:length(ro_array)
        ro=ro_array(j);
        b=j
        s_A3_theory  =theory_01_Ah_nh( r, ri,ro,delta,n2);
        s_A3_simu=simu_03_A2_mean(ri,ro,r,n2,500,loop); %1/delta ����������ʱ�ĵ���ά��
        A3Theory_1(i,j)=s_A3_theory;
        A3Simu_1(i,j)=s_A3_simu;
    end
end

%%------------------------n2=10,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-------------------------%
n2=10; 
r_array=1:0.25:3;  ro_array=12.5:0.25:14.5 ;
 
%�������Ӧrֵ,�������Ӧroֵ,z�����Ӧ���
A3Theory_2=zeros( length(r_array), length(ro_array) );
A3Simu_2=zeros( length(r_array), length(ro_array) );

for i=1:length(r_array)
    r=r_array(i);
    a=i
    for j=1:length(ro_array)
        ro=ro_array(j);
        b=j
        s_A3_theory  =theory_01_Ah_nh( r, ri,ro,delta,n2);
        s_A3_simu=simu_03_A2_mean(ri,ro,r,n2,500,loop); %1/delta ����������ʱ�ĵ���ά��
        A3Theory_2(i,j)=s_A3_theory;
        A3Simu_2(i,j)=s_A3_simu;
    end
end


%%------------------------n2=30,�ı�r,�������A2���ƽ��ֵ ���������۱Ƚ�-------------------------%
n2=30; 
r_array=1:0.25:3;  ro_array=12.5:0.25:14.5 ;
 
%�������Ӧrֵ,�������Ӧroֵ,z�����Ӧ���
A3Theory_3=zeros( length(r_array), length(ro_array) );
A3Simu_3=zeros( length(r_array), length(ro_array) );

for i=1:length(r_array)
    r=r_array(i);
    a=i
    for j=1:length(ro_array)
        ro=ro_array(j);
        b=j
        s_A3_theory  =theory_01_Ah_nh( r, ri,ro,delta,n2);
        s_A3_simu=simu_03_A2_mean(ri,ro,r,n2,500,loop); %1/delta ����������ʱ�ĵ���ά��
        A3Theory_3(i,j)=s_A3_theory;
        A3Simu_3(i,j)=s_A3_simu;
    end
end 

file_folder='data_record\';
%��ϵͳʱ��Ϊ�ļ�����������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[file_folder,t,'-n2-',num2str(n2),'.mat'];
save(filePath);
    
    