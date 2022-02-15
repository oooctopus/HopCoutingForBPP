%计算与最远邻居节点与之间的平均距离，根据公式57
function d_furthest=func02_furthest_distance(N,R)

lamda=N/(pi*R^2);
 
%有1层积分 
delta=0.01; delta_x=(1-0)*delta;
x_segment=0+delta_x:  delta_x  :1;  
x=   x_segment;                                          
 
d_furthest=  real( sum(  2*lamda.*x.*sqrt(1-power(x,2))./(exp(pi*lamda/2)-1).*exp(2*lamda.*x-lamda.*power(x,3)./(2+sqrt(1-power(x,2)))).*delta_x  ) );

end