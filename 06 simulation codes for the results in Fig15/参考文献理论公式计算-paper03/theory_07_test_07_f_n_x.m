%对参考文献 On the hop count statistics for randomly deployed wireless sensor networks 进行仿真验证
%理论公式计算
%文章给出的结论： f_n_x 的计算公式。即，给定S-D间距，分析跳数分布
%在它的基础上，我加入S-D间距的概率密度分布函数即可。

%x是S-D间距，R是通信半径，lamda是节点密度,radius是网络半径，在PPP里不存在
function f_n_x_array= theory_07_test_07_f_n_x(x,R,lamda,radius,N_delta,way_id)

    f_n_x_array=zeros(1, ceil(radius*2/R)*2);
    %当x<=R,一跳即可到达,跳数为1的概率是1，跳数为其它值得概率是0
    if( x<= R)
        f_n_x_array(1)=1;
        return;
    end
    %当R<x<=2R，可能会2跳到达，其概率值
    if (x>R)&&(x<=2*R)
        %计算交叉区域面积
        S_A=func_02_intersecting_area(x,R,R);
        %计算交叉区域中有n个节点的概率
        p_nA=func_01_prob_n_in_A(lamda,0,S_A);        
        f_n_x_array(2)=1-p_nA;
        
        %也可能3跳、4跳,......,分别计算对应的概率值
        %N_delta=50;  
        for n=3:length( f_n_x_array )
            %给定x,n,lamda,R,计算 跳数取值为n时的对应概率值。根据公式22
	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
            f_n_x_array(n)=f_n_x;
        end                    
        return;
    end
    %当x>2R
    if x>2*R
        %可能3跳、4跳,......,分别计算对应的概率值        
        for n=3:length( f_n_x_array )
            %给定x,n,lamda,R,计算 跳数取值为n时的对应概率值。根据公式22
	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
            f_n_x_array(n)=f_n_x;
        end                    
        return;        
    end
end

%基于PPP计算区域A中有n个节点的概率.lamda是节点密度,S_A是区域A的面积
function p_nA=func_01_prob_n_in_A(lamda,n,S_A)
    f1=power(lamda*S_A,n); f2=factorial(n);
    %当n 较大，f1与f2可能会被记录为inf，在matlab中inf/inf=NaN，所以用循环进行计算
    if  isinf(f1)|| isinf(f2)
        f3=1;
        for i=1:n
            f3=f3*lamda*S_A/i;
        end
        p_nA=exp(-lamda*S_A)*f3;
    else
        p_nA= exp(-lamda*S_A)*power(lamda*S_A,n)/factorial(n); 
    end    
end

%计算间距为x,半径分别是R1 R2的两个圆交叉区域的面积
function S=func_02_intersecting_area(x,R1,R2)
    
    %如果两圆间距大于半径之和，交叉区域面积是0
    if (R1+R2<=x)
        S=0;
        return;
    end
    
    %如果两圆是包涵关系
    if (( R2>=x+R1 ) || ( R1>=x+R2 ))
        R_min=min(R2,R1);
        S=pi*R_min^2;
        return;
    end
    
    %如果两圆相交
    theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
    phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
    S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));
end

%方法2中，给定参数 x(k-1) , a(k-1),rho , R1,R2,计算A3(图9中的阴影面积).
%作者没有给出A3的计算公式,我后面可能要用蒙特卡罗仿真进行计算
function A3_area= func_03_A3_area( x_k_1,a_k_1,rho,R1,R2)    
    A3_area=zeros(1,length(rho));
end


%方法2中，给定x(k-1),a(k-1),计算rho_max（图9中夹角取值的最大值）,R是通信半径，delta是分割区间的长度
function rho_max=func_04_rho_max_in_way2( x_k_1,a_k_1,R,delta)
    x_k_2=x_k_1-a_k_1;
    xk2=x_k_2*delta; xk1=x_k_1*delta; 
    rho_max=acos( (xk2^2+xk1^2-R^2)/(2*xk2*xk1) );
end

%方法2中，给定x(k-1),a(k-1),a(k),rho_max,计算 ksai(a_k|x_k_1,a_k_1),这个
%值是给定x(k-1),a(k-1)之后最大前进距离取值为a(k)的概率，涉及到积分
function ksai_ak= func_05_ksai_ak_in_way2( x_k_1,a_k_1,a_k,R,delta, rho_max,lamda)

    %积分区间
    rho_delta=0.02;
    rho= 0+rho_delta*( rho_max-0):   rho_delta*( rho_max-0)  : rho_max-rho_delta*( rho_max-0);
    
    %对于一组rho, A_j_1, A_j的计算
    xk1=x_k_1* delta;  
    x_k_2= x_k_1+a_k_1; xk2=x_k_2*delta;
    R_j= x_k_1-a_k+1; Rj=R_j*delta;
    R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;    
    Aj1= func_02_intersecting_area(xk1,R,Rj1)- func_03_A3_area( xk2,xk1,rho,R,Rj1) ;
    Aj = func_02_intersecting_area(xk1,R,Rj )- func_03_A3_area( xk2,xk1,rho,R,Rj ) ;
    
    yita_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
    
    ksai_ak=  2* sum(  yita_ak*1/(2*rho_max)* rho_delta*( rho_max-0) );
end

%方法1中，给定x(k-1),a(k-1)，计算ksai(a_k|x_k_1,a_k_1)
function ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda)
    xk1=x_k_1*delta;
    R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;
    R_j=x_k_1-a_k+1; Rj= R_j  *delta;
    Aj1=func_02_intersecting_area(xk1,R,Rj1);
    Aj = func_02_intersecting_area(xk1,R,Rj );
    
    ksai_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
end

% 给定 x(k-1), a(k-1)计算 前进距离取值为 a(k)的概率,N_delta是R分段的个数
function f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)

    %如果用方法1计算f_ak
    if way_id==1
       if a_k <=N_delta
           ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda);
           f_ak=ksai_ak;
       else
           f_ak=0;
       end
       return;
    end
    
    %如果用方法2计算f_ak
    if way_id==2
        if a_k<=N_delta
            rho_max=func_04_rho_max_in_way2( x_k_1,a_k_1,R,delta);
            ksai_ak= func_05_ksai_ak_in_way2( x_k_1,a_k_1,a_k,R,delta, rho_max,lamda);
            f_ak=ksai_ak;
        else
            f_ak=0;
        end
       return;
    end
end

%给定k,计算 f(x(k),a(k))联合概率密度
function f_xk_ak= func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
    if k==1
        %func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
        f_ak= func_07_f_ak( x, 0, a_k, R,lamda,delta,way_id,N_delta);
        f_xk_ak=f_ak;
    else
        f_xk_ak=0;
        a_k_1_array=0: 1:N_delta;
       for i=1:length(a_k_1_array)
           a_k_1=a_k_1_array(i);            
           x_k_1=x_k+a_k;
           %f_xk_ak= func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
           f_xk1_ak1=func_08_f_xk_ak(k-1,x_k_1,a_k_1,x,R,lamda,delta,way_id,N_delta);
           %func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
           f_ak=func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta);
           f_xk_ak=  f_xk_ak+ f_xk1_ak1*f_ak;
       end
    end
end

%给定x,n,lamda,R,计算 跳数取值为n时的对应概率值。根据公式22
function f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius)

    f_n_x=0;
    delta=R/N_delta;
    x_n_1_array=0:1:N_delta; a_n_1_array=0:1:N_delta;
    
    for i=1:length( x_n_1_array)
        x_n_1=x_n_1_array(i);
        for j=1:length( a_n_1_array)
            a_n_1=a_n_1_array(j);
            %给定k,计算 f(x(k),a(k))联合概率密度, func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
            f_xn1_an1= func_08_f_xk_ak(n-1,x_n_1,a_n_1,x,R,lamda,delta,way_id,N_delta);
            f_n_x=f_n_x+f_xn1_an1;
        end
    end

end
 