%给定x,n,lamda,R,计算 跳数取值为n时的对应概率值。根据公式22
function f_n_x= func_09_f_n_x_01(x,n,R,lamda,N_delta,way_id,radius)
    
     
 
    f_n_x=0;
    delta=R/N_delta;
    x_n_1_array=0:1:N_delta; a_n_1_array=0:1:N_delta;
    
    for i=1:length( x_n_1_array)
        x_n_1=x_n_1_array(i);
        
        test=0;
        for j=1:length( a_n_1_array)
            a_n_1=a_n_1_array(j);
            %给定k,计算 f(x(k),a(k))联合概率密度, func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
            f_xn1_an1= func_08_f_xk_ak(n-1,x_n_1,a_n_1,x,R,lamda,delta,way_id,N_delta);
            f_n_x=f_n_x+f_xn1_an1;
            
            test=test+f_xn1_an1;
%             disp(['x_n_1=',num2str(x_n_1),',a_n_1=',num2str(a_n_1),',f_xn1_an1=',num2str(f_xn1_an1)  ])
        end
%         disp(['--------------------test=',num2str(test),'------------------']);
    end

end