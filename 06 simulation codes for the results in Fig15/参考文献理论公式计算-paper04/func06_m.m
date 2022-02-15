%根据公式45计算m(n,lamda)
function m=func06_m(n,N,R)

m=power(func05_omiga(n,N,R),2)./(func04_miu_z( n,N,R)-power(func05_omiga(n,N,R),2));


end