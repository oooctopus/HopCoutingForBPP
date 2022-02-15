%递归计算 f(xk,ak)耗时较长，每一个k值对应一组概率密度存储数组f_xk_ak_array；
%k在 1,2,3,....,n-1上取值，将这n-1个k值对应的f_xk_ak_array存储在cell数组中，
%计算f(n|x)时可以随时调用

%给定k,计算 f(x(k),a(k))联合概率密度
%n_max是跳数最大值（自行设置，但必须大于1）,x是S-D实际距离,R是通信半径,lamda是节点密度, 
%delta是间距分割单位,way_id是f_xk_ak_array计算方法(1,2),
function f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id)
    f_xk_ak_array_cell=cell( 1, n_max-1);
    if n_max<=1
        disp('n_max should be greater than 1');
    else
        k=1;  %f_x1_a1_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,[]);
        %f_x1_a1_array= func_08_f_xk_ak_02_ak_range(k,x,R,lamda,delta,way_id,N_delta,[]);
        f_x1_a1_array= func_08_f_xk_ak_03_k1_to_k(k,x,R,lamda,delta,way_id,N_delta,[]);
        f_xk_ak_array_cell{1,1}=f_x1_a1_array;
        for k=2:n_max-1
            f_xk1_ak1_array=f_xk_ak_array_cell{1,k-1};
            %f_xk_ak_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array)
            %f_xk_ak_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array);
            %f_xk_ak_array= func_08_f_xk_ak_02_ak_range(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array);
            f_xk_ak_array= func_08_f_xk_ak_03_k1_to_k(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array);
            f_xk_ak_array_cell{1,k}=f_xk_ak_array;
        end
    end
end
            
        






