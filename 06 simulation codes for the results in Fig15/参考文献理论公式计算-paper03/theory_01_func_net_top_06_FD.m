%求任意两节点间距为d的概率,N是节点个数，rd是网络半径，d是节点间距
 
function p =theory_01_func_net_top_06_FD(d ,rd)
 
    if (d<=rd)
        %考虑边缘效应的理论计算公式
        %计算0<v0<rd-d 的部分
        pTheory1=d^2*(rd-d )^2/rd^4;

        %计算rd-d<v0<rd的部分
        delta=0.02;
        V= (rd-d)+delta*(rd-(rd-d)) : delta*(rd-(rd-d)): rd-delta*(rd-(rd-d));
        
        thetaStar=acos((power(d,2)+power(V,2)-power(rd,2))./(2.*d.*V));
        phiStar  =acos((power(V,2)+power(rd,2)-power(d,2))./(2.*rd.*V));
        F_V= ( power(d,2)./(pi.*power(rd,2)) .* (thetaStar-0.5.*sin(2.*thetaStar))+1./pi.*(phiStar-0.5.*sin(2.*phiStar)) ).*2.*V./power(rd,2);
        pTheory2=sum(F_V * delta*(rd-(rd-d)) ) ;

        %p理论值等于第一部分与第二部分的和
        p =pTheory1+pTheory2;   
    else
        %考虑边缘效应的理论计算公式
        %计算0<v0<d-rd 的部分
        pTheory1= (d-rd)^2/rd^2;
        
        %计算d-rd<v0<rd的部分
        delta=0.02;
        V= (d-rd)+delta*(rd-(d-rd)) : delta*(rd-(d-rd)): rd-delta*(rd-(d-rd));
        
        thetaStar=acos((power(d,2)+power(V,2)-power(rd,2))./(2.*d.*V));
        phiStar  =acos((power(V,2)+power(rd,2)-power(d,2))./(2.*rd.*V));
        F_V= ( power(d,2)./(pi.*power(rd,2)) .* (thetaStar-0.5.*sin(2.*thetaStar))+1./pi.*(phiStar-0.5.*sin(2.*phiStar)) ).*2.*V./power(rd,2);
        pTheory2=sum(F_V * delta*(rd-(d-rd)) ) ;

        %p理论值等于第一部分与第二部分的和
        p =pTheory1+pTheory2;   
    end
        

end



 