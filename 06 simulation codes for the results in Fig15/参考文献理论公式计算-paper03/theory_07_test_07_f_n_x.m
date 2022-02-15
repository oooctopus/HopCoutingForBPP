%�Բο����� On the hop count statistics for randomly deployed wireless sensor networks ���з�����֤
%���۹�ʽ����
%���¸����Ľ��ۣ� f_n_x �ļ��㹫ʽ����������S-D��࣬���������ֲ�
%�����Ļ����ϣ��Ҽ���S-D���ĸ����ܶȷֲ��������ɡ�

%x��S-D��࣬R��ͨ�Ű뾶��lamda�ǽڵ��ܶ�,radius������뾶����PPP�ﲻ����
function f_n_x_array= theory_07_test_07_f_n_x(x,R,lamda,radius,N_delta,way_id)

    f_n_x_array=zeros(1, ceil(radius*2/R)*2);
    %��x<=R,һ�����ɵ���,����Ϊ1�ĸ�����1������Ϊ����ֵ�ø�����0
    if( x<= R)
        f_n_x_array(1)=1;
        return;
    end
    %��R<x<=2R�����ܻ�2����������ֵ
    if (x>R)&&(x<=2*R)
        %���㽻���������
        S_A=func_02_intersecting_area(x,R,R);
        %���㽻����������n���ڵ�ĸ���
        p_nA=func_01_prob_n_in_A(lamda,0,S_A);        
        f_n_x_array(2)=1-p_nA;
        
        %Ҳ����3����4��,......,�ֱ�����Ӧ�ĸ���ֵ
        %N_delta=50;  
        for n=3:length( f_n_x_array )
            %����x,n,lamda,R,���� ����ȡֵΪnʱ�Ķ�Ӧ����ֵ�����ݹ�ʽ22
	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
            f_n_x_array(n)=f_n_x;
        end                    
        return;
    end
    %��x>2R
    if x>2*R
        %����3����4��,......,�ֱ�����Ӧ�ĸ���ֵ        
        for n=3:length( f_n_x_array )
            %����x,n,lamda,R,���� ����ȡֵΪnʱ�Ķ�Ӧ����ֵ�����ݹ�ʽ22
	        f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius);
            f_n_x_array(n)=f_n_x;
        end                    
        return;        
    end
end

%����PPP��������A����n���ڵ�ĸ���.lamda�ǽڵ��ܶ�,S_A������A�����
function p_nA=func_01_prob_n_in_A(lamda,n,S_A)
    f1=power(lamda*S_A,n); f2=factorial(n);
    %��n �ϴ�f1��f2���ܻᱻ��¼Ϊinf����matlab��inf/inf=NaN��������ѭ�����м���
    if  isinf(f1)|| isinf(f2)
        f3=1;
        for i=1:n
            f3=f3*lamda*S_A/i;
        end
        p_nA=exp(-lamda*S_A)*f3;
    else
        p_nA= exp(-lamda*S_A)*power(lamda*S_A,n)/factorial(n); 
    end    
end

%������Ϊx,�뾶�ֱ���R1 R2������Բ������������
function S=func_02_intersecting_area(x,R1,R2)
    
    %�����Բ�����ڰ뾶֮�ͣ��������������0
    if (R1+R2<=x)
        S=0;
        return;
    end
    
    %�����Բ�ǰ�����ϵ
    if (( R2>=x+R1 ) || ( R1>=x+R2 ))
        R_min=min(R2,R1);
        S=pi*R_min^2;
        return;
    end
    
    %�����Բ�ཻ
    theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
    phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
    S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));
end

%����2�У��������� x(k-1) , a(k-1),rho , R1,R2,����A3(ͼ9�е���Ӱ���).
%����û�и���A3�ļ��㹫ʽ,�Һ������Ҫ�����ؿ��޷�����м���
function A3_area= func_03_A3_area( x_k_1,a_k_1,rho,R1,R2)    
    A3_area=zeros(1,length(rho));
end


%����2�У�����x(k-1),a(k-1),����rho_max��ͼ9�мн�ȡֵ�����ֵ��,R��ͨ�Ű뾶��delta�Ƿָ�����ĳ���
function rho_max=func_04_rho_max_in_way2( x_k_1,a_k_1,R,delta)
    x_k_2=x_k_1-a_k_1;
    xk2=x_k_2*delta; xk1=x_k_1*delta; 
    rho_max=acos( (xk2^2+xk1^2-R^2)/(2*xk2*xk1) );
end

%����2�У�����x(k-1),a(k-1),a(k),rho_max,���� ksai(a_k|x_k_1,a_k_1),���
%ֵ�Ǹ���x(k-1),a(k-1)֮�����ǰ������ȡֵΪa(k)�ĸ��ʣ��漰������
function ksai_ak= func_05_ksai_ak_in_way2( x_k_1,a_k_1,a_k,R,delta, rho_max,lamda)

    %��������
    rho_delta=0.02;
    rho= 0+rho_delta*( rho_max-0):   rho_delta*( rho_max-0)  : rho_max-rho_delta*( rho_max-0);
    
    %����һ��rho, A_j_1, A_j�ļ���
    xk1=x_k_1* delta;  
    x_k_2= x_k_1+a_k_1; xk2=x_k_2*delta;
    R_j= x_k_1-a_k+1; Rj=R_j*delta;
    R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;    
    Aj1= func_02_intersecting_area(xk1,R,Rj1)- func_03_A3_area( xk2,xk1,rho,R,Rj1) ;
    Aj = func_02_intersecting_area(xk1,R,Rj )- func_03_A3_area( xk2,xk1,rho,R,Rj ) ;
    
    yita_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
    
    ksai_ak=  2* sum(  yita_ak*1/(2*rho_max)* rho_delta*( rho_max-0) );
end

%����1�У�����x(k-1),a(k-1)������ksai(a_k|x_k_1,a_k_1)
function ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda)
    xk1=x_k_1*delta;
    R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;
    R_j=x_k_1-a_k+1; Rj= R_j  *delta;
    Aj1=func_02_intersecting_area(xk1,R,Rj1);
    Aj = func_02_intersecting_area(xk1,R,Rj );
    
    ksai_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
end

% ���� x(k-1), a(k-1)���� ǰ������ȡֵΪ a(k)�ĸ���,N_delta��R�ֶεĸ���
function f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)

    %����÷���1����f_ak
    if way_id==1
       if a_k <=N_delta
           ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda);
           f_ak=ksai_ak;
       else
           f_ak=0;
       end
       return;
    end
    
    %����÷���2����f_ak
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

%����k,���� f(x(k),a(k))���ϸ����ܶ�
function f_xk_ak= func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
    if k==1
        %func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
        f_ak= func_07_f_ak( x, 0, a_k, R,lamda,delta,way_id,N_delta);
        f_xk_ak=f_ak;
    else
        f_xk_ak=0;
        a_k_1_array=0: 1:N_delta;
       for i=1:length(a_k_1_array)
           a_k_1=a_k_1_array(i);            
           x_k_1=x_k+a_k;
           %f_xk_ak= func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
           f_xk1_ak1=func_08_f_xk_ak(k-1,x_k_1,a_k_1,x,R,lamda,delta,way_id,N_delta);
           %func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta)
           f_ak=func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta);
           f_xk_ak=  f_xk_ak+ f_xk1_ak1*f_ak;
       end
    end
end

%����x,n,lamda,R,���� ����ȡֵΪnʱ�Ķ�Ӧ����ֵ�����ݹ�ʽ22
function f_n_x= func_09_f_n_x(x,n,R,lamda,N_delta,way_id,radius)

    f_n_x=0;
    delta=R/N_delta;
    x_n_1_array=0:1:N_delta; a_n_1_array=0:1:N_delta;
    
    for i=1:length( x_n_1_array)
        x_n_1=x_n_1_array(i);
        for j=1:length( a_n_1_array)
            a_n_1=a_n_1_array(j);
            %����k,���� f(x(k),a(k))���ϸ����ܶ�, func_08_f_xk_ak(k,x_k,a_k,x,R,lamda,delta,way_id,N_delta)
            f_xn1_an1= func_08_f_xk_ak(n-1,x_n_1,a_n_1,x,R,lamda,delta,way_id,N_delta);
            f_n_x=f_n_x+f_xn1_an1;
        end
    end

end
 