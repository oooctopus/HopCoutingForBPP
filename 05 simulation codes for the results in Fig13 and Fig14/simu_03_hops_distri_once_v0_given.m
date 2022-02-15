%�����ο��ڵ�PR����������o�ľ���v0������BPPģ���������ֲ�
function [is_connected,hops_distri_simu_v0 ]= simu_03_hops_distri_once_v0_given(R,N,r,v0  )
    
    %SN�ĺᡢ������
    theta=rand*2*pi;
    x=v0*cos(theta); y=v0*sin(theta);
    
    %���ɽڵ��������
    [X,Y]=simu_01_nodes_XY_generate(0,R,N); X(1)=x; Y(1)=y;  
 

    %disMatrix(N,N)������disMatrix(i,j)��¼�ڵ�i��ڵ�j֮��ľ��룬������ڵ����ڽӾ���adjMatrix
    [~,adjMatrix]=simu_02_netTop_dis_adj_matrix(X,Y,r);
 

    %���������ͼ��ʼ�������ֻ����Դ�ڵ���netTop�е�id�ţ�
    sub_graph=1;  points_array=[1];
    while( length(sub_graph)<N)
        %����subgraph�е�ÿ���ڵ㣬����Щ�ڵ���ھӽڵ��󲢼����õ�node_add
        node_add=[];
        for i=1:length(sub_graph)
            node_id=sub_graph(i);
            node_add=union(node_add, find( adjMatrix(node_id,:)==1));
        end
        %��node_add��sub_graph�󲢼����õ������ɵ���ͼ����ͼ�����ӵ�Ԫ�ظ���Ϊnew_add_num
        sub_graph=union(sub_graph,node_add);
        new_add_num= length(sub_graph)-sum(points_array);
        %new_add_num=length(node_add);
        %�������Ԫ�ظ�����Ϊ0��������Ԫ�ظ����洢�����򣬽���sub_graph������
        if new_add_num>0
            points_array=[points_array,new_add_num];
        else
            break;
        end
    end  %��ͼ�ĵ�������
    if sum(points_array)==N
        is_connected=1;
    else
        is_connected=0;
    end
    
     points_array=points_array(2:end);
    hops_distri_simu_v0=points_array/N;

    %�м�����ʾ
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
