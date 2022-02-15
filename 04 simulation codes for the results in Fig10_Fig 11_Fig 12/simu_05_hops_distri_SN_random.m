%仿真计算平均跳数,SN在网络中随机均匀分布
function hops_distri_simu_mean=simu_05_hops_distri_SN_random(R,N,r,loop,delta )

    %节点PR与网络中心o的间距 v 的 取值区间  0< v< R
    % v的取值与概率密度函数值
    v_delta= delta*(R-0);
    v= 0+v_delta : v_delta :R-v_delta ;
    fV= 2.*v./power(R,2) ;
  
    %sum(fV.*v_delta)==1 is true
    
    hops_distri_v_array= zeros( length(v),ceil(2*R/r*10 ));
    
    for i=1:length(v)
        display(['simu,i=',num2str(i) ])
        %当参数v取值为v_temp时，跳数分布为hops_distri_v，共有hops_num层 节点
        v_temp=v(i);    
        hops_distri_simu_mean=simu_04_hops_distri_mean(R,N,r,loop,v_temp);                
        hops_num= length( hops_distri_simu_mean );
        hops_distri_v_array(i, 1:hops_num )= hops_distri_simu_mean;
    end

     % sum( array,1) 对列求和
     hops_distri_v_array_mean= sum(      hops_distri_v_array.* (fV)' *  v_delta  ,   1);
     hops_distri_simu_mean=hops_distri_v_array_mean(hops_distri_v_array_mean>0);


end

 

 