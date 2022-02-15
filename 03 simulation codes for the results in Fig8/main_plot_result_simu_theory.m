% A comparison between the theoretical equivalent annuluses and the
% realistic random node distribution. N, R and r are set to 300, 10 and 2.7468 respectively.
%通过运行该文件可以绘制得到Fig.8

%所有的实验数据存储在“02_16_10_44_plot_nodes_and_ro.mat”文件中
clear;clc;
load 02_16_10_44_plot_nodes_and_ro.mat
 

figure('Color','white');
hold on
color='b';width=1; 
for i=1:length(ro_array)       
      hold on
      hs_ro(i)=plot_03_circle_color(0,0,ro_array(i),[0.49 0.49 0.49],1) 
end 
 
box on
grid on
xlim([-11,11]);
ylim([-11,11]);
 
color_array=[1 0.6 0.78;1 0.84 0;0.3 0.75 0.39;1,0.6,0.78;0.7 0.7 0.7;0.3,0.75,0.93] 
for i=1:size(node_h_cell,2)
    color=color_array(mod(i,7)+1,:);
    node_h=node_h_cell{i};
    for j=1:length(node_h)
        node_id=node_h(j);  
        hs(i)=plot(    X(node_id),   Y(node_id) ,  'o','MarkerSize',2.2,'MarkerEdgeColor',color,'LineWidth',1 ,'MarkerFaceColor',color); %,'MarkerFaceColor',color
    end
end


rectangle('Position',[2.476,3.7,1,1],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
rectangle('Position',[3.2,6.25,0.75,0.75],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
rectangle('Position',[-9.2,-3,1,1],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
rectangle('Position',[3.5,-9.4,1.5,1.5],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 3.5,-9.8 ,'error points','FontSize',14)
text(-0.7 ,0.7,' o ','FontWeight','bold','FontSize',14)

 
plot([0,R],[0,0],'-','color','k','LineWidth',1); 
text(5 ,0.3,' \it{R} ' ,'FontSize',14);
plot([0,1.9],[0,2],'-','color','k','LineWidth',1)
text(1.7 ,1.5,' \it{a_1^o} ','FontSize',14 )
plot([0,0],[0,5],'-','color','k','LineWidth',1)
text(-0.3 ,5,' \it{a_2^o} ' ,'FontSize',14)
plot([0,-5.2],[0,5.1],'-','color','k','LineWidth',1)
text(-5.2 ,5.1,' \it{a_3^o} ','FontSize',14 )
plot([0,-9.5],[0,0],'-','color','k','LineWidth',1)
text(-9.9 ,0.7,' \it{a_4^o} ','FontSize',14 )
plot([0,-6.845],[0,-7.29],'-','color','k','LineWidth',1)
text(-6.845 ,-7.29,' \it{a_5^o} ','FontSize',14 )

hs_first=plot(0,0,'ko','MarkerSize',2.5,'MarkerEdgeColor','r','LineWidth',1,'MarkerFaceColor','r');
hs=[hs_first,hs];

xlabel('x','FontSize',14);
ylabel('y ','FontSize',14);

set(gca,'xtick',-10:5:10)
set(gca,'ytick',-10:5:10)
set(gcf,'unit','centimeters','position',[10 5 15 10]);
set(gca,'FontSize',14);
axis equal

le=legend(hs ,'SN', 'AN_1','AN_2 ','AN_3','AN_4','AN_5',   'Location','northeast'  ); %'Orientation','horizon'
set(le,'FontSize',14 );
legend('boxoff'); 