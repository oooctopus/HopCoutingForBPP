%�ݹ���� f(xk,ak)��ʱ�ϳ���ÿһ��kֵ��Ӧһ������ܶȴ洢����f_xk_ak_array��
%k�� 1,2,3,....,n-1��ȡֵ������n-1��kֵ��Ӧ��f_xk_ak_array�洢��cell�����У�
%����f(n|x)ʱ������ʱ����

%����k,���� f(x(k),a(k))���ϸ����ܶ�
%n_max���������ֵ���������ã����������1��,x��S-Dʵ�ʾ���,R��ͨ�Ű뾶,lamda�ǽڵ��ܶ�, 
%delta�Ǽ��ָλ,way_id��f_xk_ak_array���㷽��(1,2),
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
            
        






