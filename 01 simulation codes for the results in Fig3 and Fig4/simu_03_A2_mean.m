%��ε���func_01_A2_simu(r,n1,N)�� ��¼ÿһ�� A2����ķ���ֵ����ƽ��ֵ
%r �ǽڵ㴫��뾶, n1��AN1�ڵ����,N+1 * N+1�ǵ���ά��
function s_A2_simu_mean=simu_03_A2_mean(ri,ro,r,n1,N,loop)
    s_A2_simu_mean=0;
    for i=1:loop
        s_A2_simu_mean=s_A2_simu_mean+simu_02_A2(ri,ro,r,n1,N);
    end
    s_A2_simu_mean=s_A2_simu_mean/loop;
end