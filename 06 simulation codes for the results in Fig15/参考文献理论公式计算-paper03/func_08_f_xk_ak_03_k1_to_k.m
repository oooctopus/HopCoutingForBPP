%����k,���� f(x(k),a(k))���ϸ����ܶ�
%k�ǵ�k���׶ε�״̬,x��S-Dʵ�ʾ���,R��ͨ�Ű뾶,lamda�ǽڵ��ܶ�, 
%delta�Ǽ��ָλ,way_id��f_xk_ak_array���㷽��(1,2),
%f_xk1_ak1_array��f_xk_ak_array�ǵ�k-1���׶ζ�Ӧ״̬�����ϸ����ܶȴ洢����(k>1ʱ����)
function f_xk_ak_array= func_08_f_xk_ak_03_k1_to_k(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array)
    
    %disp(['N_delta=',num2str(N_delta)]);

    %x(k)��0,1,2,...,ceil(x/delta)��ȡֵ,a(k)��0,1,2,...,N_delta��ȡֵ
    xk_array=0:1:ceil(x/delta); ak_array=0:1:N_delta;
    %����f_xk_ak_array����,�洢ÿһ�� x(k),a(k)��Ӧ�µ����ϸ����ܶ�ֵ.�����к��кŷֱ�����
    rowNum=length(xk_array); colNum=length(ak_array);
    f_xk_ak_array=zeros(rowNum,colNum);
    %��Ϊ x(k)=x(k-1)-a(k) ,����x(k)��ȡֵ��a(k)��ȡֵ����һ��������ԣ�
    %x(k)����һ����ȡ�� [0,ceil(x/delta)]�ϵ�ÿһ��ֵ��
    %����f( x(k), a(k))�ľ�������������
    x0=xk_array(end); a0=0;    
    if k==1
        for i=1:length(ak_array)
            ak=ak_array(i); ak_col=ak+1;
            xk=x0-ak;       xk_row=xk+1;
            %���ݸ�����xk,ak����f(xk,ak),������洢��f_xk_ak_array�ĵ�xk_row�е�ak_col��
            %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
            f_xk_ak_array(xk_row,ak_col)=real ( func_07_f_ak( x0, a0, ak, R,lamda,delta,way_id,N_delta) );
        end
    end
    if k>1
        %xk1ȡֵ������xkȡֵ����һ�£�Ϊxk_array. ak1ȡֵ����ͬak,Ϊak_array
        %��0<=xk1<=N_deltaʱ,ak=xk1;��N_delta<xk1<ceil(x/delta)ʱ,ak=0,1,...,N_delta;
        xk1_array=xk_array; ak1_array=ak_array;
        for i=1:length(xk1_array)
            xk1=xk1_array(i);
            
%             if xk1==0    
%                 continue;
%             end
            if  xk1<=N_delta 
                ak=xk1;xk=0; xk_row=xk+1; ak_col=ak+1; xk1_row=xk1+1;
                f_xk_ak_array(xk_row,ak_col)= sum( f_xk1_ak1_array(xk1_row,:));
            else
                 
                for j=1:length(ak_array)
                    ak=ak_array(j); ak_col=ak+1; 
                    xk=xk1-ak; xk_row=xk+1;
                    %Ŀǰ��֪xk1,ak1��0,1,...,N_delta������ȡֵ��ͬak��ȡֵ����һ����
                    for m=1:length(ak1_array)
                        ak1=ak1_array(m);
                        %ak1ȡֵΪak_array(m)ʱ����֪xk1����f(xk1,ak1)=f_xk1_ak1_array(xk1+1,ak1+1)
                        f_xk1_ak1=f_xk1_ak1_array(xk1+1,ak1+1);
                        %if f_xk1_ak1~=0
                        if f_xk1_ak1~=0
                            %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
                            %disp(['xk_row=',num2str(xk_row),',ak_col=',num2str(ak_col) ])
                            f_ak=func_07_f_ak( xk1, ak1, ak, R,lamda,delta,way_id,N_delta);
                            f_xk_ak_array(xk_row,ak_col)= real( f_xk1_ak1*f_ak + f_xk_ak_array(xk_row,ak_col) );
                        end %��� f_xk1_ak1������0
                    end %����xk1,xk,ak,����ak1��ÿһ��ȡֵ,����õ�f(xk,ak)���洢
                end%��N_delta<xk1<ceil(x/delta)ʱ,ak��0,1,...,N_delta��ȡֵ,xkҲ��֮�仯������f(xk,ak)�����洢
            end% 0<=xk1<=N_delta��N_delta<xk1<ceil(x/delta)��
        end%����f_xk1_ak1_array�е�ÿһ��xk1ֵ������xk1�ж�ak��ȡֵ��Χ�������ȡֵ��Χ��ÿһ��xk,ak��Ӧ�ĸ����ܶȣ����洢
%     disp(['f_xk_ak=',num2str(f_xk_ak) ])
%     disp(['---------------------k=',num2str(k),'-----------------------']);
    end
   
end