
%运行代码及数据见文件夹 “参考文献理论公式计算-paper03”


% % % % function [f_n,f_n_v0]=paper_03_theoretical_HCD_GR(r,N,R)
% % % % 
% % % %     way_id=1;  
% % % % 
% % % %     %delta = 1.8*(R-sqrt(R^2-1/(pi*lamda)));N_delta=floor( R/ delta);delta =R/N_delta;
% % % %     N_delta=20;delta = R/N_delta; 
% % % %     n_max= ceil( 2*R/r)*4;
% % % %     [f_n,f_n_v0]=func_13_f_n_PPP( n_max,r,N,R,delta,N_delta,way_id );
% % % % 
% % % % end
% % % % 
% % % % 
% % % % 
% % % % %计算间距为x,半径分别是R1 R2的两个圆交叉区域的面积
% % % % function S=func_02_intersecting_area(x,R1,R2)
% % % %     
% % % %     
% % % %     %如果x是一个数值
% % % %     if length(x)==1
% % % %         %如果圆1内含圆2 或者 圆2内含于圆1 
% % % %         if ( abs(R1-R2)>=x )
% % % %             R_min=min(R1,R2);
% % % %             S=pi*R_min^2;      
% % % %             return;
% % % %         end                       
% % % %         %如果两圆相交
% % % %         if (abs(R1-R2)<x)&&(x<R1+R2 )  
% % % %             theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
% % % %             phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
% % % %             S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));     
% % % %         end
% % % %         %如果两圆间距大于半径之和，交叉区域面积是0，两圆相离
% % % %         if (R1+R2<=x)
% % % %             S=0;
% % % %             return;
% % % %         end
% % % %     end
% % % %     
% % % %     %如果x是一个数组
% % % %     if length(x)>1
% % % %         
% % % %         S=zeros(1,length(x));
% % % %         
% % % %         %记录 abs(R1-R2)>=x 的逻辑位置,此时两圆是内含的关系
% % % %         In= ( x<= abs(R1-R2) );
% % % %         %记录 (abs(R1-R2)<x)&&(x<R1+R2 ) 的逻辑位置，此时两圆相交
% % % %         Se= ((abs(R1-R2)<x)&(x<R1+R2 ));
% % % %         %记录 R1+R2<=x 的逻辑位置，此时两圆相离
% % % %         Le= (R1+R2<=x);
% % % %         
% % % %         %若两圆是内含关系
% % % %         R_min=min(R1,R2); S(In)=pi*R_min^2;  
% % % %         %若两圆是相交关系
% % % %         theta=zeros(1,length(x)); phi=zeros(1,length(x));
% % % %         theta(Se)= acos( (power(x(Se),2)+R1^2-R2^2)./(2.*x(Se).*R1) );
% % % %         phi(Se) = acos( (power(x(Se),2)+R2^2-R1^2)./(2.*x(Se).*R2) );
% % % %         S(Se)=R1^2.*theta(Se)+R2^2.*phi(Se)-1/2.*sqrt((power(R1+R2,2)-power(x(Se),2)).*(power(x(Se),2)-power(R1-R2,2))); 
% % % %         %若两圆是相离关系
% % % %         S(Le)= 0;                                
% % % %     end            
% % % % end
% % % % 
% % % % %方法1中，给定x(k-1),a(k-1)，计算ksai(a_k|x_k_1,a_k_1)
% % % % function ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, r,N,R, delta )
% % % % 
% % % %  
% % % %     xk1=x_k_1*delta;
% % % %     R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;
% % % %     R_j=x_k_1-a_k+1; Rj= R_j  *delta;
% % % %     Aj1=func_02_intersecting_area(xk1,r,Rj1);
% % % %     Aj = func_02_intersecting_area(xk1,r,Rj );
% % % %     lamda=N/(pi*R^2);
% % % %     ksai_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
% % % % %     ksai_ak= power(1-Aj1/(pi*radius^2),N)-power(1-Aj/(pi*radius^2),N);
% % % % end
% % % % 
% % % % function f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, r,N,R,delta,way_id,N_delta)
% % % % 
% % % %     lamda=N/(pi*R^2);
% % % %     %如果用方法1计算f_ak
% % % %     if way_id==1
% % % %        if a_k <=N_delta
% % % %            % ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda)
% % % %            ksai_ak= func_06_ksai_ak_in_way1(x_k_1, a_k, r,N,R, delta);
% % % %            f_ak=ksai_ak;
% % % %        else
% % % %            f_ak=0;
% % % %        end
% % % %        return;
% % % %     end
% % % %     
% % % %     %如果用方法2计算f_ak
% % % %     if way_id==2
% % % %         if a_k<=N_delta
% % % %             rho_max=func_04_rho_max_in_way2( x_k_1,a_k_1,r,delta);
% % % %             ksai_ak= func_05_ksai_ak_in_way2( x_k_1,a_k_1,a_k,r,delta, rho_max,lamda);
% % % %             f_ak=ksai_ak;
% % % %         else
% % % %             f_ak=0;
% % % %         end
% % % %        return;
% % % %     end
% % % % end
% % % % 
% % % % %给定k,计算 f(x(k),a(k))联合概率密度
% % % % %k是第k个阶段的状态,x是S-D实际距离,R是通信半径,lamda是节点密度, 
% % % % %delta是间距分割单位,way_id是f_xk_ak_array计算方法(1,2),
% % % % %f_xk1_ak1_array是f_xk_ak_array是第k-1个阶段对应状态的联合概率密度存储矩阵(k>1时会用)
% % % % function f_xk_ak_array= func_08_f_xk_ak_03_k1_to_k(k,x,r,N,R,delta,way_id,N_delta,f_xk1_ak1_array)
% % % %     
% % % %     %disp(['N_delta=',num2str(N_delta)]);
% % % %     
% % % %     %x(k)在0,1,2,...,ceil(x/delta)上取值,a(k)在0,1,2,...,N_delta上取值
% % % %     xk_array=0:1:floor(x/delta); ak_array=0:1:N_delta;
% % % %     %创建f_xk_ak_array数组,存储每一组 x(k),a(k)对应下的联合概率密度值.数组行号列号分别如下
% % % %     rowNum=length(xk_array); colNum=length(ak_array);
% % % %     f_xk_ak_array=zeros(rowNum,colNum);
% % % %     %因为 x(k)=x(k-1)-a(k) ,所以x(k)的取值与a(k)的取值具有一定的相关性，
% % % %     %x(k)并不一定能取到 [0,ceil(x/delta)]上的每一个值，
% % % %     %关于f( x(k), a(k))的具体计算过程如下
% % % %     x0=xk_array(end); a0=0;    
% % % %     if k==1
% % % %         for i=1:length(ak_array)
% % % %             ak=ak_array(i); ak_col=ak+1;
% % % %             xk=x0-ak;       xk_row=xk+1;
% % % %             %根据给定的xk,ak计算f(xk,ak),并将其存储在f_xk_ak_array的第xk_row行第ak_col列
% % % %             %f_ak= func_07_f_ak(  x_k_1, a_k_1, a_k, r,N,R,delta,way_id,N_delta)
% % % %             f_xk_ak_array(xk_row,ak_col)=real ( func_07_f_ak( x0, a0, ak, r,N,R,delta,way_id,N_delta) );
% % % %         end
% % % %     end
% % % %     if k>1
% % % %         %xk1取值区间与xk取值区间一致，为xk_array. ak1取值区间同ak,为ak_array
% % % %         %当0<=xk1<=N_delta时,ak=xk1;当N_delta<xk1<ceil(x/delta)时,ak=0,1,...,N_delta;
% % % %         xk1_array=xk_array; ak1_array=ak_array;
% % % %         for i=1:length(xk1_array)
% % % %             xk1=xk1_array(i);
% % % %             
% % % % %             if xk1==0    
% % % % %                 continue;
% % % % %             end
% % % %             if  xk1<=N_delta 
% % % %                 ak=xk1;xk=0; xk_row=xk+1; ak_col=ak+1; xk1_row=xk1+1;
% % % %                 f_xk_ak_array(xk_row,ak_col)= sum( f_xk1_ak1_array(xk1_row,:));
% % % %             else
% % % %                  
% % % %                 for j=1:length(ak_array)
% % % %                     ak=ak_array(j); ak_col=ak+1; 
% % % %                     xk=xk1-ak; xk_row=xk+1;
% % % %                     %目前已知xk1,ak1在0,1,...,N_delta上依次取值（同ak的取值区间一样）
% % % %                     for m=1:length(ak1_array)
% % % %                         ak1=ak1_array(m);
% % % %                         %ak1取值为ak_array(m)时，已知xk1，则f(xk1,ak1)=f_xk1_ak1_array(xk1+1,ak1+1)
% % % %                         f_xk1_ak1=f_xk1_ak1_array(xk1+1,ak1+1);
% % % %                         %if f_xk1_ak1~=0
% % % %                         if f_xk1_ak1~=0
% % % %                             %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, r,N,R,delta,way_id,N_delta)
% % % %                             %disp(['xk_row=',num2str(xk_row),',ak_col=',num2str(ak_col) ])
% % % %                             f_ak=func_07_f_ak( xk1, ak1, ak, r,N,R,delta,way_id,N_delta);
% % % %                             f_xk_ak_array(xk_row,ak_col)= real( f_xk1_ak1*f_ak + f_xk_ak_array(xk_row,ak_col) );
% % % %                         end %如果 f_xk1_ak1不等于0
% % % %                     end %给定xk1,xk,ak,遍历ak1的每一个取值,计算得到f(xk,ak)并存储
% % % %                 end%当N_delta<xk1<ceil(x/delta)时,ak在0,1,...,N_delta上取值,xk也随之变化，计算f(xk,ak)，并存储
% % % %             end% 0<=xk1<=N_delta？N_delta<xk1<ceil(x/delta)？
% % % %         end%遍历f_xk1_ak1_array中的每一个xk1值，根据xk1判断ak的取值范围，计算该取值范围上每一组xk,ak对应的概率密度，并存储
% % % % %     disp(['f_xk_ak=',num2str(f_xk_ak) ])
% % % % %     disp(['---------------------k=',num2str(k),'-----------------------']);
% % % %     end
% % % %    
% % % % end
% % % % 
% % % % %递归计算 f(xk,ak)耗时较长，每一个k值对应一组概率密度存储数组f_xk_ak_array；
% % % % %k在 1,2,3,....,n-1上取值，将这n-1个k值对应的f_xk_ak_array存储在cell数组中，
% % % % %计算f(n|x)时可以随时调用
% % % % 
% % % % %给定k,计算 f(x(k),a(k))联合概率密度
% % % % %n_max是跳数最大值（自行设置，但必须大于1）,x是S-D实际距离,R是通信半径,lamda是节点密度, 
% % % % %delta是间距分割单位,way_id是f_xk_ak_array计算方法(1,2),
% % % % function f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,r,N,R,delta,N_delta,way_id)
% % % %     
% % % %     f_xk_ak_array_cell=cell( 1, n_max-1);
% % % %     if n_max<=1
% % % %         disp('n_max should be greater than 1');
% % % %     else
% % % %         k=1;  %f_x1_a1_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,[]);
% % % %         %f_x1_a1_array= func_08_f_xk_ak_02_ak_range(k,x,R,lamda,delta,way_id,N_delta,[]);
% % % %         f_x1_a1_array= func_08_f_xk_ak_03_k1_to_k(k,x,r,N,R,delta,way_id,N_delta,[]);
% % % %         f_xk_ak_array_cell{1,1}=f_x1_a1_array;
% % % %         for k=2:n_max-1
% % % %             f_xk1_ak1_array=f_xk_ak_array_cell{1,k-1};
% % % %             %f_xk_ak_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array)
% % % %             %f_xk_ak_array= func_08_f_xk_ak(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array);
% % % %             %f_xk_ak_array= func_08_f_xk_ak_02_ak_range(k,x,R,lamda,delta,way_id,N_delta,f_xk1_ak1_array);
% % % %             f_xk_ak_array= func_08_f_xk_ak_03_k1_to_k(k,x,r,N,R,delta,way_id,N_delta,f_xk1_ak1_array);
% % % %             f_xk_ak_array_cell{1,k}=f_xk_ak_array;
% % % %         end
% % % %     end
% % % % end
% % % % 
% % % % %x是S-D间距，R是通信半径，lamda是节点密度,radius是网络半径，在PPP里不存在
% % % % function f_n_x_array= func_10_f_n_x_array(n_max,x,r,N,R,delta,N_delta,way_id)
% % % %     
% % % %     f_n_x_array=zeros(1, n_max);
% % % %     %当x<=R,一跳即可到达,跳数为1的概率是1，跳数为其它值得概率是0
% % % %     if( x<= r)
% % % %         f_n_x_array(1)=1;
% % % %         return;
% % % %     end
% % % %     %当x>R,至少两跳才能到达
% % % %     %f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id)
% % % %     f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,r,N,R,delta,N_delta,way_id );
% % % %     %f_xk_ak_array_cell是1*(n_max-1)维元胞数组
% % % %     %f(n|x)的计算要用到 f_xk_ak_array_cell(1,n-1)
% % % %     %x(n-1)在0,1,2,...,N_delta上取值时,不管a(n-1)取值为多少,第n跳总能到达target     
% % % %     for n=2:n_max
% % % %         f_xn1_an1_array=f_xk_ak_array_cell{1,n-1};  
% % % %         f_xn1=sum(f_xn1_an1_array,2);
% % % %         %f_xn1=f_xn1'
% % % %         f_n_x=sum( f_xn1(2:N_delta+1)) ;
% % % %         f_n_x_array(n)=f_n_x;
% % % %     end
% % % %     
% % % % end
% % % % 
% % % % %基于PPP，计算S-D间距取任意值时，节点间跳数分布,源节点位于圆心，S-D间距为v0，
% % % % function [f_n,f_n_v0]=func_13_f_n_PPP( n_max,r,N,R,delta,N_delta,way_id)
% % % %  
% % % %         f_n=zeros(1,n_max);
% % % %         v0_delta=0.05;
% % % %         
% % % %         delta_v0=v0_delta*R;
% % % % %         v0_array= 0+delta_v0 :delta_v0 :radius-delta_v0;
% % % %         v0_array= 0 +delta_v0  :delta_v0 :R ;
% % % %         f_n_x_cell=cell(1,length(v0_array));
% % % %         
% % % %         
% % % %         for i=1:length(v0_array)
% % % %             disp(['---------------------i=',num2str(i),'-------------------------'])
% % % %             v0=v0_array(i);
% % % % %             f_n_x_v0=func_11_f_n_x_v0( v0,n_max,R,lamda,delta,N_delta,way_id,radius);
% % % %             
% % % %             f_n_x_array_v0= func_10_f_n_x_array(n_max,v0,r,N,R,delta,N_delta,way_id);
% % % %             
% % % %             
% % % %             p_v0= 2*v0/R^2;
% % % %             f_n=f_n+f_n_x_array_v0*p_v0*delta_v0;
% % % %             f_n_x_cell{1,i}=f_n_x_array_v0;
% % % %         end
% % % %         f_n_v0{1,1}=f_n_x_cell;
% % % %         f_n_v0{1,2}=v0_array;        
% % % % 
% % % % end