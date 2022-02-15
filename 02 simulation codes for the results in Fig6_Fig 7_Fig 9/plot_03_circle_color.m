% plot 画圆，输入 圆心和半径，作圆
function hs=plot_03_circle_color(x,y,R,color,width )
    
    hold on
    theta=0:2*pi*0.01:2*pi;
    X= x+ R.*cos(theta);
    Y= y+ R.*sin(theta);
    hs=plot(X,Y,'Color',color ,'linewidth',width);
    plot(x,y);
    axis equal   
end