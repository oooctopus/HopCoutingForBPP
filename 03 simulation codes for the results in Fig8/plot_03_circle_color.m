% plot ��Բ������ Բ�ĺͰ뾶����Բ
function hs=plot_03_circle_color(x,y,R,color,width )
    
    hold on
    theta=0:2*pi*0.01:2*pi;
    X= x+ R.*cos(theta);
    Y= y+ R.*sin(theta);
    hs=plot(X,Y,'Color',color ,'linewidth',width);
    plot(x,y);
    axis equal   
end