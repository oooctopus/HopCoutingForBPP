
%���д��뼰���ݼ��ļ��� ���ο��������۹�ʽ����-paper03��


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
% % % % %������Ϊx,�뾶�ֱ���R1 R2������Բ������������
% % % % function S=func_02_intersecting_area(x,R1,R2)
% % % %     
% % % %     
% % % %     %���x��һ����ֵ
% % % %     if length(x)==1
% % % %         %���Բ1�ں�Բ2 ���� Բ2�ں���Բ1 
% % % %         if ( abs(R1-R2)>=x )
% % % %             R_min=min(R1,R2);
% % % %             S=pi*R_min^2;      
% % % %             return;
% % % %         end                       
% % % %         %�����Բ�ཻ
% % % %         if (abs(R1-R2)<x)&&(x<R1+R2 )  
% % % %             theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
% % % %             phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
% % % %             S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));     
% % % %         end
% % % %         %�����Բ�����ڰ뾶֮�ͣ��������������0����Բ����
% % % %         if (R1+R2<=x)
% % % %             S=0;
% % % %             return;
% % % %         end
% % % %     end
% % % %     
% % % %     %���x��һ������
% % % %     if length(x)>1
% % % %         
% % % %         S=zeros(1,length(x));
% % % %         
% % % %         %��¼ abs(R1-R2)>=x ���߼�λ��,��ʱ��Բ���ں��Ĺ�ϵ
% % % %         In= ( x<= abs(R1-R2) );
% % % %         %��¼ (abs(R1-R2)<x)&&(x<R1+R2 ) ���߼�λ�ã���ʱ��Բ�ཻ
% % % %         Se= ((abs(R1-R2)<x)&(x<R1+R2 ));
% % % %         %��¼ R1+R2<=x ���߼�λ�ã���ʱ��Բ����
% % % %         Le= (R1+R2<=x);
% % % %         
% % % %         %����Բ���ں���ϵ
% % % %         R_min=min(R1,R2); S(In)=pi*R_min^2;  
% % % %         %����Բ���ཻ��ϵ
% % % %         theta=zeros(1,length(x)); phi=zeros(1,length(x));
% % % %         theta(Se)= acos( (power(x(Se),2)+R1^2-R2^2)./(2.*x(Se).*R1) );
% % % %         phi(Se) = acos( (power(x(Se),2)+R2^2-R1^2)./(2.*x(Se).*R2) );
% % % %         S(Se)=R1^2.*theta(Se)+R2^2.*phi(Se)-1/2.*sqrt((power(R1+R2,2)-power(x(Se),2)).*(power(x(Se),2)-power(R1-R2,2))); 
% % % %         %����Բ�������ϵ
% % % %         S(Le)= 0;                                
% % % %     end            
% % % % end
% % % % 
% % % % %����1�У�����x(k-1),a(k-1)������ksai(a_k|x_k_1,a_k_1)
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
% % % %     %����÷���1����f_ak
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
% % % %     %����÷���2����f_ak
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
% % % % %����k,���� f(x(k),a(k))���ϸ����ܶ�
% % % % %k�ǵ�k���׶ε�״̬,x��S-Dʵ�ʾ���,R��ͨ�Ű뾶,lamda�ǽڵ��ܶ�, 
% % % % %delta�Ǽ��ָλ,way_id��f_xk_ak_array���㷽��(1,2),
% % % % %f_xk1_ak1_array��f_xk_ak_array�ǵ�k-1���׶ζ�Ӧ״̬�����ϸ����ܶȴ洢����(k>1ʱ����)
% % % % function f_xk_ak_array= func_08_f_xk_ak_03_k1_to_k(k,x,r,N,R,delta,way_id,N_delta,f_xk1_ak1_array)
% % % %     
% % % %     %disp(['N_delta=',num2str(N_delta)]);
% % % %     
% % % %     %x(k)��0,1,2,...,ceil(x/delta)��ȡֵ,a(k)��0,1,2,...,N_delta��ȡֵ
% % % %     xk_array=0:1:floor(x/delta); ak_array=0:1:N_delta;
% % % %     %����f_xk_ak_array����,�洢ÿһ�� x(k),a(k)��Ӧ�µ����ϸ����ܶ�ֵ.�����к��кŷֱ�����
% % % %     rowNum=length(xk_array); colNum=length(ak_array);
% % % %     f_xk_ak_array=zeros(rowNum,colNum);
% % % %     %��Ϊ x(k)=x(k-1)-a(k) ,����x(k)��ȡֵ��a(k)��ȡֵ����һ��������ԣ�
% % % %     %x(k)����һ����ȡ�� [0,ceil(x/delta)]�ϵ�ÿһ��ֵ��
% % % %     %����f( x(k), a(k))�ľ�������������
% % % %     x0=xk_array(end); a0=0;    
% % % %     if k==1
% % % %         for i=1:length(ak_array)
% % % %             ak=ak_array(i); ak_col=ak+1;
% % % %             xk=x0-ak;       xk_row=xk+1;
% % % %             %���ݸ�����xk,ak����f(xk,ak),������洢��f_xk_ak_array�ĵ�xk_row�е�ak_col��
% % % %             %f_ak= func_07_f_ak(  x_k_1, a_k_1, a_k, r,N,R,delta,way_id,N_delta)
% % % %             f_xk_ak_array(xk_row,ak_col)=real ( func_07_f_ak( x0, a0, ak, r,N,R,delta,way_id,N_delta) );
% % % %         end
% % % %     end
% % % %     if k>1
% % % %         %xk1ȡֵ������xkȡֵ����һ�£�Ϊxk_array. ak1ȡֵ����ͬak,Ϊak_array
% % % %         %��0<=xk1<=N_deltaʱ,ak=xk1;��N_delta<xk1<ceil(x/delta)ʱ,ak=0,1,...,N_delta;
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
% % % %                     %Ŀǰ��֪xk1,ak1��0,1,...,N_delta������ȡֵ��ͬak��ȡֵ����һ����
% % % %                     for m=1:length(ak1_array)
% % % %                         ak1=ak1_array(m);
% % % %                         %ak1ȡֵΪak_array(m)ʱ����֪xk1����f(xk1,ak1)=f_xk1_ak1_array(xk1+1,ak1+1)
% % % %                         f_xk1_ak1=f_xk1_ak1_array(xk1+1,ak1+1);
% % % %                         %if f_xk1_ak1~=0
% % % %                         if f_xk1_ak1~=0
% % % %                             %f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, r,N,R,delta,way_id,N_delta)
% % % %                             %disp(['xk_row=',num2str(xk_row),',ak_col=',num2str(ak_col) ])
% % % %                             f_ak=func_07_f_ak( xk1, ak1, ak, r,N,R,delta,way_id,N_delta);
% % % %                             f_xk_ak_array(xk_row,ak_col)= real( f_xk1_ak1*f_ak + f_xk_ak_array(xk_row,ak_col) );
% % % %                         end %��� f_xk1_ak1������0
% % % %                     end %����xk1,xk,ak,����ak1��ÿһ��ȡֵ,����õ�f(xk,ak)���洢
% % % %                 end%��N_delta<xk1<ceil(x/delta)ʱ,ak��0,1,...,N_delta��ȡֵ,xkҲ��֮�仯������f(xk,ak)�����洢
% % % %             end% 0<=xk1<=N_delta��N_delta<xk1<ceil(x/delta)��
% % % %         end%����f_xk1_ak1_array�е�ÿһ��xk1ֵ������xk1�ж�ak��ȡֵ��Χ�������ȡֵ��Χ��ÿһ��xk,ak��Ӧ�ĸ����ܶȣ����洢
% % % % %     disp(['f_xk_ak=',num2str(f_xk_ak) ])
% % % % %     disp(['---------------------k=',num2str(k),'-----------------------']);
% % % %     end
% % % %    
% % % % end
% % % % 
% % % % %�ݹ���� f(xk,ak)��ʱ�ϳ���ÿһ��kֵ��Ӧһ������ܶȴ洢����f_xk_ak_array��
% % % % %k�� 1,2,3,....,n-1��ȡֵ������n-1��kֵ��Ӧ��f_xk_ak_array�洢��cell�����У�
% % % % %����f(n|x)ʱ������ʱ����
% % % % 
% % % % %����k,���� f(x(k),a(k))���ϸ����ܶ�
% % % % %n_max���������ֵ���������ã����������1��,x��S-Dʵ�ʾ���,R��ͨ�Ű뾶,lamda�ǽڵ��ܶ�, 
% % % % %delta�Ǽ��ָλ,way_id��f_xk_ak_array���㷽��(1,2),
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
% % % % %x��S-D��࣬R��ͨ�Ű뾶��lamda�ǽڵ��ܶ�,radius������뾶����PPP�ﲻ����
% % % % function f_n_x_array= func_10_f_n_x_array(n_max,x,r,N,R,delta,N_delta,way_id)
% % % %     
% % % %     f_n_x_array=zeros(1, n_max);
% % % %     %��x<=R,һ�����ɵ���,����Ϊ1�ĸ�����1������Ϊ����ֵ�ø�����0
% % % %     if( x<= r)
% % % %         f_n_x_array(1)=1;
% % % %         return;
% % % %     end
% % % %     %��x>R,�����������ܵ���
% % % %     %f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id)
% % % %     f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,r,N,R,delta,N_delta,way_id );
% % % %     %f_xk_ak_array_cell��1*(n_max-1)άԪ������
% % % %     %f(n|x)�ļ���Ҫ�õ� f_xk_ak_array_cell(1,n-1)
% % % %     %x(n-1)��0,1,2,...,N_delta��ȡֵʱ,����a(n-1)ȡֵΪ����,��n�����ܵ���target     
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
% % % % %����PPP������S-D���ȡ����ֵʱ���ڵ�������ֲ�,Դ�ڵ�λ��Բ�ģ�S-D���Ϊv0��
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