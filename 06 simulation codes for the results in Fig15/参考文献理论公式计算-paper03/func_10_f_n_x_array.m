%x��S-D��࣬R��ͨ�Ű뾶��lamda�ǽڵ��ܶ�,radius������뾶����PPP�ﲻ����
function f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id)

    f_n_x_array=zeros(1, n_max);
    %��x<=R,һ�����ɵ���,����Ϊ1�ĸ�����1������Ϊ����ֵ�ø�����0
    if( x<= R)
        f_n_x_array(1)=1;
        return;
    end
    %��x>R,�����������ܵ���
    %f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id)
    f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id );
    %f_xk_ak_array_cell��1*(n_max-1)άԪ������
    %f(n|x)�ļ���Ҫ�õ� f_xk_ak_array_cell(1,n-1)
    %x(n-1)��0,1,2,...,N_delta��ȡֵʱ,����a(n-1)ȡֵΪ����,��n�����ܵ���target     
    for n=2:n_max
        f_xn1_an1_array=f_xk_ak_array_cell{1,n-1};  
        f_xn1=sum(f_xn1_an1_array,2);
        %f_xn1=f_xn1'
        f_n_x=sum( f_xn1(2:N_delta+1)) ;
        f_n_x_array(n)=f_n_x;
    end
    
end
 


%     %��R<x<=2R�����ܻ�2����������ֵ
%     if (x>R)&&(x<=2*R)
%         %���㽻���������
%         S_A=func_02_intersecting_area(x,R,R);
%         %���㽻����������n���ڵ�ĸ���
%         p_nA=func_01_prob_n_in_A(lamda,0,S_A);        
%         f_n_x_array(2)=1-p_nA;
%         
%         %Ҳ����3����4��,......,�ֱ�����Ӧ�ĸ���ֵ
%         %N_delta=50;  
%         for n=3:length( f_n_x_array )
%             %����x,n,lamda,R,���� ����ȡֵΪnʱ�Ķ�Ӧ����ֵ�����ݹ�ʽ22
% 	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
%             f_n_x_array(n)=f_n_x;
%         end                    
%         return;
%     end
%     %��x>2R
%     if x>2*R
%         %����3����4��,......,�ֱ�����Ӧ�ĸ���ֵ        
%         for n=3:length( f_n_x_array )
%             %����x,n,lamda,R,���� ����ȡֵΪnʱ�Ķ�Ӧ����ֵ�����ݹ�ʽ22
% 	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
%             f_n_x_array(n)=f_n_x;
%         end                    
%         return;        
%     end
