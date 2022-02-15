%计算间距为x,半径分别是R1 R2的两个圆交叉区域的面积
function S=func_02_intersecting_area(x,R1,R2)
    
    
    %如果x是一个数值
    if length(x)==1
        %如果圆1内含圆2 或者 圆2内含于圆1 
        if ( abs(R1-R2)>=x )
            R_min=min(R1,R2);
            S=pi*R_min^2;      
            return;
        end                       
        %如果两圆相交
        if (abs(R1-R2)<x)&&(x<R1+R2 )  
            theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
            phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
            S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));     
        end
        %如果两圆间距大于半径之和，交叉区域面积是0，两圆相离
        if (R1+R2<=x)
            S=0;
            return;
        end
    end
    
    %如果x是一个数组
    if length(x)>1
        
        S=zeros(1,length(x));
        
        %记录 abs(R1-R2)>=x 的逻辑位置,此时两圆是内含的关系
        In= ( x<= abs(R1-R2) );
        %记录 (abs(R1-R2)<x)&&(x<R1+R2 ) 的逻辑位置，此时两圆相交
        Se= ((abs(R1-R2)<x)&(x<R1+R2 ));
        %记录 R1+R2<=x 的逻辑位置，此时两圆相离
        Le= (R1+R2<=x);
        
        %若两圆是内含关系
        R_min=min(R1,R2); S(In)=pi*R_min^2;  
        %若两圆是相交关系
        theta=zeros(1,length(x)); phi=zeros(1,length(x));
        theta(Se)= acos( (power(x(Se),2)+R1^2-R2^2)./(2.*x(Se).*R1) );
        phi(Se) = acos( (power(x(Se),2)+R2^2-R1^2)./(2.*x(Se).*R2) );
        S(Se)=R1^2.*theta(Se)+R2^2.*phi(Se)-1/2.*sqrt((power(R1+R2,2)-power(x(Se),2)).*(power(x(Se),2)-power(R1-R2,2))); 
        %若两圆是相离关系
        S(Le)= 0;                                
    end            
end