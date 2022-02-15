%N R r以概率P保证网络全连通，这4个变量满足关系式 （见文章公式4）
function r=theory_06_P_full_connection(N,R,P)

   r=sqrt(     -log(1-    power(P,1/N)  )  * R^2     /    N              );

end