%»­ÌøÊý·Ö²¼Öù×´Í¼
function b=plot_02_bar(distri_cell)
    
%     figure('Color','white');
    distri_length_max=0;
    for i=1:length(distri_cell)
        distri_len=length( distri_cell{1,i} );
        if (distri_length_max< distri_len )
            distri_length_max=distri_len;
        end
    end

    distri_array=zeros( length(distri_cell), distri_length_max);

    for i=1:length(distri_cell)
        distri_len=length( distri_cell{1,i} );
        distri_array(i,1:distri_len)=distri_cell{1,i};
    end

    b=bar(distri_array','FaceColor','flat');
        
    
end
        
