%�����ֲ�����--SN��Բ��

% R����뾶��r����뾶��N����ڵ��ܸ�����SNλ��v0
% R=10;r=3;N=300;v0=0;

 
function [hop_distri_theory_v0_0,A_array,n_array,ri_array,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta)

%�����洢���飬��ЧԲ���ھ����⾶��������ڵ�ƽ������
ri_array=zeros(1, ceil(2*R/r) ); ro_array=zeros(1, ceil(2*R/r) ); 
A_array=zeros(1, ceil(2*R/r) ); n_array=zeros(1, ceil(2*R/r) );
ri=0;ro=0; A=0; n=1;   i=1;
ri_array(i)=ri;ro_array(i)=ro;A_array(i)=A;n_array(i)=n; 
%���ݳ�ʼ�� 
ri=0;ro=min(r,R); A=pi*(ro^2-ri^2); n= (N-1)/(pi*R^2)*A  ;   i=2;
ri_array(i)=ri;ro_array(i)=ro;A_array(i)=A;n_array(i)=n;

while 1
     
    %��֪�ڵ�����Բ�����ھ�ri���⾶ro,����뾶r���ڵ����n������ά��L���������ɸ���loop
    %����loop����������չ����ƽ�����
    [A2,n2,ri_2,ro_2]=theory_01_Ah_nh(R,r,N,ri,ro,delta,n); 
     n= n2 ;
    %��¼����
    i=i+1;
    if(abs(ro_2-ro_array(end))<0.0001)
        break;
    end
    if ro_2<R-0.0001   
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2;
        n_array(i)=n2;
        ri=ri_2;ro=ro_2;
        n=n2;
    else        
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2 ;
        n_array(i)=n2;
        break;
    end
    
end
 hop_distri_theory_v0_0= n_array /N;  
end