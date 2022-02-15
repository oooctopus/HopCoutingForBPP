%���㲢�洢�������ڵ�֮��ľ��� �����N���ڵ㣬������N*Nά����
%disMatrix(N,N)������disMatrix(i,j)��¼�ڵ�i��ڵ�j֮��ľ���
function [disMatrix,adjMatrix]=simu_02_netTop_dis_adj_matrix(X,Y,r)
    
    %�ڵ����    
    num=length(X);
    %���������ʼ��    
    disMatrix=zeros(num,num);
    
    %�����������ڵ����룬�洢��disMatrix��
    for i=1:num
        %��i���ڵ�
        xi=X(i);yi=Y(i);  
        for j=1:num
            %��j���ڵ�
            xj=X(j);yj=Y(j);
            disMatrix(i,j)=sqrt(power(xi-xj,2)+power(yi-yj,2));
        end
    end
    
    %����ڵ������r�������ڵ㲻��ͨ,�ڽӾ���
    adjMatrix =disMatrix;
    adjMatrix(adjMatrix>r )=0;
    adjMatrix(adjMatrix>0)=1; 
    
end