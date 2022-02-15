%���������ڵ���Ϊd�ĸ���,N�ǽڵ������rd������뾶��d�ǽڵ���
 
function p =theory_01_func_net_top_06_FD(d ,rd)
 
    if (d<=rd)
        %���Ǳ�ԵЧӦ�����ۼ��㹫ʽ
        %����0<v0<rd-d �Ĳ���
        pTheory1=d^2*(rd-d )^2/rd^4;

        %����rd-d<v0<rd�Ĳ���
        delta=0.02;
        V= (rd-d)+delta*(rd-(rd-d)) : delta*(rd-(rd-d)): rd-delta*(rd-(rd-d));
        
        thetaStar=acos((power(d,2)+power(V,2)-power(rd,2))./(2.*d.*V));
        phiStar  =acos((power(V,2)+power(rd,2)-power(d,2))./(2.*rd.*V));
        F_V= ( power(d,2)./(pi.*power(rd,2)) .* (thetaStar-0.5.*sin(2.*thetaStar))+1./pi.*(phiStar-0.5.*sin(2.*phiStar)) ).*2.*V./power(rd,2);
        pTheory2=sum(F_V * delta*(rd-(rd-d)) ) ;

        %p����ֵ���ڵ�һ������ڶ����ֵĺ�
        p =pTheory1+pTheory2;   
    else
        %���Ǳ�ԵЧӦ�����ۼ��㹫ʽ
        %����0<v0<d-rd �Ĳ���
        pTheory1= (d-rd)^2/rd^2;
        
        %����d-rd<v0<rd�Ĳ���
        delta=0.02;
        V= (d-rd)+delta*(rd-(d-rd)) : delta*(rd-(d-rd)): rd-delta*(rd-(d-rd));
        
        thetaStar=acos((power(d,2)+power(V,2)-power(rd,2))./(2.*d.*V));
        phiStar  =acos((power(V,2)+power(rd,2)-power(d,2))./(2.*rd.*V));
        F_V= ( power(d,2)./(pi.*power(rd,2)) .* (thetaStar-0.5.*sin(2.*thetaStar))+1./pi.*(phiStar-0.5.*sin(2.*phiStar)) ).*2.*V./power(rd,2);
        pTheory2=sum(F_V * delta*(rd-(d-rd)) ) ;

        %p����ֵ���ڵ�һ������ڶ����ֵĺ�
        p =pTheory1+pTheory2;   
    end
        

end



 