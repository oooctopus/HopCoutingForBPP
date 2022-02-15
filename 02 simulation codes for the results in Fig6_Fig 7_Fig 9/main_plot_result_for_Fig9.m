%绘制文章Hop Count Distribution for Minimum Hop-Count Routing in Finite Ad Hoc Networks中的 Fig.9
clear;clc;
figure('Color','white');
hold on 

%数据导入和转换
load('data_record\10_01_23_37_variable_r_loop_10000.mat') 
HCD_theory_r_column=cell( length(r_array),1); 
 HCD_simu_r_column=cell( length(r_array),1);
 KL_array_cell_column=cell( length(r_array),1);
 for i=1:length(r_array)
     HCD_theory_r_column{i,1}=HCD_theory_r{i};
     HCD_simu_r_column{i,1}=HCD_simu_r{i};
     KL_array_cell_column{i,1}=KL_array_cell{i};
 end
 KL_array_r_column= KL_array_r';
 
 KL_cell_max=length(KL_array_cell_column{1,1});
 for i=1:length(r_array)
     if length(KL_array_cell_column{i,1})>KL_cell_max
         KL_cell_max=length(KL_array_cell_column{i,1});
     end
 end
 KL_cell_to_array=zeros(length(r_array),KL_cell_max);
 for i=1:length(r_array)
     len=length(KL_array_cell_column{i,1});
     KL_cell_to_array(i,1:len)=KL_array_cell_column{i,1};
 end
 
  HCD_cell_max=length(HCD_theory_r_column{1,1});
 for i=1:length(r_array)
     if length(HCD_theory_r_column{i,1})>HCD_cell_max
         HCD_cell_max=length(HCD_theory_r_column{i,1});
     end
 end
 HCD_cell_to_array=zeros(length(r_array),HCD_cell_max);
 for i=1:length(r_array)
     len=length(HCD_theory_r_column{i,1});
     HCD_cell_to_array(i,1:len)=HCD_theory_r_column{i,1};
 end
 
   HCD_simu_cell_max=length(HCD_simu_r_column{1,1});
 for i=1:length(r_array)
     if length(HCD_simu_r_column{i,1})>HCD_simu_cell_max
         HCD_simu_cell_max=length(HCD_simu_r_column{i,1});
     end
 end
 HCD_simu_cell_to_array=zeros(length(r_array),HCD_simu_cell_max);
 for i=1:length(r_array)
     len=length(HCD_simu_r_column{i,1});
     HCD_simu_cell_to_array(i,1:len)=HCD_simu_r_column{i,1};
 end

   distri_error_cell_max=length(distri_error_cell{1,1});
 for i=1:length(r_array)
     if length(distri_error_cell{ 1,i})>distri_error_cell_max
         distri_error_cell_max=length(distri_error_cell{ 1,i});
     end
 end
 distri_cell_to_array=zeros(length(r_array),distri_error_cell_max);
 for i=1:length(r_array)
     len=length(distri_error_cell{ 1,i});
     distri_cell_to_array(i,1:len)=distri_error_cell{ 1,i};
 end


subplot(2,1,1);
hold on   
t=plot(r_array,HCD_cell_to_array(:,2) ,'r ','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,3) ,'r ','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,4) ,'r ','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,5) ,'r','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,6) ,'r','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,7) ,'r','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,8) ,'r','LineWidth',2);
plot(r_array,HCD_cell_to_array(:,9) ,'r','LineWidth',2);

%仿真值抽值
inter=1:8:length(r_array);
r_array_inter=zeros(1,length(inter));
HCD_simu_cell_to_array_inter=zeros(length(inter),size(HCD_simu_cell_to_array,2));
for i=1:length(inter)
    r_array_inter(i)=r_array(inter(i));
    HCD_simu_cell_to_array_inter(i,:)=HCD_simu_cell_to_array( inter(i),:);
end
    
s=plot(r_array_inter,HCD_simu_cell_to_array_inter(:,2) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,3) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,4) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,5) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,6) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,7) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,8) ,'k:','LineWidth',2);
plot(r_array_inter,HCD_simu_cell_to_array_inter(:,9) ,'k:','LineWidth',2);

le=legend([t,s] ,'Pr(H=h)','Q(H=h)'   ); %,  'Location','northeast'
set(le,'FontSize',11,'Position',[0.26 0.87 0.18  0.05 ],'Orientation','horizon')

%画圈圈、标字
rectangle('Position',[4,0.1,0.05,0.1 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 4.05,0.1 ,'h=1','FontSize',14)
rectangle('Position',[3.7,0.3,0.05,0.1 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 3.75,0.29 ,'h=2','FontSize',14)
rectangle('Position',[3.6,0.45,0.05,0.1 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 3.65,0.55 ,'h=3','FontSize',14)
rectangle('Position',[2.8,0.35,0.05,0.1 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 2.85,0.45 ,'h=4','FontSize',14)
rectangle('Position',[2.3,0.28,0.04,0.08 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 2.36,0.35 ,'h=5','FontSize',14)
rectangle('Position',[2.25,0.07,0.15,0.02 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',1)
text( 2.4 ,0.1 ,'h=6','FontSize',10)


box on
grid on
xlim([r_array(1)-0.01,4.4 ]); 
ylabel('Probability','FontSize',14); 
set(gca,'FontSize',14); 
title('(a)','FontSize',11)

%%%----------------------------------------------------第二幅子图----------------------------------------------%%

subplot(2,1,2);
hold on

%误差值抽值
inter=1:4:length(r_array);
r_array_inter=zeros(1,length(inter));
KL_cell_to_array_inter=zeros(length(inter),size(KL_cell_to_array,2));
for i=1:length(inter)
    r_array_inter(i)=r_array(inter(i));
    KL_cell_to_array_inter(i,:)=KL_cell_to_array( inter(i),:);
end

plot( (KL_cell_to_array(:,4))' );
h1=plot(r_array_inter,KL_cell_to_array_inter(:,2),'Color','k','LineStyle',':'  ,'Marker','*' ,'MarkerSize',4, 'MarkerEdgeColor','r');
h2=plot(r_array_inter,KL_cell_to_array_inter(:,3),'Color','k','LineStyle',':'  ,'Marker','o' ,'MarkerSize',4, 'MarkerEdgeColor','m');
h3=plot(r_array_inter ,KL_cell_to_array_inter(:,4),'Color','k','LineStyle',':' ,'Marker','+' ,'MarkerSize',4, 'MarkerEdgeColor',[0.00,0.45,0.74]);
h4=plot(r_array_inter,KL_cell_to_array_inter(:,5),'Color','k','LineStyle',':'  ,'Marker','s' ,'MarkerSize',4, 'MarkerEdgeColor',[0.64 0.08 0.18]);
h5=plot(r_array_inter,KL_cell_to_array_inter(:,6),'Color','k','LineStyle',':'  ,'Marker','^' ,'MarkerSize',4 , 'MarkerEdgeColor','k');
h6=plot(r_array_inter,KL_cell_to_array_inter(:,7),'Color','k','LineStyle',':'  ,'Marker','p' ,'MarkerSize',4, 'MarkerEdgeColor','b');
h7=plot(r_array_inter,KL_cell_to_array_inter(:,8),'m');
h8=plot(r_array_inter,KL_cell_to_array_inter(:,9),'k');
 

hold on 
hs1=plot(r_array,KL_array_r  ,'r-','LineWidth',3 );
set(gca,'FontSize',14); 
xlabel('r','FontSize',14);
ylabel('$$\Pr(H=h)\frac{\Pr(H=h)}{Q(H=h)}$$','FontSize',12,'Interpreter','latex'); 
box on
grid on
xlim([r_array(1)-0.01,4.4 ]);
ylim([-0.015,0.03]);
  
le1=legend([h1,h2,h3,h4],'h=1',' h=2' ,'h=3 ','h=4',  'Location',[0.105 -0.075 1 1]);
set(le1,'FontSize',13,'Orientation','horizon','Box','off');
%画图例外框
rectangle('Position',[2.68, 0.017,1.68,0.012 ] ,'Edgecolor','k' ) 
%画D_KL标志，配上文字
rectangle('Position',[2.45,0.0028,0.03,0.006 ],'Curvature',[1,1],'Edgecolor','r','LineWidth',2)
text( 2.4,0.011 ,'$$D_{KL}$$','FontSize',14,'Interpreter','latex')

set(gcf,'unit','centimeters','position',[10 5 15 10]);
title('(b)','FontSize',11)
 
ah=axes('position',get(gca,'position'),'visible','off');
le2=legend(ah,[h5,h6,h7,h8],'h=5',' h=6' ,'h=7 ','h=8',    'Location',[0.105 -0.11 1 1]);
set(le2,'FontSize',13,'Orientation','horizon','Box','off');

set(gcf,'unit','centimeters','position',[10 5 15 11.8]);

