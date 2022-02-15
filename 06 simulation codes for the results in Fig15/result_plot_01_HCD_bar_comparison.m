clear;clc;
figure('Color','white');

%%
%子图1，SN位于圆心，S-D间跳数分布；N=300,R=10 
subplot(3,1,1); r_id=1;
% load  数据记录\02_17_16_06_mypaper_variable_r.mat
load  数据记录\02_11_00_46_mypaper_SN_O_variable_r_51.mat
my_theoretical_HCD=HCD_theory_r{1,r_id};
my_simulational_HCD=HCD_simu_r{1,r_id};
 
load  数据记录\02_23_09_17_paper0102_variable_r_51.mat
paper01_theoretical_HCD=HCD1_r{1,r_id};
paper02_theoretical_HCD=HCD2_r{1,r_id};
 
load  数据记录\02_23_09_19_paper03_variable_r_51.mat
paper03_theoretical_HCD=HCD3_r{1,r_id};

hopsdistri={paper01_theoretical_HCD,paper02_theoretical_HCD,paper03_theoretical_HCD,my_theoretical_HCD,my_simulational_HCD};
b=plot_02_bar(hopsdistri);
xlim([0,12]);

 
b(1).CData=[0.99 0.92 0.8];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.76 0.87 0.78];
b(2).EdgeColor=[0.93 0.84 0.84];
b(3).CData=[0.60 0.60 0.60];
% b(3).EdgeColor=[0.93 0.84 0.84];

b(4).CData=[1.00,0.00,0.00];
% b(4).EdgeColor=[0.95 0.87 0.73];
b(5).CData=[0 0 1];
% b(5).EdgeColor=[0.93 0.84 0.84]; HCDK,HCDP,HCDG,Theretical HCD,Simulational HCD
l=legend([b(1),b(2),b(3),b(4),b(5)] ,'HCDK','HCDP','HCDG','Theoretical HCD','Simulational HCD' ,  'Location','northeast' );
set(l,'FontSize',9) ;%,'Position',[0.52 0.79 0.3536 0.0726]

title('(a) v=0','FontSize',14)
set(gca,'xtick',1:1:12)
ylabel('Pr(H=h)','FontSize',14);
set(gca,'FontSize',14); 

%%
%子图2，SN位于5，S-D间跳数分布；N=300,R=10 
subplot(3,1,2); r_id=1;
% load  数据记录\02_17_16_06_mypaper_variable_r.mat
load  数据记录\02_13_22_49_mypaper_SN_v0_variable_v0.mat
my_theoretical_HCD=HCD_theory_v0{1,26};
my_simulational_HCD=HCD_simu_v0{1,26};
 
load  数据记录\02_21_23_21_paper0102_variable_r_21.mat
paper01_theoretical_HCD=HCD1_r{1,r_id};
paper02_theoretical_HCD=HCD2_r{1,r_id};
 
load  数据记录\02_21_23_27_paper03_variable_r_21.mat
paper03_theoretical_HCD=HCD3_r{1,r_id};

hopsdistri={paper01_theoretical_HCD,paper02_theoretical_HCD,paper03_theoretical_HCD,my_theoretical_HCD,my_simulational_HCD};
b=plot_02_bar(hopsdistri);
xlim([0,12]);

 
b(1).CData=[0.99 0.92 0.8];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.76 0.87 0.78];
b(2).EdgeColor=[0.93 0.84 0.84];
b(3).CData=[0.60 0.60 0.60];
b(4).CData=[1.00,0.00,0.00];
b(5).CData=[0 0 1];

title('(b) v=0.5R','FontSize',14)
set(gca,'xtick',1:1:12)
ylabel('Pr(H=h)','FontSize',14);
set(gca,'FontSize',14);

%%
%子图3，SN随机分布，S-D间跳数分布；N=300,R=10 
subplot(3,1,3); r_id=1;
load  数据记录\02_17_16_06_mypaper_variable_r_21.mat
my_theoretical_HCD=HCD_theory_r{1,r_id};
my_simulational_HCD=HCD_simu_r{1,r_id};
 
load  数据记录\02_21_23_21_paper0102_variable_r_21.mat
paper01_theoretical_HCD=HCD1_r{1,r_id};
paper02_theoretical_HCD=HCD2_r{1,r_id};
 
load  数据记录\02_21_23_27_paper03_variable_r_21.mat
paper03_theoretical_HCD=HCD3_r{1,r_id};

hopsdistri={paper01_theoretical_HCD,paper02_theoretical_HCD,paper03_theoretical_HCD,my_theoretical_HCD,my_simulational_HCD};
b=plot_02_bar(hopsdistri);
xlim([0,12]);

% b(1).BarWidth=0.9
b(1).CData=[0.99 0.92 0.8];
b(1).EdgeColor=[0.95 0.87 0.73];
b(2).CData=[0.76 0.87 0.78];
b(2).EdgeColor=[0.93 0.84 0.84];
b(3).CData=[0.60 0.60 0.60];
% b(3).EdgeColor=[0.93 0.84 0.84];

b(4).CData=[1.00,0.00,0.00];
% b(4).EdgeColor=[0.95 0.87 0.73];
b(5).CData=[0 0 1];
% b(5).EdgeColor=[0.93 0.84 0.84];
 title('(c) SN is randomly distributed','FontSize',14)
xlabel('h (hop count)','FontSize',14);
ylabel('Pr(H=h)','FontSize',14);

 
box on
set(gca,'xtick',1:1:12)
set(gcf,'unit','centimeters','position',[10 5 17 14]);
set(gca,'FontSize',14);
 
  
 

% % %  
% % % figure('Color','white');
% % % hold on
% % % 
% % % %分别画n1=10 n1=20,n1=30时的三条理论值曲线
% % % hs1=plot(r_array,error_array_1  ,'ko:','MarkerSize',3,'MarkerEdgeColor','k','LineWidth',1,'MarkerFaceColor','k');
% % % hs2=plot(r_array,error_array_2  ,'bo:','MarkerSize',4,'MarkerEdgeColor','b','LineWidth',1 );
% % % hs3=plot(r_array,error_array_3  ,'rs:','MarkerSize',3,'MarkerEdgeColor','r','LineWidth',1,'MarkerFaceColor','r');
% % % 
% % %  legend([hs1,hs2,hs3] ,'e_A^3 with N=200','e_A^3 with N=300 ','e_A^3 with N=400 ' ,  'Location','northeast' );
% % % % 'Orientation','horizon',
% % % 
% % % xlabel('r/m','FontSize',12);
% % % ylabel('e_HCD','FontSize',12);
% % % box on
% % %  ylim([0,0.1]);
% % %  
% % % 
% % % set(gcf,'unit','centimeters','position',[10 5 15 10]);





%   title('Ps a function of SF under different number of interferences')
