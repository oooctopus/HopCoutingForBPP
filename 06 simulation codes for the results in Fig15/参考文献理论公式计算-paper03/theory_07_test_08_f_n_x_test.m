%对theory_07_test_07_f_n_x中的子函数进行测试

%%
%方法1中，给定x(k-1),a(k-1)，计算ksai(a_k|x_k_1,a_k_1)
% function ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda)
% % % clear;clc;
% % % R=20;lamda=0.08;  delta = 1.3*(R-sqrt(R^2-1/(pi*lamda)));N_delta=floor( R/ delta); x_k_1=40; a_k=24; 
% % %  N_delta=14;delta = R/N_delta;
% % % ksai_ak_array=zeros(1,N_delta);
% % % for a_k=0:N_delta+1
% % % 
% % %     xk1=x_k_1*delta;
% % %     R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;
% % %     R_j=x_k_1-a_k+1; Rj= R_j  *delta;
% % %     Aj1=func_02_intersecting_area(xk1,R,Rj1);
% % %     Aj = func_02_intersecting_area(xk1,R,Rj );
% % %     
% % %     ksai_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
% % %     ksai_ak_array(a_k+1)=ksai_ak;
% % % end
% % % 
% % % a=sum(ksai_ak_array);

%%
% % % clear;clc;
% % % R=20;lamda=0.08;N_delta=30;delta = R/N_delta;     x_k_1=40;a_k_1=12;  a_k=24; way_id=1;
% % % f_ak_array=zeros(1,N_delta);
% % % for a_k=0:N_delta
% % %     f_ak= func_07_f_ak( x_k_1, a_k_1, a_k, R,lamda,delta,way_id,N_delta);
% % %     f_ak_array(a_k+1)=f_ak;
% % % end
% % % a=sum(f_ak_array);

%%
% clear;clc;
% % % R=20;lamda=0.08;N_delta=30;delta = R/N_delta;     x_k_1=40;a_k_1=12;  a_k=24; way_id=1;x_k=12; x=60;radius=50;
% % %  
% % % f_xk_ak= func_08_f_xk_ak(3,x_k,a_k,x,R,lamda,delta,way_id,N_delta);
% % %  f_n_x= func_09_f_n_x(x,4,R,lamda,N_delta,way_id,radius);

%%
clear;clc;
global radius;global N;
radius=10; du=2.9; N=300; rho= N/(pi*radius^2);
R=du;lamda=rho ; way_id=1;  x=0.5*radius;% N_delta=30;delta = R/N_delta; 

%delta = 1.8*(R-sqrt(R^2-1/(pi*lamda)));N_delta=floor( R/ delta);delta =R/N_delta;
N_delta=20;delta = R/N_delta; 
n_max= ceil( 2*radius/R)*4;

% f_n=func_12_f_n( n_max,R,lamda,delta,N_delta,way_id,radius)

%  f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id)
% f_n=func_13_f_n_PPP( n_max,R,lamda,delta,N_delta,way_id,radius)

[f_n,f_n_v0]=func_13_f_n_PPP( n_max,R,lamda,delta,N_delta,way_id,radius)

% %f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id)
% f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(n_max,x,R,lamda,delta,N_delta,way_id);
% f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id) ;
% a=f_n_x_array(1:6);
% 
% sum(f_n_x_array)

%%
% clear;clc;
% global radius;global N;
% radius=15; du=4; N=200; rho= N/(pi*radius^2);
% R=du;lamda=rho ; way_id=1;  x=1.1*R;  
% N_delta=30;delta = R/N_delta;  n_max= ceil( 2*radius/R)*2;
% 
% f_n_x_end=zeros(1,n_max);
% x_delta=0.05;
% x_array=0+2*radius*x_delta : 2*radius*x_delta: 2*radius-2*radius*x_delta;
% 
% for i=1:length(x_array)
%     disp(i);
%     x=x_array(i);
%     p =theory_01_func_net_top_06_FD(x ,radius);
%     f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id) ;
% 	f_n_x_end=f_n_x_end+p*f_n_x_array;
% end
% 
% sum(f_n_x_end)

 
 
% f_xk_ak= func_08_f_xk_ak(3,x_k,a_k,x,R,lamda,delta,way_id,N_delta);
%  f_n_x= func_09_f_n_x(x,2,R,lamda,N_delta,way_id,radius);
% f_xk_ak_array= func_08_f_xk_ak(1,x,R,lamda,delta,way_id,N_delta);
% f_xk_ak_array_cell= func_09_f_xk_ak_array_cell(10,x,R,lamda,delta,way_id,N_delta);
 
% for i=1:length(f_xk_ak_array_cell)
%     f_xk_ak_array=f_xk_ak_array_cell{1,i};
%     f_xk_ak_sum=sum( sum(f_xk_ak_array) );
%     disp(['f_xk_ak_sum=',num2str(f_xk_ak_sum)]);
% end
%%
% % function [S,p_nA,p_nA_array]=theory_07_test_08_f_n_x_test
% %     S=0;p_nA=0;
% %     
% %     x=10;R1=10;R2=R1;
% %     S=func_02_intersecting_area(x,R1,R2) ;
% %     
% %     lamda=1;n=200;S_A=S;
% %     p_nA=func_01_prob_n_in_A(lamda,n,S_A);  
% %     
% %     n_array=10:1:400; p_nA_array=zeros(1,length(n_array));
% %     for i=1:length(n_array)
% %         n=n_array(i);
% %         p_nA_array(i)=func_01_prob_n_in_A(lamda,n,S_A);
% %     end
% %    
% %     plot(n_array,p_nA_array);
% %     xlim([1,500])
% % 
% % end
% % 
% % %基于PPP计算区域A中有n个节点的概率.lamda是节点密度,S_A是区域A的面积
% % function p_nA=func_01_prob_n_in_A(lamda,n,S_A)
% %     f1=power(lamda*S_A,n); f2=factorial(n);
% %     %当n 较大，f1与f2可能会被记录为inf，在matlab中inf/inf=NaN，所以用循环进行计算
% %     if  isinf(f1)|| isinf(f2)
% %         f3=1;
% %         for i=1:n
% %             f3=f3*lamda*S_A/i;
% %         end
% %         p_nA=exp(-lamda*S_A)*f3;
% %     else
% %         p_nA= exp(-lamda*S_A)*power(lamda*S_A,n)/factorial(n); 
% %     end    
% % end
% % 
% % %计算间距为x,半径分别是R1 R2的两个圆交叉区域的面积
% % function S=func_02_intersecting_area(x,R1,R2)    
% %     %如果两圆间距大于半径之和，交叉区域面积是0
% %     if (R1+R2<=x)
% %         S=0;
% %         return;
% %     end    
% %     %如果两圆是包涵关系
% %     if (( R2>=x+R1 ) || ( R1>=x+R2 ))
% %         R_min=min(R2,R1);
% %         S=pi*R_min^2;
% %         return;
% %     end    
% %     %如果两圆相交
% %     theta= acos( (x^2+R1^2-R2^2)/(2*x*R1) );
% %     phi  = acos( (x^2+R2^2-R1^2)/(2*x*R2) );
% %     S=R1^2*theta+R2^2*phi-1/2*sqrt((power(R1+R2,2)-power(x,2))*(power(x,2)-power(R1-R2,2)));
% % end