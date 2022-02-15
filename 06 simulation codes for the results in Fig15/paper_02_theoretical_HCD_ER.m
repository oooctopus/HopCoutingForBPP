%�ο����� Load-Dependent Cascading Failures in Finite-Size Erdos-R �� enyi Random Networks
%�ο���ʽ Lemma1

% ���Բ��� N=100;  radius=15; du=4;

function HCD2=paper_02_theoretical_HCD_ER(N,R,r)

%������������֮�����ӵĸ���p
p =func_01_pCalcu(r,R);

HCD2=zeros(1,ceil(4*R/r));
Pr=zeros(1,ceil(4*R/r));

n=N;
HCD2(1)=p; 
HCD2(2)=(1-p)*(1-power(1-p^2,n-2)); 

for i=3:length(HCD2)
    Pr(i)=1-power((1-p)+p*(1-sum(HCD2(1:i-1))),n-2) ;    
    HCD2(i)=(1-p)*Pr(i)-sum(HCD2(1:i-1));
end

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