%根据公式10计算P_Nakagami(x,m,omiga) 
%0<= x<=1
function P_Nakagami=func07_P_Nakagami(x,m,omiga)

r_m_momiga=func01_gamma(m,m/omiga*x^2);
P_Nakagami= r_m_momiga/gamma(m) ;

end

% %根据公式 （9） 计算下不完全gamma函数
% function my_gamma=func01_gamma(m)
% 
% %有1层积分 
% delta=0.01; delta_t=(10000-0)*delta;
% t_segment=0+delta_t:  delta_t  :10000;  
% t=   t_segment;  
% 
% 
% my_gamma  =   real(sum(    power(t,m-1) .*exp(-t).*  delta_t   ));
% 
% 
% end

%根据公式 （9） 计算下不完全gamma函数
function r_m_momiga=func01_gamma(n,lamda_x)

%有1层积分 
delta=0.01; delta_t=(lamda_x-0)*delta;
t_segment=0+delta_t:  delta_t  :lamda_x;  
t=   t_segment;  


r_m_momiga  =   real(sum(    power(t,n-1) .*exp(-t).*  delta_t   ));


end
 