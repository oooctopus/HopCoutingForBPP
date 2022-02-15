%给定节点传输半径r，已知 n1个节点在圆（o,r)内随机均匀分布，求n1个节点的扩展区域的面积,N+1 * N+1是点阵维度

function s_A2_simu=simu_02_A2(ri,ro,r,n1,N)

    %生成n1个AN1节点的坐标,X为其横坐标，Y为其纵坐标    
    [X,Y]=simu_01_nodes_XY_generate(ri,ro,n1);    
    
   
    %在正方形(o,4*r,4*r)中生成均分点阵，N等分,点阵 (N+1)*(N+1)维,点阵PX PY分别是点阵横纵纵坐标
    %N=500; 
    PX=-(ro+r): 2*(r+ro)/N :(ro+r) ;   
    PY=-(ro+r): 2*(r+ro)/N :(ro+r) ; PY=PY';
    l_x=length(PX); l_y=length(PY) ;
    PX_array=repmat(PX, l_y ,1);
    PY_array=repmat(PY, 1 ,l_x);
    
    flag_array_sum=zeros(N+1,N+1);
    %对于第i个AN1节点，求点阵中所有点与其距离，距离小于r，则被覆盖，则标记为1；
    %遍历所有AN1节点，将所有标记数组求和，所有大于1的标记，对应的点，在区域A2内
    for i=1:n1
        flag_array=zeros(N+1,N+1);
        x=X(i);y=Y(i);
        dis_array=sqrt(power(PX_array-x,2)+power(PY_array-y,2));
        flag_array(dis_array<r)=1;
        flag_array_sum=flag_array_sum+flag_array;
    end
    %将大于等于1的标记置1
    flag_array_sum(flag_array_sum>=1)=1;

    %求圆心O覆盖的点
    flag_array=zeros(N+1,N+1);
    dis_array=sqrt(power(PX_array-0,2)+power(PY_array-0,2));
    flag_array(dis_array<ro)=1;

    %从A2中剔除A1覆盖的点
    A2_P_flag=flag_array_sum-flag_array;
    %将小于0的部分置0
    A2_P_flag(A2_P_flag<0)=0;
    %总共有A2_N个点被覆盖
    A2_N=sum(A2_P_flag(:));
    %A2区域面积
    s_A2_simu= 2*(r+ro)*2*(r+ro)*( A2_N/((N+1)*(N+1)) ) ;
     
end
