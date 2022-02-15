%基于BPP，计算S-D间距取任意值时，节点间跳数分布
function f_n=func_12_f_n( n_max,R,lamda,delta,N_delta,way_id,radius)
 
        f_n=zeros(1,n_max);
        v0_delta=0.01;
        
        delta_v0=v0_delta*radius;
        v0_array= 0+delta_v0 :delta_v0 :radius-delta_v0;
        
        for i=1:length(v0_array)
            disp(['---------------------i=',num2str(i),'-------------------------'])
            v0=v0_array(i);
            f_n_x_v0=func_11_f_n_x_v0( v0,n_max,R,lamda,delta,N_delta,way_id,radius);
            p_v0= 2*v0/radius^2;
            f_n=f_n+f_n_x_v0*p_v0*delta_v0;
        end

end