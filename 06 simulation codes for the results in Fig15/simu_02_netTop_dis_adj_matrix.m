%计算并存储任意两节点之间的距离 如果有N个节点，则生成N*N维矩阵
%disMatrix(N,N)，其中disMatrix(i,j)记录节点i与节点j之间的距离
function [disMatrix,adjMatrix]=simu_02_netTop_dis_adj_matrix(X,Y,r)
    
    %节点个数    
    num=length(X);
    %距离数组初始化    
    disMatrix=zeros(num,num);
    
    %计算任意两节点间距离，存储在disMatrix中
    for i=1:num
        %第i个节点
        xi=X(i);yi=Y(i);  
        for j=1:num
            %第j个节点
            xj=X(j);yj=Y(j);
            disMatrix(i,j)=sqrt(power(xi-xj,2)+power(yi-yj,2));
        end
    end
    
    %如果节点间距大于r，则两节点不连通,邻接矩阵
    adjMatrix =disMatrix;
    adjMatrix(adjMatrix>r )=0;
    adjMatrix(adjMatrix>0)=1; 
    
end