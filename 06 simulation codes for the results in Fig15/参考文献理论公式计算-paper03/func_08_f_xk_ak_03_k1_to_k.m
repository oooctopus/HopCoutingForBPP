%给定k,计算 f(x(k),a(k))联合概率密度
%k是第k个阶段的状态,x是S-D实际距离,R是通信半径,lamda是节点密度, 
%delta是间距分割单位,way_id是f_xk_ak_array计算方法(1,2),
%f_xk1_ak1_array是f_xk_ak_array是第k-1个阶段对应状态的联合概率密度存储矩阵(k>1时会用)
function f_xk_ak_array= func_08_f_xk_ak_03_k1_to_k(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array)
    
    %disp(['N_delta=',num2str(N_delta)]);

    %x(k)在0,1,2,...,ceil(x/delta)上取值,a(k)在0,1,2,...,N_delta上取值
    xk_array=0:1:ceil(x/delta); ak_array=0:1:N_delta;
    %创建f_xk_ak_array数组,存储每一组 x(k),a(k)对应下的联合概率密度值.数组行号列号分别如下
    rowNum=length(xk_array); colNum=length(ak_array);
    f_xk_ak_array=zeros(rowNum,colNum);
    %因为 x(k)=x(k-1)-a(k) ,所以x(k)的取值与a(k)的取值具有一定的相关性，
    %x(k)并不一定能取到 [0,ceil(x/delta)]上的每一个值，
    %关于f( x(k), a(k))的具体计算过程如下
    x0=xk_array(end); a0=0;    
    if k==1
        for i=1:length(ak_array)
            ak=ak_array(i); ak_col=ak+1;
            xk=x0-ak;       xk_row=xk+1;
            %根据给定的xk,ak计算f(xk,ak),并将其存储在f_xk_ak_array的第xk_row行第ak_col列
            %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
            f_xk_ak_array(xk_row,ak_col)=real ( func_07_f_ak( x0, a0, ak, R,lamda,delta,way_id,N_delta) );
        end
    end
    if k>1
        %xk1取值区间与xk取值区间一致，为xk_array. ak1取值区间同ak,为ak_array
        %当0<=xk1<=N_delta时,ak=xk1;当N_delta<xk1<ceil(x/delta)时,ak=0,1,...,N_delta;
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
                    %目前已知xk1,ak1在0,1,...,N_delta上依次取值（同ak的取值区间一样）
                    for m=1:length(ak1_array)
                        ak1=ak1_array(m);
                        %ak1取值为ak_array(m)时，已知xk1，则f(xk1,ak1)=f_xk1_ak1_array(xk1+1,ak1+1)
                        f_xk1_ak1=f_xk1_ak1_array(xk1+1,ak1+1);
                        %if f_xk1_ak1~=0
                        if f_xk1_ak1~=0
                            %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
                            %disp(['xk_row=',num2str(xk_row),',ak_col=',num2str(ak_col) ])
                            f_ak=func_07_f_ak( xk1, ak1, ak, R,lamda,delta,way_id,N_delta);
                            f_xk_ak_array(xk_row,ak_col)= real( f_xk1_ak1*f_ak + f_xk_ak_array(xk_row,ak_col) );
                        end %如果 f_xk1_ak1不等于0
                    end %给定xk1,xk,ak,遍历ak1的每一个取值,计算得到f(xk,ak)并存储
                end%当N_delta<xk1<ceil(x/delta)时,ak在0,1,...,N_delta上取值,xk也随之变化，计算f(xk,ak)，并存储
            end% 0<=xk1<=N_delta？N_delta<xk1<ceil(x/delta)？
        end%遍历f_xk1_ak1_array中的每一个xk1值，根据xk1判断ak的取值范围，计算该取值范围上每一组xk,ak对应的概率密度，并存储
%     disp(['f_xk_ak=',num2str(f_xk_ak) ])
%     disp(['---------------------k=',num2str(k),'-----------------------']);
    end
   
end