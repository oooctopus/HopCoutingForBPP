%�ο����ף� Dynamic Analysis for the Average Shortest Path Length of Mobile Ad Hoc Networks Under Random Failure Scenarios 
%�ο���ʽ����ʽ��29��
                             
% ���Բ��� N=100;  radius=15; du=4;
function HCD1=paper_01_theoretical_HCD_ER(N,R,r)
 
%������������֮�����ӵĸ���p
pTheory=func_01_pCalcu(r,R);
%����ȵķֲ���
PkTheory=func_02_PkCalcu(pTheory,N); PkTheory=PkTheory(2:end,:);
 
%����ȵ�ƽ��ֵ
kMean=sum( PkTheory(:,1).* PkTheory(:,2) );
%����ȵĶ��׾�
k_2_moment=sum( power(PkTheory(:,1),2).* PkTheory(:,2) );

%·������С�ڵ���x�ĸ��ʣ�x���ڵ���1��ȡֵΪ������������ļ��㹫ʽ���Բο����ף�
syms x;
x=1:1:ceil(4*R/r); px=zeros(1,length(x));
for x=1:1:ceil(4*R/r) 
    F_x= exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x) );
    F_x_1=exp(  - kMean*kMean/(k_2_moment*N)*power(k_2_moment/kMean,x-1) );
    %·������Ϊx�ĸ���
    px(x)= F_x_1-F_x;
end
HCD1=px;
end

 
%������������֮�����ӵĸ���p����������ֵ��
%du��ͨ�Ű뾶
%rd������뾶
function pTheory=func_01_pCalcu(r,R)

    %%���Ա�ԵЧӦ�����ۼ��㹫ʽ
    %pTheory=du^2/radius^2;
    
    %���Ǳ�ԵЧӦ�����ۼ��㹫ʽ
    %����0<v0<rd-du�Ĳ���
    pTheory1=r^2*(R-r)^2/R^4;
    
    %����rd-du<v0<rd�Ĳ���
    %�������ؿ�������������ò��ֵĻ���
    %������[rd-du,rd]������N�����ȷֲ����������V
    N_calcu=2000;
    V=rand(1,N_calcu)*(R-(R-r))+(R-r);
    
    %���ڻ��ַ����ڵĺ���g(v0)�����������V��ÿ��v0ֵ��Ӧ�ĺ���ֵg(v0);
    thetaStar=acos((power(r,2)+power(V,2)-power(R,2))./(2.*r.*V));
    phiStar  =acos((power(V,2)+power(R,2)-power(r,2))./(2.*R.*V));
    G_V= ( power(r,2)./(pi.*power(R,2)) .* (thetaStar-0.5.*sin(2.*thetaStar))+1./pi.*(phiStar-0.5.*sin(2.*phiStar)) ).*2.*V./power(R,2);
    pTheory2=sum(G_V)*(R-(R-r))/N_calcu;
    
    %p����ֵ���ڵ�һ������ڶ����ֵĺ�
    pTheory=pTheory1+pTheory2;    

end

%�ڵ�Ķȷֲ����ۼ��㹫ʽ
%�ڵ�Ķȣ���ʾ����ֱ�������Ľڵ�ĸ�������k��ʾ
%p�����ڵ������ӵĸ���,N������ڵ��ܸ���

%���ֻ����һ��������p�����ؽڵ�Ķȷֲ���,�÷ֲ�����һ��N*2���飬��һ�м�¼�ȵ�ȡֵ����
%�ڶ��м�¼��ȡ��ֵʱ��Ӧ�ĸ���
%���������������p,k�����ض�Ϊkʱ�ĸ���
function PkTheory=func_02_PkCalcu(p,N,k)

    warning off
 
    if nargin==3
        PkTheory=nchoosek(N,k)*power(p,k)*power(1-p,N-k);
        return;
    end
    
    %�ֲ��У�k��0,1,2,...,N-1��ȡֵ������ֲ���
    PkTheory=zeros(N,2);
    for k=0:N-1
        PkTheory(k+1,1)=k;
        PkTheory(k+1,2)=nchoosek(N,k)*power(p,k)*power(1-p,N-k);
    end
    
    warning on
end
