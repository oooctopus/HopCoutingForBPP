%给定S-D间距D，根据公式49计算跳数分布
%route对应最近邻居路由，和最远邻居路由，分别用1，2表示 
function N_h_D_array=func08_N_h_D(D,N,R,route)

if route==1 %最近邻居路由
    d_nearest=func01_nearest_distance(N,R);
    d=d_nearest;
else 
    d_furthest=func02_furthest_distance(N,R);
    d=d_furthest;
end

%根据公式50计算 lamda_bar
lamda_bar=0;
for n=1:300
    m=func06_m(n,N,R);
    omiga=func05_omiga(n,N,R);
    P_Nakagami=func07_P_Nakagami(D,m,omiga);
    lamda_bar=lamda_bar+  P_Nakagami ;
end
lamda_bar=lamda_bar/D  ;

bata_bar=1+d*lamda_bar  ; 

n_array=1:1: ceil(2*R/d*20);
N_h_D_array=zeros(1,length(n_array));
for i=168:length(n_array)
    n=n_array(i);
    
    m1=func06_m(n*bata_bar,N,R);
    omiga1=func05_omiga(n*bata_bar,N,R);
    P_Nakagami_1=func07_P_Nakagami(D,m1,omiga1) ;
    
    m2=func06_m((n+1)*bata_bar,N,R);
    omiga2=func05_omiga((n+1)*bata_bar,N,R);
    P_Nakagami_2=func07_P_Nakagami(D,m2,omiga2) ;

%     display(['P_Nakagami_1=',num2str(P_Nakagami_1),',P_Nakagami_2=',num2str(P_Nakagami_2)]);
    
    N_h_D_array(n)=P_Nakagami_2-P_Nakagami_1;
end

end