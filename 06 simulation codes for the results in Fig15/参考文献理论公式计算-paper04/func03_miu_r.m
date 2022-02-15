%根据公式40 计算  miu_r(k,lamda)
function miu_r=func03_miu_r(k,N,R)

lamda=N/(pi*R^2);

%有1层积分 
delta=0.01; delta_x=(1-0)*delta;
x_segment=0+delta_x:  delta_x  :1;  
x=   x_segment;     

miu_r=2*lamda/(1-exp(-pi*lamda/2))*   real(sum(    power(x,k).*sqrt(1-power(x,2)).*exp(-2*lamda.*x).*  delta_x                              ));

end