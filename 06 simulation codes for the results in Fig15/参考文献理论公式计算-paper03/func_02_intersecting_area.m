%������Ϊx,�뾶�ֱ���R1 R2������Բ������������
function S=func_02_intersecting_area(x,R1,R2)
    
    
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