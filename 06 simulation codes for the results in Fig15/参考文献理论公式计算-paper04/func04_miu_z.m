%根据公式46计算    miu_z(4,n,lamda)


function miu_z=func04_miu_z( n,N,R)

 
miu_z_array=zeros(1,5) ;
miu_z_array(1)=n*func03_miu_r(4,N,R) ;
miu_z_array(2)=4*(n^2-n)*func03_miu_r(3,N,R)*func03_miu_r(1,N,R) ;
miu_z_array(3)=3*(n^2-n)* power(func03_miu_r(2,N,R),2);
miu_z_array(4)=6*(n^3-3*n^2+2*n)*func03_miu_r(2,N,R)*power(func03_miu_r(1,N,R),2);
miu_z_array(5)=(n^4-6*n^3+11*n^2-6*n)*power(func03_miu_r(1,N,R),4) 
miu_z=sum(miu_z_array) 

end