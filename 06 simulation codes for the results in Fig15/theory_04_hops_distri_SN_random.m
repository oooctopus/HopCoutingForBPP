%���ο��ڵ�PR ���������ĵļ��vΪһ�����ʱ������BPP�����µ������ֲ�
function hops_distri_mean = theory_04_hops_distri_SN_random (R,r,N,delta ) 
 
    
    %�ڵ�PR����������o�ļ�� v �� ȡֵ����  0< v< R
    % v��ȡֵ������ܶȺ���ֵ
    v_delta= delta*(R-0);
    v= 0+v_delta : v_delta :R-v_delta ;
    fV= 2.*v./power(R,2) ;
  
    %sum(fV.*v_delta)==1 is true
    
    hops_distri_v_array= zeros( length(v),ceil(2*R/r*10 ));
    for i=1:length(v)
        %������vȡֵΪv_tempʱ�������ֲ�Ϊhops_distri_v������hops_num�� �ڵ�
        v_temp=v(i);
     
        hops_distri_v= theory_03_hops_distri_SN_v0_02(R,r,N,delta,v_temp) ;
        
        %a=sum(hops_distri_v)
        
        hops_num= length( hops_distri_v );
        hops_distri_v_array(i, 1:hops_num )= hops_distri_v;
    end

     % sum( array,1) �������
     hops_distri_v_array_mean=real( sum(      hops_distri_v_array.* (fV)' *  v_delta  ,   1));
     hops_distri_mean=hops_distri_v_array_mean(hops_distri_v_array_mean>0);


end