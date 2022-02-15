%这个函数是 theory_01_Ah_nh的修改版本，适用于  给定v0后计算 每一层扩展区域的平均面积 以及等效半径

% R网络半径，r传输半径，N网络节点总个数，SN位置v0
% R=10;r=3;N=300;v0=0;
%依据AN_(h-1)节点的个数和分布区域，估计AN_(h)节点分布区域的平均面积
%公式推导见，代码测试见"test_A2_area_mean.m""test_A3_area_mean.m"
function [A2,n2,ri_2,ro_2]=theory_01_Ah_nh_v0(R,r,N,ri,ro,delta,n)

%n1个AN_1节点随机均匀分布在圆环C(O,ri,ro)中，
 %n1=ceil(N/(pi*R^2)*(pi*(ro^2-ri^2)));
%n1= ((N-1)/(pi*R^2)*(pi*(ro^2-ri^2)));
n1=n;
 
%有两层积分，外层对x积分，内层对d积分
delta_x=r*delta;
x_segment=ro+delta_x:  delta_x  :ro+r;

delta_d=(ro-ri)*delta;
d_segment=ri+delta_d:  delta_d  :ro;

%先外层积分，再内层积分
s=0;                                                  %二重积分实质是求面积
for i=1:(length(x_segment)-1)
    %指定x取值 赋给全局变量 xtemp  供后面对d积分时使用  对d积分是求高度  
    xtemp=x_segment(i+1) ;                        
    %第二层积分，对d进行积分，d为AN_1节点同SN节点之间的距离  
    f_D_d=2.*d_segment./(power(ro,2)-power(ri,2)); %变量 d 的概率密度函数
    
    
    
   % F_cos_theta=acos((power(r,2)-power(xtemp,2)-power(d_segment,2))./(-2.*xtemp.*d_segment))/pi;    
   %acos（theta）计算会得到复数，这是因为部分x值取不到。由于我们的运算是在实数域内进行，所以需要将复数部分置零。
   %计算cos(theta)
     COS_THETA=(power(r,2)-power(xtemp,2)-power(d_segment,2))./(-2.*xtemp.*d_segment);
   %寻找 cos(theta)中大于1的部分对应的序号
     IX=find( abs(COS_THETA)>1);
   %计算公式25中P(  acos(theta)/pi  )
     F_cos_theta=acos(COS_THETA)/pi;
   %将附复数域部分置0
     F_cos_theta(IX)=0;
  
    
    
    
    int1= real(   sum( F_cos_theta.* f_D_d.* delta_d ) );
    
    P_A2= (1- power( 1- int1, n1 ))  ;
    
   % disp( ['x=',num2str(xtemp),', P_A2=',num2str(P_A2)])
    
    %f_X_x=2*xtemp/(power(R,2)-power(xtemp,2)); %变量x 的概率密度函数
    %f_X_x=1;
    
    h=xtemp* P_A2   ;
    
    s= s+ h*delta_x;        
    
end

A2=s*2*pi ;
n2=A2/(pi*R^2)*(N-1);
ri_2=ro;
ro_2= sqrt((pi*ro^2+A2)/pi);

end

