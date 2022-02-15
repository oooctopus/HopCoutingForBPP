% plot 画圆，输入 圆心和半径，作圆
function plot_01_circle(x,y,R)
    
    theta=0:2*pi*0.01:2*pi;
    X= x+ R.*cos(theta);
    Y= y+ R.*sin(theta);
    plot(X,Y);
    hold on
    plot(x,y,'o');
end