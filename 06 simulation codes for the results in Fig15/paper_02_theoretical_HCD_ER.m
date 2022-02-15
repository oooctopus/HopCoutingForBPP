%参考文献 Load-Dependent Cascading Failures in Finite-Size Erdos-R € enyi Random Networks
%参考公式 Lemma1

% 测试参数 N=100;  radius=15; du=4;

function HCD2=paper_02_theoretical_HCD_ER(N,R,r)

%计算任意两点之间连接的概率p
p =func_01_pCalcu(r,R);

HCD2=zeros(1,ceil(4*R/r));
Pr=zeros(1,ceil(4*R/r));

n=N;
HCD2(1)=p; 
HCD2(2)=(1-p)*(1-power(1-p^2,n-2)); 

for i=3:length(HCD2)
    Pr(i)=1-power((1-p)+p*(1-sum(HCD2(1:i-1))),n-2) ;    
    HCD2(i)=(1-p)*Pr(i)-sum(HCD2(1:i-1));
end

end




%计算任意两点之间连接的概率p（计算理论值）
%du是通信半径
%rd是网络半径
function pTheory=func_01_pCalcu(r,R)

    %%忽略边缘效应的理论计算公式
    %pTheory=du^2/radius^2;
    
    %考虑边缘效应的理论计算公式
    %计算0<v0<rd-du的部分
    pTheory1=r^2*(R-r)^2/R^4;
    
    %计算rd-du<v0<rd的部分
    %利用蒙特卡洛期望法计算该部分的积分
    %在区间[rd-du,rd]上生成N个均匀分布的随机变量V
    N_calcu=2000;
    V=rand(1,N_calcu)*(R-(R-r))+(R-r);
    
    %基于积分符号内的函数g(v0)，计算出数组V内每个v0值对应的函数值g(v0);
    thetaStar=acos((power(r,2)+power(V,2)-power(R,2))./(2.*r.*V));
    phiStar  =acos((power(V,2)+power(R,2)-power(r,2))./(2.*R.*V));
    G_V= ( power(r,2)./(pi.*power(R,2)) .* (thetaStar-0.5.*sin(2.*thetaStar))+1./pi.*(phiStar-0.5.*sin(2.*phiStar)) ).*2.*V./power(R,2);
    pTheory2=sum(G_V)*(R-(R-r))/N_calcu;
    
    %p理论值等于第一部分与第二部分的和
    pTheory=pTheory1+pTheory2;    

end