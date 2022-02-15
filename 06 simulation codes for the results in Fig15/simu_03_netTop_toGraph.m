%根据netTop生成随机图 ，基于随机图计算任意两节点间最短跳数路径长度
%根据netTop信息生成对应的随机图g 
%shortestDist是任意两节点间的最短路径长度
function  [shortestDist,connect] = simu_03_netTop_toGraph(X,Y,r)

    %网络节点总个数
    N=length(X);                                                       
    
    %生成N*2维数组XY，存储N个节点的横纵坐标，第一列是横坐标，第二列是纵坐标
    XY=zeros(N,2);
    %在指定区域中生成N个节点并完成节点初始化
    for i=1:N               
            XY(i,1)=X(i);
            XY(i,2)=Y(i);      
    end

    %利用节点坐标数组生成图
    g=graph(N);
    embed(g,XY);
    
    %disMatrix是 N*N维矩阵，adjMatrix是邻接矩阵
    %其中disMatrix(i,j)记录节点i与节点j之间的距离
    %如果节点间距大于du，则两节点不连通
    [~,adjMatrix]=simu_02_netTop_dis_adj_matrix(X,Y,r);
    
    %根据邻接矩阵为图g加边
    for i=1:size(adjMatrix,1)
        for j=1:i
            if adjMatrix(i,j)==1
                add(g,i,j);
            end
        end
    end
    
    %%重新绘制图g
    %clf;
    %ndraw(g);   
    
    %求任意两点间的最短路径
    shortestDist=dist(g);    
    
    %isconnected(g)判断是否是连通图
    connect=isconnected(g);
    
    free(g);

end
