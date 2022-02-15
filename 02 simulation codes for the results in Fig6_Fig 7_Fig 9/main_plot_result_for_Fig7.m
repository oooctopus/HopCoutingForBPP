%绘制文章Hop Count Distribution for Minimum Hop-Count Routing in Finite Ad Hoc Networks中的 Fig.7
clear;clc;
figure('Color','white');
hold on 
 

subplot(3,1,1);
hold on
load  data_record\10_01_23_37_variable_r_loop_10000.mat   
plot(r_array,KL_array_r  ,'r-' ,'LineWidth',2 );
xlabel('r','FontSize',14);
plot(r_array(1),KL_array_r(1),'ro')
text(r_array(1)+0.02,KL_array_r(1)+0.005,'(2.2279,0.0073)','FontSize',14)
box on
grid on
xlim([r_array(1)-0.01,4.4 ]);
ylim([0,0.04]);
set(gca,'FontSize',14);


subplot(3,1,3);hold on;
load  data_record\10_02_22_01_variable_N_loop_10000.mat
%参数 N=300, R=10, r=r_array=r_min.* (1:0.02:2);    
plot(N_array,KL_array_N  ,'r-' ,'LineWidth',2 );
xlabel('N','FontSize',14);
box on
grid on
ylim([0,0.04]);
set(gca,'FontSize',14);

subplot(3,1,2);hold on;
load  data_record\10_02_22_20_variable_R_loop_10000.mat
%参数 N=300, R=10, r=r_array=r_min.* (1:0.02:2);    
plot(R_array,KL_array_R  ,'r-' ,'LineWidth',2 );
ylabel('KL  divergence  D_{KL}(Pr||Q)','FontSize',14);
xlabel('R','FontSize',14);
box on
grid on
% xlim([r_array(1)-0.01,r_array(end)+0.01]);
ylim([0,0.04]);
set(gca,'XDir','reverse')%对X方向反转
set(gca,'FontSize',14);
set(gcf,'unit','centimeters','position',[10 5 15 11.8]);

