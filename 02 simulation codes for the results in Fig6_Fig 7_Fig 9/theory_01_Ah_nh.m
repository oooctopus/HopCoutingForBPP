% R����뾶��r����뾶��N����ڵ��ܸ�����SNλ��v0
% R=10;r=3;N=300;v0=0;
%����AN_(h-1)�ڵ�ĸ����ͷֲ����򣬹���AN_(h)�ڵ�ֲ������ƽ�����
 
function [A2,n2,ri_2,ro_2]=theory_01_Ah_nh(R,r,N,ri,ro,delta,n)

%n1��AN_1�ڵ�������ȷֲ���Բ��C(O,ri,ro)�У�
n1=n;
%��������֣�����x���֣��ڲ��d����
delta_x=(min(ro+r,R)-ro )*delta;
x_segment=ro+delta_x:  delta_x  :min(ro+r,R)-delta_x;

delta_d=(ro-ri)*delta;
d_segment=ri+delta_d:  delta_d  :ro-delta_d;

%�������֣����ڲ����
s=0;                                                  
for  i=1:(length(x_segment))
    %ָ��xȡֵ ����ȫ�ֱ��� xtemp  �������d����ʱʹ��  ��d��������߶� 
    xtemp=x_segment(i) ;   
    %�ڶ�����֣���d���л��֣�dΪAN_1�ڵ�ͬSN�ڵ�֮��ľ��� 
    f_D_d=2.*d_segment./(power(ro,2)-power(ri,2));
    
    %acos��theta�������õ�������������Ϊ����xֵȡ�������������ǵ���������ʵ�����ڽ��У�������Ҫ�������������㡣
    %����cos(theta)
     COS_THETA=(power(r,2)-power(xtemp,2)-power(d_segment,2))./(-2.*xtemp.*d_segment);
    %Ѱ�� cos(theta)�д���1�Ĳ��ֶ�Ӧ�����
     IX=find( abs(COS_THETA)>1);
    %���㹫ʽ25��P(  acos(theta)/pi  )
     F_cos_theta=acos(COS_THETA)/pi;
    %���������򲿷���0
     F_cos_theta(IX)=0;
  
    int1= real (   sum( F_cos_theta.* f_D_d.* delta_d ) );
    P_A2= (1- power( 1- int1, n1 ))  ;
    h=xtemp* P_A2   ;    
    s= s+ h*delta_x;        
    
end

A2=s*2*pi ;
n2=A2/(pi*R^2)*(N-1);
ri_2=ro;
ro_2= sqrt((pi*ro^2+A2)/pi);

end

