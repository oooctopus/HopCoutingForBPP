%多次调用func_01_A2_simu(r,n1,N)， 记录每一次 A2面积的仿真值，求平均值
%r 是节点传输半径, n1是AN1节点个数,N+1 * N+1是点阵维度
function s_A2_simu_mean=simu_03_A2_mean(ri,ro,r,n1,N,loop)
    s_A2_simu_mean=0;
    for i=1:loop
        s_A2_simu_mean=s_A2_simu_mean+simu_02_A2(ri,ro,r,n1,N);
    end
    s_A2_simu_mean=s_A2_simu_mean/loop;
end