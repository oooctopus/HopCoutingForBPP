clear;clc;
figure('Color','white');
 

subplot(2,2,1)
load  data_record\02_14_15_42_variable_v0_r.mat
%画出vo,N对应的色块图
KL_array_r_2=[KL_array_r(:,1),KL_array_r(:,6),KL_array_r(:,11),KL_array_r(:,16),KL_array_r(:,21),...
    KL_array_r(:,26),KL_array_r(:,31),KL_array_r(:,36),KL_array_r(:,41),KL_array_r(:,46),KL_array_r(:,51)];
r_array_2=[r_array(1),r_array(6),r_array(11),r_array(16),r_array(21),...
    r_array(26),r_array(31),r_array(36),r_array(41),r_array(46),r_array(51)];
 
[xx_r,yy_r]=meshgrid(v0_array,r_array_2);
p=pcolor(xx_r,yy_r,KL_array_r_2);
p.EdgeAlpha=0;
p.FaceAlpha=1;
xlabel('v ','FontSize',12);
ylabel('r ','FontSize',12);
t1=colorbar('FontSize',10)
axis tight
% set(gca,'YTickLabel',{'2.5','3','3.5','4', '4.5', 'R'});
title('(a) R=10, N=300','FontSize',11)
set(gca,'FontSize',10); 
set(gca,'position',[0.06 0.60 0.31 0.32])

%%
%------------------------------------------子图2------------------------------------%
subplot(2,2,2)
load data_record\02_17_14_39_variable_v0_N.mat
KL_array_N_2=[KL_array_N(:,1),KL_array_N(:,4),KL_array_N(:,7),KL_array_N(:,10),KL_array_N(:,13),...
    KL_array_N(:,16),KL_array_N(:,19),KL_array_N(:,22),KL_array_N(:,25),KL_array_N(:,28),KL_array_N(:,31)];
N_array_2=[N_array(1),N_array(4),N_array(7),N_array(10),N_array(13),...
    N_array(16),N_array(19),N_array(22),N_array(25),N_array(28),N_array(31)];
  
[xx,yy]=meshgrid(v0_array,N_array_2);
p=pcolor(xx,yy,KL_array_N_2)
p.EdgeAlpha=0;
p.FaceAlpha=1;
xlabel('v ','FontSize',12);
ylabel('N ','FontSize',12);
t2=colorbar('FontSize',10)
axis tight
title('(b) r=2.2297, R=10','FontSize',11)
set(gca,'position',[0.54 0.60 0.31 0.32])
 
%%
%------------------------------------------------子图3----------------------------------------------%
subplot(2,2,3)
% colormap winter
load data_record\02_17_03_58_variable_v0_R.mat
KL_array_R_2=[KL_array_r(:,1),KL_array_r(:,3),KL_array_r(:,5),KL_array_r(:,7),KL_array_r(:,9),...
    KL_array_r(:,11),KL_array_r(:,13),KL_array_r(:,15),KL_array_r(:,17),KL_array_r(:,19),KL_array_r(:,21)];

R_array_2=[R_array(1),R_array(3),R_array(5),R_array(7),R_array(9),...
    R_array(11),R_array(13),R_array(15),R_array(17),R_array(19),R_array(21)];

v0_array=0:1:10;
[xx,yy]=meshgrid(v0_array,R_array_2);
p=pcolor(xx,yy,KL_array_R_2)
p.EdgeAlpha=0;
p.FaceAlpha=1;
xlabel('v ','FontSize',12);
ylabel('R ','FontSize',12);
set(gca,'XTickLabel',{'0','0.2R','0.4R','0.6R', '0.8R', 'R'});
t3=colorbar('Position',[0.393,0.122,0.029 0.32],'FontSize',10);
% set(t3,'Position',[0.419,0.1095,0.0223 0.3429])
%  set(t3,'Position',[0.412,0.1095,0.0223 0.3429])
% t3.Position=[0.38,0.1095,0.0223 0.3429]  %[0.3778 0.5833 0.0223 0.3429]           [0.3769 0.1095 0.0213 0.3405]
axis tight
title('(c) N=300, r=2.2297','FontSize',11)
set(gca,'position',[0.06 0.12 0.31 0.32])


%%
%--------------------------------子图仿真4 KL-pho-r---------------------------%
load data_record\02_18_03_22_variable_pho_r.mat
subplot(2,2,4)
r_array_2=[r_array(1),r_array(3),r_array(5),r_array(7),r_array(9),...
    r_array(11),r_array(13),r_array(15),r_array(17),r_array(19),r_array(21)];
pho_array_2=[pho_array(1),pho_array(3),pho_array(5),pho_array(7),pho_array(9),...
    pho_array(11),pho_array(13),pho_array(15),pho_array(17),pho_array(19),pho_array(21)];

for i=1:2:21
    for j=1:2:21
        KL_array_N_r2((i+1)/2,(j+1)/2)=KL_array_N_r(i,j);
    end
end
        
[xx,yy]=meshgrid(pho_array_2,r_array_2);
p=pcolor(xx,yy,KL_array_N_r2)
p.EdgeAlpha=0;
p.FaceAlpha=1;
xlabel('\rho ','FontSize',12);
ylabel('r ','FontSize',12);
t4=colorbar('Position',[0.873,0.122,0.029 0.32],'FontSize',10);
title('(d) R=10, N=300:30:600','FontSize',11)
axis tight
set(gca,'position',[0.54 0.12 0.31 0.32])
set(gcf,'unit','centimeters','position',[10 5 18 11]);

 
  

 
