%数据合并
clear;clc;
load('10_13_14_55_variable_pho_N_r_SN_random.mat')

HCD_theory_N_r_all=cell(length(N_array),length(r_array)); 
HCD_simu_N_r_all=cell(length(N_array),length(r_array)); 
KL_array_N_r_all=zeros(length(N_array),length(r_array));
KL_array_cell_N_r_all=cell(length(N_array),length(r_array));
distri_error_cell_N_r_all=cell(length(N_array),length(r_array));
 
 
for i=1:length(N_array)
  
    for j=1:length(r_array)   
             
        HCD_theory_N_r_all{i,j}=HCD_theory_N_r{i,j};
        HCD_simu_N_r_all{i,j}=HCD_simu_N_r{i,j};   
    
        KL_array_N_r_all(i,j)=KL_array_N_r(i,j);
        KL_array_cell_N_r_all{i,j}=KL_array_cell_N_r{i,j};
        distri_error_cell_N_r_all{i,j}=distri_error_cell_N_r{i,j};
    end
end

load('10_16_15_22_variable_pho_N_r_SN_random_2.mat')

for i=31:length(N_array)
  
    for j=1:length(r_array)   
             
        HCD_theory_N_r_all{i,j}=HCD_theory_N_r{i,j};
        HCD_simu_N_r_all{i,j}=HCD_simu_N_r{i,j};   
    
        KL_array_N_r_all(i,j)=KL_array_N_r(i,j);
        KL_array_cell_N_r_all{i,j}=KL_array_cell_N_r{i,j};
        distri_error_cell_N_r_all{i,j}=distri_error_cell_N_r{i,j};
    end
end

load('10_16_16_00_variable_pho_N_r_SN_random_3.mat')

for i=30:30
  
    for j=43:length(r_array)   
             
        HCD_theory_N_r_all{i,j}=HCD_theory_N_r{i,j};
        HCD_simu_N_r_all{i,j}=HCD_simu_N_r{i,j};   
    
        KL_array_N_r_all(i,j)=KL_array_N_r(i,j);
        KL_array_cell_N_r_all{i,j}=KL_array_cell_N_r{i,j};
        distri_error_cell_N_r_all{i,j}=distri_error_cell_N_r{i,j};
    end
end

  t=datestr(clock,'mm_dd_HH_MM');
  %filePath=[file_folder,t,'_variable_r' ,'.mat'];
  filePath=[ t,'_variable_pho_N_r_SN_random_all' ,'.mat'];
 save(filePath);