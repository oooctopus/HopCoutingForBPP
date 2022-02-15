%x是S-D间距，R是通信半径，lamda是节点密度,radius是网络半径，在PPP里不存在
function f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id)

    f_n_x_array=zeros(1, n_max);
    %当x<=R,一跳即可到达,跳数为1的概率是1，跳数为其它值得概率是0
    if( x<= R)
        f_n_x_array(1)=1;
        return;
    end
    %当x>R,至少两跳才能到达
    %f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id)
    f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id );
    %f_xk_ak_array_cell是1*(n_max-1)维元胞数组
    %f(n|x)的计算要用到 f_xk_ak_array_cell(1,n-1)
    %x(n-1)在0,1,2,...,N_delta上取值时,不管a(n-1)取值为多少,第n跳总能到达target     
    for n=2:n_max
        f_xn1_an1_array=f_xk_ak_array_cell{1,n-1};  
        f_xn1=sum(f_xn1_an1_array,2);
        %f_xn1=f_xn1'
        f_n_x=sum( f_xn1(2:N_delta+1)) ;
        f_n_x_array(n)=f_n_x;
    end
    
end
 


%     %当R<x<=2R，可能会2跳到达，其概率值
%     if (x>R)&&(x<=2*R)
%         %计算交叉区域面积
%         S_A=func_02_intersecting_area(x,R,R);
%         %计算交叉区域中有n个节点的概率
%         p_nA=func_01_prob_n_in_A(lamda,0,S_A);        
%         f_n_x_array(2)=1-p_nA;
%         
%         %也可能3跳、4跳,......,分别计算对应的概率值
%         %N_delta=50;  
%         for n=3:length( f_n_x_array )
%             %给定x,n,lamda,R,计算 跳数取值为n时的对应概率值。根据公式22
% 	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
%             f_n_x_array(n)=f_n_x;
%         end                    
%         return;
%     end
%     %当x>2R
%     if x>2*R
%         %可能3跳、4跳,......,分别计算对应的概率值        
%         for n=3:length( f_n_x_array )
%             %给定x,n,lamda,R,计算 跳数取值为n时的对应概率值。根据公式22
% 	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
%             f_n_x_array(n)=f_n_x;
%         end                    
%         return;        
%     end
