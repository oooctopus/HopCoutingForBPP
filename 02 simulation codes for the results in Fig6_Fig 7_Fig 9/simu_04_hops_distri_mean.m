%仿真计算平均跳数
function hops_distri_simu_mean=simu_04_hops_distri_mean(R,N,r,loop,v0)

 
%统计loop个场景的跳数分布
hops_distri_cell=cell(1,loop);
hops_distri_array=zeros( loop  , 2* ceil(R/r) );

%仿真1000次，记录每一次网络节点的跳数分布
parfor j=1:loop
    %display(['j=',num2str(j)])
    [~,hops_distri_simu_v0 ]= simu_03_hops_distri_once_v0_given(R,N,r,v0  );
    hops_distri_cell{1,j}=hops_distri_simu_v0;
end

for j=1:loop
    hops_distri_simu_v0=hops_distri_cell{1,j};
    hops_length=length(hops_distri_simu_v0);
    hops_distri_array(j,1:hops_length)=hops_distri_simu_v0;
end

hops_distri_array=sum(hops_distri_array,1)/loop;
hops_array_length=max( find( hops_distri_array>0) );
%对1000个场景的跳数分布区平均，计算平均跳数分布
hops_distri_simu_mean=hops_distri_array(1:hops_array_length);
end

 