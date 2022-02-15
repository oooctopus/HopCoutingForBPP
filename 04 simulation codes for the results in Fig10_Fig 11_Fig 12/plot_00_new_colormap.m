function new_map=plot_00_new_colormap( colorflag,p2,map_st,map_en)
ma_color=map_st(2);%大，浅色
mi_color=map_en(2);%小，深色

 
if  colorflag>=0.05
    new_map=zeros(20,3) ;
    new_map(:,2)=linspace((5*ma_color+3*mi_color)/8,mi_color,20 );%深色色图
else if colorflag>=0.02
         new_map=zeros(20,3) ;
         new_map(:,2)=linspace((6*ma_color+2*mi_color)/8,(7*mi_color+ma_color)/8,20 );
    else if colorflag+p2>=0.8
         new_map=zeros(18,3) ;
         new_map(:,2)=linspace((7*ma_color+mi_color)/8,(6*mi_color+2*ma_color)/8,18 );  
            else if colorflag+p2>=0.4
                    new_map=zeros(10,3);
                  new_map(:,2)=linspace( ma_color ,(5*mi_color+3*ma_color)/8,10 );%浅色色图  
                else
                    new_map=zeros(10,3);
                    new_map(:,2)=linspace(ma_color,(4*ma_color+4*mi_color)/6,10 );%浅色色图
                end
         end
     end
end
 

new_map(:,1)=new_map(:,1)+map_st(1);
new_map(:,3)=new_map(:,3)+map_st(3);
new_map=new_map/255 ;
end

 
