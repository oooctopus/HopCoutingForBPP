%����k,���� f(x(k),a(k))���ϸ����ܶ�
%k�ǵ�k���׶ε�״̬,x��S-Dʵ�ʾ���,R��ͨ�Ű뾶,lamda�ǽڵ��ܶ�, 
%delta�Ǽ��ָλ,way_id��f_xk_ak_array���㷽��(1,2),
%f_xk1_ak1_array��f_xk_ak_array�ǵ�k-1���׶ζ�Ӧ״̬�����ϸ����ܶȴ洢����(k>1ʱ����)
function f_xk_ak_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array)
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
        %xk,ak�����ڸ���ȡֵ������ȡֵ
        for i=1:length(xk_array)
            xk=xk_array(i); xk_row=xk+1;
            for j=1:length(ak_array)
                ak=ak_array(j); ak_col=ak+1;  
                %���ݸ�����xk,ak����xk1,Ҳ����x(k-1)
                xk1=xk+ak;
                %���xk1����ȡ�����ֵ������ô��������϶������ڣ�f(xk,ak)=0,
                %�������κβ�����������һ��xk,ak�ĸ���ֵ����
                if xk1>ceil(x/delta)
                    continue;
                else
                    %Ŀǰ��֪xk1,ak1��0,1,...,N_delta������ȡֵ��ͬak��ȡֵ����һ����
                    for m=1:length(ak_array)
                        ak1=ak_array(m);
                        %ak1ȡֵΪak_array(m)ʱ����֪xk1����f(xk1,ak1)=f_xk1_ak1_array(xk1+1,ak1+1)
                        f_xk1_ak1=f_xk1_ak1_array(xk1+1,ak1+1);
                        %if f_xk1_ak1~=0
                        if f_xk1_ak1>=0.0005
                            %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
                            f_ak=func_07_f_ak( xk1, ak1, ak, R,lamda,delta,way_id,N_delta);
                            f_xk_ak_array(xk_row,ak_col)= real( f_xk1_ak1*f_ak + f_xk_ak_array(xk_row,ak_col) );
                        end %��� f_xk1_ak1������0
                    end %����xk,ak,�õ�xk1,����ak1��ÿһ��ȡֵ,����õ�f(xk,ak)���洢
                end %x(k-1)��xk1�Ƿ�������ȡֵ������
            end %a(k)��0,1,2,...,N_delta��ȡֵ,����ÿһ��ȡֵ
        end %xk��0,1,2,...,ceil(x/delta)��ȡֵ,����ÿһ��ȡֵ
    end %���k>1
%     disp(['f_xk_ak=',num2str(f_xk_ak) ])
%     disp(['---------------------k=',num2str(k),'-----------------------']);
   
end