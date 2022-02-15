%给定参考节点PR与网络中心o的距离v0，计算BPP模型下跳数分布
function [is_connected,hops_distri_simu_v0 ]= simu_03_hops_distri_once_v0_given(R,N,r,v0  )
    
    %SN的横、纵坐标
    theta=rand*2*pi;
    x=v0*cos(theta); y=v0*sin(theta);
    
    %生成节点横纵坐标
    [X,Y]=simu_01_nodes_XY_generate(0,R,N); X(1)=x; Y(1)=y;  
 

    %disMatrix(N,N)，其中disMatrix(i,j)记录节点i与节点j之间的距离，求网络节点间的邻接矩阵adjMatrix
    [~,adjMatrix]=simu_02_netTop_dis_adj_matrix(X,Y,r);
 

    %网络最大子图初始化（最初只包含源节点在netTop中的id号）
    sub_graph=1;  points_array=[1];
    while( length(sub_graph)<N)
        %遍历subgraph中的每个节点，将这些节点的邻居节点求并集，得到node_add
        node_add=[];
        for i=1:length(sub_graph)
            node_id=sub_graph(i);
            node_add=union(node_add, find( adjMatrix(node_id,:)==1));
        end
        %将node_add与sub_graph求并集，得到新生成的子图，子图中增加的元素个数为new_add_num
        sub_graph=union(sub_graph,node_add);
        new_add_num= length(sub_graph)-sum(points_array);
        %new_add_num=length(node_add);
        %如果新增元素个数不为0，将新增元素个数存储，否则，结束sub_graph的生成
        if new_add_num>0
            points_array=[points_array,new_add_num];
        else
            break;
        end
    end  %子图的迭代生成
    if sum(points_array)==N
        is_connected=1;
    else
        is_connected=0;
    end
    
     points_array=points_array(2:end);
    hops_distri_simu_v0=points_array/N;

    %中间结果显示
%     points_array=points_array
%     a=sum(points_array)
end 



%     if nargin==0
%         
%         %func03_net_top_plot(netTop )
%         
%         shortestDist = func05_netTop_to_graph(netTop);
%         a=shortestDist(:);
%         b=a(a~=0);
%         c=b(b~=inf);
%         c_distri= tabulate( c') ;
%         hops_distri_simu=c_distri(:,3)'/100;
%         if length(c)==length(b)
%             is_connected=1;
%         else
%             is_connected=0;
%         end
%     end            
% end
