% R����뾶��r����뾶��N����ڵ��ܸ�����SNλ��v0
% R=10;r=3;N=300;v0=0;
%����AN_(h-1)�ڵ�ĸ����ͷֲ����򣬹���AN_(h)�ڵ�ֲ������ƽ�����
%��ʽ�Ƶ�����������Լ�"test_A2_area_mean.m""test_A3_area_mean.m"
function [A2,n2,ri_2,ro_2]=theory_01_Ah_nh(R,r,N,ri,ro,delta)

%n1��AN_1�ڵ�������ȷֲ���Բ��C(O,ri,ro)�У�
 %n1=ceil(N/(pi*R^2)*(pi*(ro^2-ri^2)));
n1= (N/(pi*R^2)*(pi*(ro^2-ri^2)));
 
%��������֣�����x���֣��ڲ��d����
delta_x=(min(r,R-ro))*delta;
x_segment=ro+delta_x:  delta_x  :min(ro+r,R);

delta_d=(ro-ri)*delta;
d_segment=ri+delta_d:  delta_d  :ro;

%�������֣����ڲ����
s=0;                                                  %���ػ���ʵ���������
for i=1:(length(x_segment)-1)
    xtemp=x_segment(i+1) ;                         %ָ��xȡֵ ����ȫ�ֱ��� xtemp  �������d����ʱʹ��  ��d��������߶�  
    
    %�ڶ�����֣���d���л��֣�dΪAN_1�ڵ�ͬSN�ڵ�֮��ľ���  
    f_D_d=2.*d_segment./(power(ro,2)-power(ri,2)); %���� d �ĸ����ܶȺ���
    
    F_cos_theta=acos((power(r,2)-power(xtemp,2)-power(d_segment,2))./(-2.*xtemp.*d_segment))/pi;
    
    int1= real(   sum( F_cos_theta.* f_D_d.* delta_d ) );
    
    P_A2= (1- power( 1- int1, n1 ))  ;
    
   % disp( ['x=',num2str(xtemp),', P_A2=',num2str(P_A2)])
    
    %f_X_x=2*xtemp/(power(R,2)-power(xtemp,2)); %����x �ĸ����ܶȺ���
    %f_X_x=1;
    
    h=xtemp* P_A2   ;
    
    s= s+ h*delta_x;        
    
end

A2=s*2*pi ;
n2=A2/(pi*R^2)*N;
ri_2=ro;
ro_2= sqrt((pi*ro^2+A2)/pi);

end

