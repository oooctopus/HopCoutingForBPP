%基于BPP，计算v0(S与圆心间距)给定时，f_n的条件分布列（f(n|x)对x取全期望）
function f_n_x_v0=func_11_f_n_x_v0( v0,n_max,R,lamda,delta,N_delta,way_id,radius)
 
        f_n_x=zeros(1,n_max);
        x_delta=0.01;
              
        %指定v0取值后  将x进行分段 对x积分时分成两段
        %xlsegment-[0,rd-v0]  xhsegment-[rd-v0,rd+v0]    对r积分实质是求面积
        delta_xlseg=x_delta*(radius-v0-0);
        xlsegment=0+delta_xlseg : delta_xlseg  :radius-v0-delta_xlseg;                                                               
        delta_xhseg=x_delta*(radius+v0-(radius-v0));
        xhsegment=radius-v0+delta_xhseg  :  delta_xhseg  :radius+v0-delta_xhseg;
         
        for j=1:(length(xlsegment))
            disp(['j=',num2str(j)])
            xltemp=xlsegment(j);                          %指定r在上半段的值  赋给全局变量rltemp
            xhtemp=xhsegment(j);                          %指定r在下半段的值  赋给全局变量rhtemp

            %根据给定的x值，计算对应的f_n_x分布列，以及S-D间距取x的概率,并将两者相乘             
            x=xltemp;
            f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id) ;
            p_x_v0=2*x/radius^2;
            f_n_x=f_n_x+f_n_x_array*p_x_v0*delta_xlseg;
            
            x=xhtemp;
            f_n_x_array= func_10_f_n_x_array(n_max,x,R,lamda,delta,N_delta,way_id) ;
            p_x_v0=(2.*x./(pi.*power(radius,2)))  .*   acos( (power(x,2)+power(v0,2)-power(radius,2))./(2.*v0 .*x) ) ;
            f_n_x=f_n_x+f_n_x_array*p_x_v0*delta_xhseg; 
        end
        
        f_n_x_v0=f_n_x;
end