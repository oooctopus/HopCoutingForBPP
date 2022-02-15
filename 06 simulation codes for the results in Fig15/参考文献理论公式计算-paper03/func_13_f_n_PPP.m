%
%基于PPP，计算S-D间距取任意值时，节点间跳数分布,源节点位于圆心，S-D间距为v0，
function [f_n,f_n_v0]=func_13_f_n_PPP( n_max,R,lamda,delta,N_delta,way_id,radius)
 
        f_n=zeros(1,n_max);
        v0_delta=0.05;
        
        delta_v0=v0_delta*radius;
%         v0_array= 0+delta_v0 :delta_v0 :radius-delta_v0;
        v0_array= 0 +delta_v0  :delta_v0 :radius ;
        f_n_x_cell=cell(1,length(v0_array));
        
        
        for i=1:length(v0_array)
            disp(['---------------------i=',num2str(i),'-------------------------'])
            v0=v0_array(i);
%             f_n_x_v0=func_11_f_n_x_v0( v0,n_max,R,lamda,delta,N_delta,way_id,radius);
            
            f_n_x_array_v0= func_10_f_n_x_array(n_max,v0,R,lamda,delta,N_delta,way_id);
            
            
            p_v0= 2*v0/radius^2;
            f_n=f_n+f_n_x_array_v0*p_v0*delta_v0;
            f_n_x_cell{1,i}=f_n_x_array_v0;
        end
        f_n_v0{1,1}=f_n_x_cell;
        f_n_v0{1,2}=v0_array;        

end