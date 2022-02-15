%根据公式44计算omiga(n,lamda)

function omiga=func05_omiga(n,N,R)

omiga=n*func03_miu_r(2,N,R)+(n^2-n)*power(func03_miu_r(1,N,R),2);


end