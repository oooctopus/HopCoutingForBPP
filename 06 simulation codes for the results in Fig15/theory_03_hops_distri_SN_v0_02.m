% 基于PPP网络下的等效圆环，计算BPP模型下 给定参数v时的跳数分布 v是参考节点PR同网络中心的距离
%这份文件是 theory_03_hops_distri_SN_v0.m 文件的修改版本
%主要是对子函数  func_01_hops_distri_SN_center(R,r,N,delta,v0)  进行 修改
% func_01_hops_distri_SN_center(R,r,N,delta,v0)
% 不需要输入节点总个数N，以及网络半径R，但是需要输入节点密度pho以及源节点与圆心之间的距离v0

function hops_distri_v= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) 

    
    [ ri_array,ro_array]=func_01_hops_distri_SN_center(R,r,N,delta,v0);
    %计算每一跳节点分布区域的等效面积
    Ah_array_BPP= zeros(1,length(ro_array ) );

    for i=1:length(Ah_array_BPP)
        ri=ri_array(i );
        ro=ro_array(i );
        Ah_array_BPP(i)=func_02_IB2(v0,R,ro) - func_02_IB2(v0,R,ri);
    end
    hops_distri_v=Ah_array_BPP/(pi*R^2);
   
 
      
end

function [ ri_array,ro_array]=func_01_hops_distri_SN_center(R,r,N,delta,v0)

% N=N*(R+v0)^2/R^2;
% R=R+v0;

%建立存储数组，等效圆环内径、外径、面积，节点平均个数
ri_array=zeros(1, ceil(4*R/r) ); ro_array=zeros(1, ceil(4*R/r) ); 
A_array=zeros(1, ceil(4*R/r) ); n_array=zeros(1, ceil(4*R/r) );
%数据初始化 
ri=0;ro=r; A=pi*(ro^2-ri^2); n=(N/(pi*R^2)*A );   i=1;
ri_array(i)=ri;ro_array(i)=ro;A_array(i)=A;n_array(i)=n;

while 1
     
    %已知节点所在圆环的内径ri和外径ro,传输半径r，节点个数n，网格维度L，场景生成个数loop
    %基于loop个场景求扩展区域平均面积
    [A2,n2,ri_2,ro_2]=theory_01_Ah_nh_v0(R,r,N,ri,ro,delta); 
    %记录数据
    i=i+1;
    if(abs(ro_2-ro_array(end))<0.0002)
        break;
    end
    if ro_2<v0+R-0.0001       
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2;
        n_array(i)=n2;
        ri=ri_2;ro=ro_2;
    else
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2 ;
        n_array(i)=n2;         
        break;%终止循环
    end
    
end

%     hop_distri_theory_v0_0=n_array/N;
    
%     %画图
%     hold on
%     x=v0;y=0;
%     for i=1:length(ri_array)
%         plot_01_circle(x,y,ri_array(i));
%         plot_01_circle(x,y,ro_array(i));
%     end
%     R=R-v0;
%     plot_01_circle(0,0,R );
%     axis equal
    
end

%计算间距为x,半径分别是R1 R2的两个圆交叉区域的面积,以及两圆之间的位置关系
%pos_relation=1, 圆1内含圆2; 2, 圆2内含圆1; 3, 圆1与圆2相交; 4 两圆相离
function  S =func_02_IB2(x,R1,R2)    
    
    %如果x是一个数值
    if length(x)==1
        %如果圆1内含圆2 或者 圆2内含于圆1 
        if ( abs(R1-R2)>=x )
            R_min=min(R1,R2);
            S=pi*R_min^2;      
            return;
        end                       
        %如果两圆相交
        if (abs(R1-R2)<x)&&(x<R1+R2 )  
            theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
            phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
            S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));     
        end
        %如果两圆间距大于半径之和，交叉区域面积是0，两圆相离
        if (R1+R2<=x)
            S=0;
            return;
        end
    end
    
    %如果x是一个数组
    if length(x)>1
        
        S=zeros(1,length(x));
        
        %记录 abs(R1-R2)>=x 的逻辑位置,此时两圆是内含的关系
        In= ( x<= abs(R1-R2) );
        %记录 (abs(R1-R2)<x)&&(x<R1+R2 ) 的逻辑位置，此时两圆相交
        Se= ((abs(R1-R2)<x)&(x<R1+R2 ));
        %记录 R1+R2<=x 的逻辑位置，此时两圆相离
        Le= (R1+R2<=x);
        
        %若两圆是内含关系
        R_min=min(R1,R2); S(In)=pi*R_min^2;  
        %若两圆是相交关系
        theta=zeros(1,length(x)); phi=zeros(1,length(x));
        theta(Se)= acos( (power(x(Se),2)+R1^2-R2^2)./(2.*x(Se).*R1) );
        phi(Se) = acos( (power(x(Se),2)+R2^2-R1^2)./(2.*x(Se).*R2) );
        S(Se)=R1^2.*theta(Se)+R2^2.*phi(Se)-1/2.*sqrt((power(R1+R2,2)-power(x(Se),2)).*(power(x(Se),2)-power(R1-R2,2))); 
        %若两圆是相离关系
        S(Le)= 0;                                
    end            
end
 

    