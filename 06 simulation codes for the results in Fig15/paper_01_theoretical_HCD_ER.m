%参考文献： Dynamic Analysis for the Average Shortest Path Length of Mobile Ad Hoc Networks Under Random Failure Scenarios 
%参考公式：公式（29）
                             
% 测试参数 N=100;  radius=15; du=4;
function HCD1=paper_01_theoretical_HCD_ER(N,R,r)
 
%计算任意两点之间连接的概率p
pTheory=func_01_pCalcu(r,R);
%计算度的分布列
PkTheory=func_02_PkCalcu(pTheory,N); PkTheory=PkTheory(2:end,:);
 
%计算度的平均值
kMean=sum( PkTheory(:,1).* PkTheory(:,2) );
%计算度的二阶矩
k_2_moment=sum( power(PkTheory(:,1),2).* PkTheory(:,2) );

%路径长度小于等于x的概率（x大于等于1，取值为整数）（这里的计算公式来自参考文献）
syms x;
x=1:1:ceil(4*R/r); px=zeros(1,length(x));
for x=1:1:ceil(4*R/r) 
    F_x= exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x) );
    F_x_1=exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x-1) );
    %路径长度为x的概率
    px(x)= F_x_1-F_x;
end
HCD1=px;
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

%节点的度分布理论计算公式
%节点的度，表示与其直接相连的节点的个数，用k表示
%p是两节点相连接的概率,N是网络节点总个数

%如果只输入一个参数，p，返回节点的度分布列,该分布列是一个N*2数组，第一列记录度的取值集合
%第二列记录度取各值时对应的概率
%如果输入两个参数p,k，返回度为k时的概率
function PkTheory=func_02_PkCalcu(p,N,k)

    warning off
 
    if nargin==3
        PkTheory=nchoosek(N,k)*power(p,k)*power(1-p,N-k);
        return;
    end
    
    %分布列：k在0,1,2,...,N-1上取值，计算分布列
    PkTheory=zeros(N,2);
    for k=0:N-1
        PkTheory(k+1,1)=k;
        PkTheory(k+1,2)=nchoosek(N,k)*power(p,k)*power(1-p,N-k);
    end
    
    warning on
end
