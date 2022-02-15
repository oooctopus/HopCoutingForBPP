%跳数分布计算--SN在圆心

% R网络半径，r传输半径，N网络节点总个数，SN位置v0
% R=10;r=3;N=300;v0=0;
%依据AN_(h-1)节点的个数和分布区域，估计AN_(h)节点分布区域的平均面积
 
function [hop_distri_theory_v0_0,A_array,n_array,ri_array,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta)

%建立存储数组，等效圆环内径、外径、面积，节点平均个数
ri_array=zeros(1, ceil(2*R/r) ); ro_array=zeros(1, ceil(2*R/r) ); 
A_array=zeros(1, ceil(2*R/r) ); n_array=zeros(1, ceil(2*R/r) );
%数据初始化 
ri=0;ro=r; A=pi*(ro^2-ri^2); n=(N/(pi*R^2)*A );   i=1;
ri_array(i)=ri;ro_array(i)=ro;A_array(i)=A;n_array(i)=n;


while 1
     
    %已知节点所在圆环的内径ri和外径ro,传输半径r，节点个数n，网格维度L，场景生成个数loop
    %基于loop个场景求扩展区域平均面积
    [A2,n2,ri_2,ro_2]=theory_01_Ah_nh(R,r,N,ri,ro,delta); 
     
    %记录数据
    i=i+1;
    if(abs(ro_2-ro_array(end))<0.0002)
        break;
    end
    if ro_2<R-0.0001   
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2;
        n_array(i)=n2;
        ri=ri_2;ro=ro_2;
%         plot_03_circle_color(0,0,ro_2,color,width )
    else        
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2 ;
        %n_array(i)=N-sum(n_array);  
        n_array(i)=n2;
%         ro_array(i)=R;
%         A_array(i)=pi*(R^2-ri_2^2) ;
%         %n_array(i)=N-sum(n_array);  
%         n_array(i)=N*pi*(R^2-ri_2^2)/(pi*R^2);
%         plot_03_circle_color(0,0,ro_2,color,width )
        break;%终止循环
    end
    
end

    hop_distri_theory_v0_0=n_array/N;
    %hop_distri_theory_v0_0=A_array/(pi*R^2);
    
end