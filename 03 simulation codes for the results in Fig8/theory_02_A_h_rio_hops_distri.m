%�����ֲ�����--SN��Բ��

% R����뾶��r����뾶��N����ڵ��ܸ�����SNλ��v0
% R=10;r=3;N=300;v0=0;
%����AN_(h-1)�ڵ�ĸ����ͷֲ����򣬹���AN_(h)�ڵ�ֲ������ƽ�����
 
function [hop_distri_theory_v0_0,A_array,n_array,ri_array,ro_array]=theory_02_A_h_rio_hops_distri(R,r,N,delta)

%�����洢���飬��ЧԲ���ھ����⾶��������ڵ�ƽ������
ri_array=zeros(1, ceil(2*R/r) ); ro_array=zeros(1, ceil(2*R/r) ); 
A_array=zeros(1, ceil(2*R/r) ); n_array=zeros(1, ceil(2*R/r) );
%���ݳ�ʼ�� 
ri=0;ro=r; A=pi*(ro^2-ri^2); n=(N/(pi*R^2)*A );   i=1;
ri_array(i)=ri;ro_array(i)=ro;A_array(i)=A;n_array(i)=n;


while 1
     
    %��֪�ڵ�����Բ�����ھ�ri���⾶ro,����뾶r���ڵ����n������ά��L���������ɸ���loop
    %����loop����������չ����ƽ�����
    [A2,n2,ri_2,ro_2]=theory_01_Ah_nh(R,r,N,ri,ro,delta); 
     
    %��¼����
    i=i+1;
    if(abs(ro_2-ro_array(end))<0.0002)
        break;
    end
    if ro_2<R-0.0001   
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2;
        n_array(i)=n2;
        ri=ri_2;ro=ro_2;
%         plot_03_circle_color(0,0,ro_2,color,width )
    else        
        ri_array(i)=ri_2;
        ro_array(i)=ro_2;
        A_array(i)=A2 ;
        %n_array(i)=N-sum(n_array);  
        n_array(i)=n2;
%         ro_array(i)=R;
%         A_array(i)=pi*(R^2-ri_2^2) ;
%         %n_array(i)=N-sum(n_array);  
%         n_array(i)=N*pi*(R^2-ri_2^2)/(pi*R^2);
%         plot_03_circle_color(0,0,ro_2,color,width )
        break;%��ֹѭ��
    end
    
end

    hop_distri_theory_v0_0=n_array/N;
    %hop_distri_theory_v0_0=A_array/(pi*R^2);
    
end