%�ο����׼��㳤��Ϊx��·�����ֵĸ���ֵ

%����K��Ҫ��ȫ�ֲ���
 
global N;  global radius;  global du;                                  
N=100;  radius=15; du=4;

%�ȵ�ƽ��ֵ
%������������֮�����ӵĸ���p
pTheory=theory_01_func_net_top_01_pCalcu(du,radius);
%����ȵķֲ���
PkTheory=theory_01_func_net_top_02_PkCalcu(pTheory); PkTheory=PkTheory(2:end,:);
 

%����ȵ�ƽ��ֵ
kMean=sum( PkTheory(:,1).* PkTheory(:,2) );
%����ȵĶ��׾�
k_2_moment=sum( power(PkTheory(:,1),2).* PkTheory(:,2) );

%·������С�ڵ���x�ĸ��ʣ�x���ڵ���1��ȡֵΪ������������ļ��㹫ʽ���Բο����ף�
syms x;
x=1:6; px=zeros(1,length(x));
for x=1:6 
    F_x= exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x) );
    F_x_1=exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x-1) );
    %·������Ϊx�ĸ���
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

 
% %ƽ��·������
% gama=0.5772;
% logK_mean=sum( log(PkTheory(:,1)).* PkTheory(:,2) );
% l_mean= (-2*logK_mean+log(N)+log(N)*k_2_moment-gama)/(log(N)+log(k_2_moment)-log(kMean)*N)+0.5;
% a=sum(x.*px)

 
% x=2;
% 
% F_x= exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x) );
% F_x_1=exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x-1) );
% 
% %·������Ϊx�ĸ���
% px= F_x_1-F_x;
