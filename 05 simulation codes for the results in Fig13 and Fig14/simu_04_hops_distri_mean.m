%�������ƽ������
%û�����Ӻ��� simu_03_netTop_toGraph
function hops_distri_simu_mean=simu_04_hops_distri_mean(R,N,r,loop,v0)

%SN�ĺᡢ������
theta=rand*2*pi;
x=v0*cos(theta); y=v0*sin(theta);

j=1;
%ͳ��loop�������������ֲ�
hops_distri_array=zeros( loop  , 2* ceil(R/r) );
while(j<=loop)
    j=j
    
    %���ɽڵ��������
%     [X,Y]=simu_01_nodes_XY_generate(0,R,N); X(1)=x; Y(1)=y;
%     [shortestDist,connect] = simu_03_netTop_toGraph(X,Y,r); 
    [connect,hops_distri_simu_v0 ]= simu_03_hops_distri_once_v0_given(R,N,r,v0  );
    
    %������ɵ�ͼ����ͨͼ
    if connect==1
% %         SN_DN_hops=shortestDist(1,:);
% % %         SN_DN_hops=shortestDist(:);
% %         max_dis=max(SN_DN_hops);
% %         hops_array=zeros(1,max_dis);
% %         for i=1:max_dis
% %             hops_array(i)=length( find( SN_DN_hops==i) );
% %         end
        hops_length=length(hops_distri_simu_v0);
        hops_distri_array(j,1:hops_length)=hops_distri_simu_v0;  
                     
        j=j+1;
    end
end
hops_distri_array=sum(hops_distri_array,1)/loop;
hops_array_length=max( find( hops_distri_array>0) );
hops_distri_simu_mean=hops_distri_array(1:hops_array_length);
end

 