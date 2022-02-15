%����netTop�������ͼ ���������ͼ�����������ڵ���������·������
%����netTop��Ϣ���ɶ�Ӧ�����ͼg 
%shortestDist���������ڵ������·������
function  [shortestDist,connect] = simu_03_netTop_toGraph(X,Y,r)

    %����ڵ��ܸ���
    N=length(X);                                                       
    
    %����N*2ά����XY���洢N���ڵ�ĺ������꣬��һ���Ǻ����꣬�ڶ�����������
    XY=zeros(N,2);
    %��ָ������������N���ڵ㲢��ɽڵ��ʼ��
    for i=1:N               
            XY(i,1)=X(i);
            XY(i,2)=Y(i);      
    end

    %���ýڵ�������������ͼ
    g=graph(N);
    embed(g,XY);
    
    %disMatrix�� N*Nά����adjMatrix���ڽӾ���
    %����disMatrix(i,j)��¼�ڵ�i��ڵ�j֮��ľ���
    %����ڵ������du�������ڵ㲻��ͨ
    [~,adjMatrix]=simu_02_netTop_dis_adj_matrix(X,Y,r);
    
    %�����ڽӾ���Ϊͼg�ӱ�
    for i=1:size(adjMatrix,1)
        for j=1:i
            if adjMatrix(i,j)==1
                add(g,i,j);
            end
        end
    end
    
    %%���»���ͼg
    %clf;
    %ndraw(g);   
    
    %���������������·��
    shortestDist=dist(g);    
    
    %isconnected(g)�ж��Ƿ�����ͨͼ
    connect=isconnected(g);
    
    free(g);

end
