%test
n=10;
% % omiga=func05_omiga(n,N,R)
% % m=func06_m(n,N,R)
% % P_Nakagami=func07_P_Nakagami(x,m,omiga)
P_Nakagami_array=zeros(1,200);
for n=1:200
    omiga=func05_omiga(n,N,R);
    m=func06_m(n,N,R);
    P_Nakagami=func07_P_Nakagami(x,m,omiga);
    omiga_array(n)=omiga;
    m_array(n)=m;
    P_Nakagami_array(n)=P_Nakagami;
end

plot(m_array) ;title('m_array');
figure
plot(omiga_array);title('omiga_array');
figure
plot(P_Nakagami_array);title('P_Nakagami_array');
