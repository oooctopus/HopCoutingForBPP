%参考文献计算长度为x的路径出现的概率值

%计算K需要的全局参数
 
global N;  global radius;  global du;                                  
N=100;  radius=15; du=4;

%度的平均值
%计算任意两点之间连接的概率p
pTheory=theory_01_func_net_top_01_pCalcu(du,radius);
%计算度的分布列
PkTheory=theory_01_func_net_top_02_PkCalcu(pTheory); PkTheory=PkTheory(2:end,:);
 

%计算度的平均值
kMean=sum( PkTheory(:,1).* PkTheory(:,2) );
%计算度的二阶矩
k_2_moment=sum( power(PkTheory(:,1),2).* PkTheory(:,2) );

%路径长度小于等于x的概率（x大于等于1，取值为整数）（这里的计算公式来自参考文献）
syms x;
x=1:6; px=zeros(1,length(x));
for x=1:6 
    F_x= exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x) );
    F_x_1=exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x-1) );
    %路径长度为x的概率
    px(x)= F_x_1-F_x;
end
disp(px)

% p1=kMean/N; disp(p1);
% p1=0.2
% p2=(1-p1)*(1-power(1-p1,kMean));disp(p2);

n=N;
p=pTheory;
p1=p ;  
p2=(1-p)*(1-power(1-p^2,n-2));          
Pr3=1-power((1-p)+p*(1-p1-p2),n-2) ;    
p3=(1-p)*Pr3-p2;
disp([p1 p2 p3 0 0 0]);

 
% %平均路径长度
% gama=0.5772;
% logK_mean=sum( log(PkTheory(:,1)).* PkTheory(:,2) );
% l_mean= (-2*logK_mean+log(N)+log(N)*k_2_moment-gama)/(log(N)+log(k_2_moment)-log(kMean)*N)+0.5;
% a=sum(x.*px)

 
% x=2;
% 
% F_x= exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x) );
% F_x_1=exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x-1) );
% 
% %路径长度为x的概率
% px= F_x_1-F_x;
