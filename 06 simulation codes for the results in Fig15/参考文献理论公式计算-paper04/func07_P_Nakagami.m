%���ݹ�ʽ10����P_Nakagami(x,m,omiga) 
%0<= x<=1
function P_Nakagami=func07_P_Nakagami(x,m,omiga)

r_m_momiga=func01_gamma(m,m/omiga*x^2);
P_Nakagami= r_m_momiga/gamma(m) ;

end

% %���ݹ�ʽ ��9�� �����²���ȫgamma����
% function my_gamma=func01_gamma(m)
% 
% %��1����� 
% delta=0.01; delta_t=(10000-0)*delta;
% t_segment=0+delta_t:  delta_t  :10000;  
% t=   t_segment;  
% 
% 
% my_gamma  =   real(sum(    power(t,m-1) .*exp(-t).*  delta_t   ));
% 
% 
% end

%���ݹ�ʽ ��9�� �����²���ȫgamma����
function r_m_momiga=func01_gamma(n,lamda_x)

%��1����� 
delta=0.01; delta_t=(lamda_x-0)*delta;
t_segment=0+delta_t:  delta_t  :lamda_x;  
t=   t_segment;  


r_m_momiga  =   real(sum(    power(t,n-1) .*exp(-t).*  delta_t   ));


end
 