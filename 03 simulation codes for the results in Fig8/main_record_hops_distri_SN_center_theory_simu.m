%���ݸ����������������ģ������ڵ�����ֲ�����������ƽڵ�ֲ������
%���ݸ��������������������ڵ����۷ֲ����򣬲��������۷ֲ�����ı߽硣
% R����뾶��r����뾶��N����ڵ��ܸ�����L����ά�ȣ��ڵ��ܶ�pho=N/(pi*R^2)����������loop��SNλ��v0
clear;clc;
P=0.9999; R=10;N=300 ;loop=1; v0=0;delta=0.0002;

r=2.7468;
 
%����ÿһ������ڵ����۷ֲ�����
[hop_distri_theory_v0_0,A_array,n_array,ri_array,ro_array ]=theory_02_A_h_rio_hops_distri(R,r,N,delta);
%
[hops_distri_simu_v0_0,X,Y,node_h_cell]=simu_04_hops_distri_mean(R,N,r,loop,v0);
 
%�����в����Լ�������������ָ���ļ���
t=datestr(clock,'mm_dd_HH_MM');
filePath=[ t,'_plot_nodes_and_ro' ,'.mat'];
save(filePath);

%���Ƽ���õ�������ڵ㻷�����۷ֲ�����
figure('Color','white');
hold on
color='b';width=1; 
for i=1:length(ro_array)       
      hold on
      hs_ro(i)=plot_03_circle_color(0,0,ro_array(i),[0.49 0.49 0.49],1) %[0 0.45 0.74]
end 
 
color_array=[1 0.6 0.78;1 0.84 0;0.3 0.75 0.39;1,0.6,0.78;0.7 0.7 0.7;0.3,0.75,0.93];
%���Ʒ���õ�������ڵ�����ֲ����
for i=1:size(node_h_cell,2)
    color=color_array(mod(i,7)+1,:);
    node_h=node_h_cell{i};
    for j=1:length(node_h)
        node_id=node_h(j);  
%         hs(i)=plot(    X(node_id),   Y(node_id) ,  '+','MarkerSize',3,'MarkerEdgeColor',color,'LineWidth',1 ,'MarkerFaceColor',color); %,'MarkerFaceColor',color
hs(i)=plot(    X(node_id),   Y(node_id) ,  'o','MarkerSize',2.2,'MarkerEdgeColor',color,'LineWidth',1 ,'MarkerFaceColor',color); %,'MarkerFaceColor',color
    end
end
 
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

xlabel('x','FontSize',14);
ylabel('y ','FontSize',14);

set(gca,'xtick',-10:5:10)
set(gca,'ytick',-10:5:10)
set(gcf,'unit','centimeters','position',[10 5 15 10]);
set(gca,'FontSize',14);
axis equal

hs_first=plot(0,0,'ko','MarkerSize',2.5,'MarkerEdgeColor','r','LineWidth',1,'MarkerFaceColor','r');
 
box on
grid on
xlim([-11,11]);
ylim([-11,11]);
  

 