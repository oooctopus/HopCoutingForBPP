%方法1中，给定x(k-1),a(k-1)，计算ksai(a_k|x_k_1,a_k_1)
function ksai_ak= func_06_ksai_ak_in_way1( x_k_1, a_k, R, delta,lamda)

    global N;global radius;
    xk1=x_k_1*delta;
    R_j_1=x_k_1-a_k; Rj1=R_j_1*delta;
    R_j=x_k_1-a_k+1; Rj= R_j  *delta;
    Aj1=func_02_intersecting_area(xk1,R,Rj1);
    Aj = func_02_intersecting_area(xk1,R,Rj );
    
    ksai_ak= exp(-lamda*Aj1)-exp(-lamda*Aj);
%     ksai_ak= power(1-Aj1/(pi*radius^2),N)-power(1-Aj/(pi*radius^2),N);
end