clear;clc;
load data_record\11_12_23_04-n2-30.mat

 


figure('Color','white');
box on
grid on
view(-60,10);

%%------------------------h=3, n2=5,改变r,计算多组A3面积平均值 仿真与理论比较-------------------------%
[x,y] = meshgrid(ro_array,r_array);
hold on
 

sz = 18; 
s1=scatter3(x(:),y(:), A3Simu_1(:),sz,'MarkerEdgeColor',[0.00,0.00,1.00], 'MarkerFaceColor',[0.00,0.00,1.00]);
 
sz = 18; 
s2=scatter3(x(:),y(:), A3Simu_2(:),sz,'MarkerEdgeColor',[0.30,0.75,0.93], 'MarkerFaceColor',[0.30,0.75,0.93] );

sz = 18; 
s3=scatter3(x(:),y(:), A3Simu_3(:),sz,'MarkerEdgeColor','r', 'MarkerFaceColor','r');

t1=mesh(x,y, A3Theory_1 );
t2=mesh(x,y, A3Theory_2);
t3=mesh(x,y, A3Theory_3);

t1.FaceColor=[0.39,0.47,0.64];
t1.EdgeColor=[0.00,0.00,0.00];
t1.FaceAlpha=0.7;

t2.FaceColor=[0.58,0.31,0.39];
t2.EdgeColor=[0.50,0.80,0.50];
t2.FaceAlpha=0.7;

t3.FaceColor=[0.99,0.92,0.80];
t3.EdgeColor=[0.64,0.08,0.18];
t3.FaceAlpha=0.5;

 
 
le1=legend([s1,s2,s3],' ',' ' ,' ',  'Location',[0.21 0.21 1 1]);
set(le1,'FontSize',4,'Orientation','horizon','Box','off');
text(12.7,1.5,140,'simulation result','FontSize',14)
text(10.3, 0.4 ,140,'theoretical result','FontSize',14)

 

text(12.5,2.85,140,'n_2=30','FontSize',14)
text(12.5,2.85,70,'n_2=10','FontSize',14)
text(12.6,3.1,42,'n_2=5','FontSize',14)

ylabel('r','FontSize',14);
xlabel('a_2^o','FontSize',14);
zlabel('E(||A_3||)','FontSize',14);
set(gca,'FontSize',14);

set(gcf,'unit','centimeters','position',[10 5 15 10]);

ah=axes('position',get(gca,'position'),'visible','off');
le2=legend(ah,[t1,t2,t3],' ',' ' ,' ',  'Location',[0.22 0.1 1 1]);
set(le2,'FontSize',4,'Orientation','horizon','Box','off');
 
 