%计算与最近邻居节点与之间的平均距离，根据公式32
function d_nearest=func01_nearest_distance(N,R)

lamda=N/(pi*R^2);
phi=pi/2;

d_nearest=power(pi*phi*lamda,-0.5);

end