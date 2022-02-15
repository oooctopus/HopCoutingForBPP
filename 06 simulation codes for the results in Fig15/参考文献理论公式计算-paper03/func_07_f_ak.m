 

function f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)

    %如果用方法1计算f_ak
    if way_id==1
       if a_k <=N_delta
           % ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda)
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