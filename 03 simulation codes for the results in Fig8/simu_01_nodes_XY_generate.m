%�������ɽڵ�����
function [X,Y]=simu_01_nodes_XY_generate(ri,ro,n)

    [X,Y]=func_01_nodes_XY_generate(ri,ro,n);
        
    
%     %��ͼ�ڵ�ֲ�ͼ
%         hold on
%         plot_01_circle(0,0,ro)
%         hold on
%         plot_01_circle(0,0,ri)        
%         plot(X,Y,'b.')

end

%�Ӻ���1����֪�ھ�ri,�⾶ro,����ڵ�������꣬
function [X,Y]=func_01_nodes_XY_generate(ri,ro,n)
if ri==0 %����ھ���Ϊ0
    angle=rand(1,n)*2*pi; %(0,2*pi)֮����ȷֲ����ݵ� 
    rx=ro*sqrt(rand(1,n));%��0,1��֮��ro ^2���ȷֲ����ݵ�
    %AN �ڵ��X Y����
    X=rx.*cos(angle);
    Y=rx.*sin(angle);    
else %����ھ�Ϊ0
    angle = 2*pi*rand(n,1);
    rx = unifrnd(1,(ro/ri)^2,n,1);
    X = ri*sqrt(rx).*cos(angle);
    Y = ri*sqrt(rx).*sin(angle);
end

end