% ����PPP�����µĵ�ЧԲ��������BPPģ���� ��������vʱ�������ֲ� v�ǲο��ڵ�PRͬ�������ĵľ���
%����ļ��� theory_03_hops_distri_SN_v0.m �ļ����޸İ汾
%��Ҫ�Ƕ��Ӻ���  func_01_hops_distri_SN_center(R,r,N,delta,v0)  ���� �޸�
% func_01_hops_distri_SN_center(R,r,N,delta,v0)
% ����Ҫ����ڵ��ܸ���N���Լ�����뾶R��������Ҫ����ڵ��ܶ�pho�Լ�Դ�ڵ���Բ��֮��ľ���v0

function hops_distri_v= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v0) 

    
    [ ri_array,ro_array]=func_01_hops_distri_SN_center(R,r,N,delta,v0);
    %����ÿһ���ڵ�ֲ�����ĵ�Ч���
    Ah_array_BPP= zeros(1,length(ro_array ) );

    for i=1:length(Ah_array_BPP)
        ri=ri_array(i );
        ro=ro_array(i );
        Ah_array_BPP(i)=func_02_IB2(v0,R,ro) - func_02_IB2(v0,R,ri);
    end
    hops_distri_v=Ah_array_BPP/(pi*R^2);
   
 
      
end

function [ ri_array,ro_array]=func_01_hops_distri_SN_center(R,r,N,delta,v0)

% N=N*(R+v0)^2/R^2;
% R=R+v0;

%�����洢���飬��ЧԲ���ھ����⾶��������ڵ�ƽ������
ri_array=zeros(1, ceil(4*R/r) ); ro_array=zeros(1, ceil(4*R/r) ); 
A_array=zeros(1, ceil(4*R/r) ); n_array=zeros(1, ceil(4*R/r) );
%���ݳ�ʼ�� 
ri=0;ro=r; A=pi*(ro^2-ri^2); n=(N/(pi*R^2)*A );   i=1;
ri_array(i)=ri;ro_array(i)=ro;A_array(i)=A;n_array(i)=n;

while 1
     
    %��֪�ڵ�����Բ�����ھ�ri���⾶ro,����뾶r���ڵ����n������ά��L���������ɸ���loop
    %����loop����������չ����ƽ�����
    [A2,n2,ri_2,ro_2]=theory_01_Ah_nh_v0(R,r,N,ri,ro,delta); 
    %��¼����
    i=i+1;
    if(abs(ro_2-ro_array(end))<0.0002)
        break;
    end
    if ro_2<v0+R-0.0001       
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2;
        n_array(i)=n2;
        ri=ri_2;ro=ro_2;
    else
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2 ;
        n_array(i)=n2;         
        break;%��ֹѭ��
    end
    
end

%     hop_distri_theory_v0_0=n_array/N;
    
%     %��ͼ
%     hold on
%     x=v0;y=0;
%     for i=1:length(ri_array)
%         plot_01_circle(x,y,ri_array(i));
%         plot_01_circle(x,y,ro_array(i));
%     end
%     R=R-v0;
%     plot_01_circle(0,0,R );
%     axis equal
    
end

%������Ϊx,�뾶�ֱ���R1 R2������Բ������������,�Լ���Բ֮���λ�ù�ϵ
%pos_relation=1, Բ1�ں�Բ2; 2, Բ2�ں�Բ1; 3, Բ1��Բ2�ཻ; 4 ��Բ����
function  S =func_02_IB2(x,R1,R2)    
    
    %���x��һ����ֵ
    if length(x)==1
        %���Բ1�ں�Բ2 ���� Բ2�ں���Բ1 
        if ( abs(R1-R2)>=x )
            R_min=min(R1,R2);
            S=pi*R_min^2;      
            return;
        end                       
        %�����Բ�ཻ
        if (abs(R1-R2)<x)&&(x<R1+R2 )  
            theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
            phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
            S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));     
        end
        %�����Բ�����ڰ뾶֮�ͣ��������������0����Բ����
        if (R1+R2<=x)
            S=0;
            return;
        end
    end
    
    %���x��һ������
    if length(x)>1
        
        S=zeros(1,length(x));
        
        %��¼ abs(R1-R2)>=x ���߼�λ��,��ʱ��Բ���ں��Ĺ�ϵ
        In= ( x<= abs(R1-R2) );
        %��¼ (abs(R1-R2)<x)&&(x<R1+R2 ) ���߼�λ�ã���ʱ��Բ�ཻ
        Se= ((abs(R1-R2)<x)&(x<R1+R2 ));
        %��¼ R1+R2<=x ���߼�λ�ã���ʱ��Բ����
        Le= (R1+R2<=x);
        
        %����Բ���ں���ϵ
        R_min=min(R1,R2); S(In)=pi*R_min^2;  
        %����Բ���ཻ��ϵ
        theta=zeros(1,length(x)); phi=zeros(1,length(x));
        theta(Se)= acos( (power(x(Se),2)+R1^2-R2^2)./(2.*x(Se).*R1) );
        phi(Se) = acos( (power(x(Se),2)+R2^2-R1^2)./(2.*x(Se).*R2) );
        S(Se)=R1^2.*theta(Se)+R2^2.*phi(Se)-1/2.*sqrt((power(R1+R2,2)-power(x(Se),2)).*(power(x(Se),2)-power(R1-R2,2))); 
        %����Բ�������ϵ
        S(Le)= 0;                                
    end            
end
 

    