clear;clc;
%画变量N和变量r对KL值的影响趋势
load 'data_record\10_20_09_24_variable_pho_N_r_SN_random_all.mat'

 


figure('Color','white');

% subplot(1,2,1);
box on
grid on
 
view([1,0.3,0.3 ]);
hold on           
[x,y]=meshgrid(r_array,N_array );
t1=surf(x,y, KL_array_N_r_all);
%t1.FaceAlpha=0.5;

ylabel('N','FontSize',14);
xlabel('r','FontSize',14);
zlabel('D_{KL}','FontSize',14);
set(gca,'FontSize',14); 

% subplot(1,2,2);
% box on
% grid on
%  
% view([1,0.5,0.3]);
% hold on           
% [x,y]=meshgrid(r_array,N_array );
% t1=surf(x,y, KL_array_N_r_all);
% %t1.FaceAlpha=0.5;
% 
% ylabel('N','FontSize',14);
% xlabel('r','FontSize',14);
% zlabel('D_{KL}','FontSize',14);
% set(gca,'FontSize',14); 
% 
% set(gcf,'unit','centimeters','position',[10 5 18 10]);


 