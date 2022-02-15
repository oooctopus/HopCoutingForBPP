%仿真生成节点坐标
function [X,Y]=simu_01_nodes_XY_generate(ri,ro,n)

    [X,Y]=func_01_nodes_XY_generate(ri,ro,n);
        
    
%     %画图节点分布图
%         hold on
%         plot_01_circle(0,0,ro)
%         hold on
%         plot_01_circle(0,0,ri)        
%         plot(X,Y,'b.')

end

%子函数1，已知内径ri,外径ro,计算节点横纵坐标，
function [X,Y]=func_01_nodes_XY_generate(ri,ro,n)
if ri==0 %如果内径不为0
    angle=rand(1,n)*2*pi; %(0,2*pi)之间均匀分布数据点 
    rx=ro*sqrt(rand(1,n));%（0,1）之间ro ^2均匀分布数据点
    %AN 节点的X Y坐标
    X=rx.*cos(angle);
    Y=rx.*sin(angle);    
else %如果内径为0
    angle = 2*pi*rand(n,1);
    rx = unifrnd(1,(ro/ri)^2,n,1);
    X = ri*sqrt(rx).*cos(angle);
    Y = ri*sqrt(rx).*sin(angle);
end

end