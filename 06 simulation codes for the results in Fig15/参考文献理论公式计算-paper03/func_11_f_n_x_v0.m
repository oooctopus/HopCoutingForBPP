%����BPP������v0(S��Բ�ļ��)����ʱ��f_n�������ֲ��У�f(n|x)��xȡȫ������
function f_n_x_v0=func_11_f_n_x_v0( v0,n_max,R,lamda,delta,N_delta,way_id,radius)
 
        f_n_x=zeros(1,n_max);
        x_delta=0.01;
              
        %ָ��v0ȡֵ��  ��x���зֶ� ��x����ʱ�ֳ�����
        %xlsegment-[0,rd-v0]  xhsegment-[rd-v0,rd+v0]    ��r����ʵ���������
        delta_xlseg=x_delta*(radius-v0-0);
        xlsegment=0+delta_xlseg : delta_xlseg  :radius-v0-delta_xlseg;                                                               
        delta_xhseg=x_delta*(radius+v0-(radius-v0));
        xhsegment=radius-v0+delta_xhseg  :  delta_xhseg  :radius+v0-delta_xhseg;
         
        for j=1:(length(xlsegment))
            disp(['j=',num2str(j)])
            xltemp=xlsegment(j);                          %ָ��r���ϰ�ε�ֵ  ����ȫ�ֱ���rltemp
            xhtemp=xhsegment(j);                          %ָ��r���°�ε�ֵ  ����ȫ�ֱ���rhtemp

            %���ݸ�����xֵ�������Ӧ��f_n_x�ֲ��У��Լ�S-D���ȡx�ĸ���,�����������             
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