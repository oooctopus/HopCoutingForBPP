% %�������
clear;clc;
%%
%SNλ�����ģ�����r���������;N=300,R=10
load  ���ݼ�¼\02_11_00_46_mypaper_SN_O_variable_r_51.mat   %�������ݣ��������۹�ʽ  rȡֵΪr_min*[1:0.02:2]
load  ���ݼ�¼\02_23_09_17_paper0102_variable_r_51.mat   %paper 01 02���ۼ���ֲ�  rȡֵΪr_min*[1:0.02:2]
load  ���ݼ�¼\02_23_09_19_paper03_variable_r_51.mat  %paper 03���ۼ���ֲ� rȡֵΪr_min*[1:0.02:2]

KL_array_r_mine=zeros(1,length(r_array)); 
KL_array_r_paper01=zeros(1,length(r_array)); 
KL_array_r_paper02=zeros(1,length(r_array)); 
KL_array_r_paper03=zeros(1,length(r_array)); 


for i=1:length(r_array)
                    
        %�����ֲ����ۼ����� 
        HCD_simu_i= HCD_simu_r{1,i} ;
        HCD_theory_i=HCD_theory_r{1,i};
        HCD_paper01=HCD1_r{1,i};
        HCD_paper02=HCD2_r{1,i};
        HCD_paper03=HCD3_r{1,i}; 
                 
        KL_array_r_mine(i )=theory_06_KL(HCD_theory_i,HCD_simu_i);
        KL_array_r_paper01(i )=theory_06_KL(HCD_paper01,HCD_simu_i);
        KL_array_r_paper02(i )=real( theory_06_KL(HCD_paper02,HCD_simu_i) );
        KL_array_r_paper03(i )=theory_06_KL(HCD_paper03,HCD_simu_i);
   
end

min_KL_mine=min(KL_array_r_mine); max_KL_mine=max(KL_array_r_mine);
min_KL_01=min(KL_array_r_paper01); max_KL_01=max(KL_array_r_paper01);
min_KL_02=min(KL_array_r_paper02); max_KL_02=max(KL_array_r_paper02);
min_KL_03=min(KL_array_r_paper03); max_KL_03=max(KL_array_r_paper03);

disp('------------------------SN is at center,2.2297*[1:0.02:2]---------------------');
display([num2str(min_KL_mine),' <=min_KL_mine<= ',num2str(max_KL_mine)]);
display([num2str(min_KL_01),' <=min_KL_mine<= ',num2str(max_KL_01)]);
display([num2str(min_KL_02),' <=min_KL_mine<= ',num2str(max_KL_02)]);
display([num2str(min_KL_03),' <=min_KL_mine<= ',num2str(max_KL_03)]);

%%
%SNλ�����ģ�����N���������ڵ��ܶȴ�������,r=2.2297,R=10     clear;clc
load  ���ݼ�¼\02_11_02_25_mypaper_SN_O_variable_N_31.mat   %�������ݣ��������۹�ʽ  NȡֵΪN=300:10:600
load  ���ݼ�¼\02_23_09_23_paper0102_variable_N_31.mat   %paper 01 02���ۼ���ֲ�   NȡֵΪN=300:10:600
load  ���ݼ�¼\02_23_09_24_paper03_variable_N_31.mat  %paper 03���ۼ���ֲ�  NȡֵΪN=300:10:600

KL_array_N_mine=zeros(1,length(N_array)); 
KL_array_N_paper01=zeros(1,length(N_array)); 
KL_array_N_paper02=zeros(1,length(N_array)); 
KL_array_N_paper03=zeros(1,length(N_array)); 


for i=1:length(N_array)
                    
        %�����ֲ����ۼ����� 
        HCD_simu_i= HCD_simu_N{1,i} ;
        HCD_theory_i=HCD_theory_N{1,i};
        HCD_paper01=HCD1_N{1,i};
        HCD_paper02=HCD2_N{1,i};
        HCD_paper03=HCD3_N{1,i}; 
                 
        KL_array_N_mine(i )=theory_06_KL(HCD_theory_i,HCD_simu_i);
        KL_array_N_paper01(i )=theory_06_KL(HCD_paper01,HCD_simu_i);
        KL_array_N_paper02(i )=real( theory_06_KL(HCD_paper02,HCD_simu_i) );
        KL_array_N_paper03(i )=theory_06_KL(HCD_paper03,HCD_simu_i);
   
end

min_KL_mine=min(KL_array_N_mine); max_KL_mine=max(KL_array_N_mine);
min_KL_01=min(KL_array_N_paper01); max_KL_01=max(KL_array_N_paper01);
min_KL_02=min(KL_array_N_paper02); max_KL_02=max(KL_array_N_paper02);
min_KL_03=min(KL_array_N_paper03); max_KL_03=max(KL_array_N_paper03);
disp('------------------------SN is at center,N=300:10:600---------------------');
display([num2str(min_KL_mine),' <=min_KL_mine<= ',num2str(max_KL_mine)]);
display([num2str(min_KL_01),' <=min_KL_mine<= ',num2str(max_KL_01)]);
display([num2str(min_KL_02),' <=min_KL_mine<= ',num2str(max_KL_02)]);
display([num2str(min_KL_03),' <=min_KL_mine<= ',num2str(max_KL_03)]);


%%
%SNλ�����ģ�����R��������� ,r=2.2297,N=300     clear;clc
load  ���ݼ�¼\02_11_04_05_mypaper_SN_O_variable_R_51.mat   %�������ݣ��������۹�ʽ  RȡֵΪR=10:-0.1:5
load  ���ݼ�¼\02_23_09_49_paper0102_variable_R_51.mat   %paper 01 02���ۼ���ֲ�   RȡֵΪR=10:-0.1:5
load  ���ݼ�¼\02_23_09_57_paper03_variable_R_51.mat  %paper 03���ۼ���ֲ�  RȡֵΪR=10:-0.1:5
HCD3_R=HCD3_radius;

KL_array_R_mine=zeros(1,length(R_array)); 
KL_array_R_paper01=zeros(1,length(R_array)); 
KL_array_R_paper02=zeros(1,length(R_array)); 
KL_array_R_paper03=zeros(1,length(R_array)); 

for i=1:length(R_array)
                    
        %�����ֲ����ۼ����� 
        HCD_simu_i= HCD_simu_R{1,i} ;
        HCD_theory_i=HCD_theory_R{1,i};
        HCD_paper01=HCD1_R{1,i};
        HCD_paper02=HCD2_R{1,i};
        HCD_paper03=HCD3_R{1,i}; 
                 
        KL_array_R_mine(i )=theory_06_KL(HCD_theory_i,HCD_simu_i);
        KL_array_R_paper01(i )=theory_06_KL(HCD_paper01,HCD_simu_i);
        KL_array_R_paper02(i )=real( theory_06_KL(HCD_paper02,HCD_simu_i) );
        KL_array_R_paper03(i )=theory_06_KL(HCD_paper03,HCD_simu_i);
   
end

min_KL_mine=min(KL_array_R_mine); max_KL_mine=max(KL_array_R_mine);
min_KL_01=min(KL_array_R_paper01); max_KL_01=max(KL_array_R_paper01);
min_KL_02=min(KL_array_R_paper02); max_KL_02=max(KL_array_R_paper02);
min_KL_03=min(KL_array_R_paper03); max_KL_03=max(KL_array_R_paper03);
disp('------------------------SN is at center,RȡֵΪR=10:-0.1:5---------------------');
display([num2str(min_KL_mine),' <=min_KL_mine<= ',num2str(max_KL_mine)]);
display([num2str(min_KL_01),' <=min_KL_mine<= ',num2str(max_KL_01)]);
display([num2str(min_KL_02),' <=min_KL_mine<= ',num2str(max_KL_02)]);
display([num2str(min_KL_03),' <=min_KL_mine<= ',num2str(max_KL_03)]);


%%
%SN ����ֲ�������r���������
%SNλ�����ģ�����R��������� ,r=2.2297,N=300     clear;clc
load  ���ݼ�¼\02_17_16_06_mypaper_variable_r_21.mat   %�������ݣ��������۹�ʽ  RȡֵΪN=10:-0.1:5
load  ���ݼ�¼\02_21_23_21_paper0102_variable_r_21.mat   %paper 01 02���ۼ���ֲ�   NȡֵΪN=300:10:600
load  ���ݼ�¼\02_21_23_27_paper03_variable_r_21.mat  %paper 03���ۼ���ֲ�  NȡֵΪN=300:10:600
 

KL_array_r_mine=zeros(1,length(r_array)); 
KL_array_r_paper01=zeros(1,length(r_array)); 
KL_array_r_paper02=zeros(1,length(r_array)); 
KL_array_r_paper03=zeros(1,length(r_array)); 

for i=1:length(r_array)
                    
        %�����ֲ����ۼ����� 
        HCD_simu_i= HCD_simu_r{1,i} ;
        HCD_theory_i=HCD_theory_r{1,i};
        HCD_paper01=HCD1_r{1,i};
        HCD_paper02=HCD2_r{1,i};
        HCD_paper03=HCD3_r{1,i}; 
                 
        KL_array_r_mine(i )=theory_06_KL(HCD_theory_i,HCD_simu_i);
        KL_array_r_paper01(i )=theory_06_KL(HCD_paper01,HCD_simu_i);
        KL_array_r_paper02(i )=real( theory_06_KL(HCD_paper02,HCD_simu_i) );
        KL_array_r_paper03(i )=theory_06_KL(HCD_paper03,HCD_simu_i);
   
end

min_KL_mine=min(KL_array_r_mine); max_KL_mine=max(KL_array_r_mine);
min_KL_01=min(KL_array_r_paper01); max_KL_01=max(KL_array_r_paper01);
min_KL_02=min(KL_array_r_paper02); max_KL_02=max(KL_array_r_paper02);
min_KL_03=min(KL_array_r_paper03); max_KL_03=max(KL_array_r_paper03);
disp('------------------------SN is randomly distributed,r=2.2297*[1:0.05:2]---------------------');
display([num2str(min_KL_mine),' <=min_KL_mine<= ',num2str(max_KL_mine)]);
display([num2str(min_KL_01),' <=min_KL_mine<= ',num2str(max_KL_01)]);
display([num2str(min_KL_02),' <=min_KL_mine<= ',num2str(max_KL_02)]);
display([num2str(min_KL_03),' <=min_KL_mine<= ',num2str(max_KL_03)]); 
%%
%SN ����ֲ�������N��������� r=2.2297,R=10     clear;clc
 
load  ���ݼ�¼\02_16_17_09_mypaper_variable_N_31.mat   %�������ݣ��������۹�ʽ  RȡֵΪN=10:-0.1:5
load  ���ݼ�¼\02_23_09_23_paper0102_variable_N_31.mat   %paper 01 02���ۼ���ֲ�   NȡֵΪN=300:10:600
load  ���ݼ�¼\02_23_09_24_paper03_variable_N_31.mat  %paper 03���ۼ���ֲ�  NȡֵΪN=300:10:600
 

KL_array_N_mine=zeros(1,length(N_array)); 
KL_array_N_paper01=zeros(1,length(N_array)); 
KL_array_N_paper02=zeros(1,length(N_array)); 
KL_array_N_paper03=zeros(1,length(N_array)); 


for i=1:length(N_array)
                    
        %�����ֲ����ۼ����� 
        HCD_simu_i= HCD_simu_N{1,i} ;
        HCD_theory_i=HCD_theory_N{1,i};
        HCD_paper01=HCD1_N{1,i};
        HCD_paper02=HCD2_N{1,i};
        HCD_paper03=HCD3_N{1,i}; 
                 
        KL_array_N_mine(i )=theory_06_KL(HCD_theory_i,HCD_simu_i);
        KL_array_N_paper01(i )=theory_06_KL(HCD_paper01,HCD_simu_i);
        KL_array_N_paper02(i )=real( theory_06_KL(HCD_paper02,HCD_simu_i) );
        KL_array_N_paper03(i )=theory_06_KL(HCD_paper03,HCD_simu_i);
   
end

min_KL_mine=min(KL_array_N_mine); max_KL_mine=max(KL_array_N_mine);
min_KL_01=min(KL_array_N_paper01); max_KL_01=max(KL_array_N_paper01);
min_KL_02=min(KL_array_N_paper02); max_KL_02=max(KL_array_N_paper02);
min_KL_03=min(KL_array_N_paper03); max_KL_03=max(KL_array_N_paper03);
disp('------------------------SN is randomly distributed, N=300:10:600---------------------');
display([num2str(min_KL_mine),' <=min_KL_mine<= ',num2str(max_KL_mine)]);
display([num2str(min_KL_01),' <=min_KL_mine<= ',num2str(max_KL_01)]);
display([num2str(min_KL_02),' <=min_KL_mine<= ',num2str(max_KL_02)]);
display([num2str(min_KL_03),' <=min_KL_mine<= ',num2str(max_KL_03)]);

%%
%SN ����ֲ�������R���������  ,r=2.2297,N=300     clear;clc
load  ���ݼ�¼\02_11_04_05_mypaper_SN_O_variable_R_51.mat   %�������ݣ��������۹�ʽ  RȡֵΪR=10:-0.5:5
load  ���ݼ�¼\02_23_10_25_paper0102_variable_R_11.mat   %paper 01 02���ۼ���ֲ�   RȡֵΪR=10:-0.5:5
load  ���ݼ�¼\02_23_10_26_paper03_variable_R_11.mat  %paper 03���ۼ���ֲ�  RȡֵΪR=10:-0.5:5
HCD3_R=HCD3_radius;

KL_array_R_mine=zeros(1,length(R_array)); 
KL_array_R_paper01=zeros(1,length(R_array)); 
KL_array_R_paper02=zeros(1,length(R_array)); 
KL_array_R_paper03=zeros(1,length(R_array)); 

for i=1:length(R_array)
                    
        %�����ֲ����ۼ����� 
        HCD_simu_i= HCD_simu_R{1,i} ;
        HCD_theory_i=HCD_theory_R{1,i};
        HCD_paper01=HCD1_R{1,i};
        HCD_paper02=HCD2_R{1,i};
        HCD_paper03=HCD3_R{1,i}; 
                 
        KL_array_R_mine(i )=theory_06_KL(HCD_theory_i,HCD_simu_i);
        KL_array_R_paper01(i )=theory_06_KL(HCD_paper01,HCD_simu_i);
        KL_array_R_paper02(i )=real( theory_06_KL(HCD_paper02,HCD_simu_i) );
        KL_array_R_paper03(i )=theory_06_KL(HCD_paper03,HCD_simu_i);
   
end

min_KL_mine=min(KL_array_R_mine); max_KL_mine=max(KL_array_R_mine);
min_KL_01=min(KL_array_R_paper01); max_KL_01=max(KL_array_R_paper01);
min_KL_02=min(KL_array_R_paper02); max_KL_02=max(KL_array_R_paper02);
min_KL_03=min(KL_array_R_paper03); max_KL_03=max(KL_array_R_paper03);
disp('------------------------SN is randomly distributed, R=10:-0.5:5---------------------');
display([num2str(min_KL_mine),' <=min_KL_mine<= ',num2str(max_KL_mine)]);
display([num2str(min_KL_01),' <=min_KL_mine<= ',num2str(max_KL_01)]);
display([num2str(min_KL_02),' <=min_KL_mine<= ',num2str(max_KL_02)]);
display([num2str(min_KL_03),' <=min_KL_mine<= ',num2str(max_KL_03)]);