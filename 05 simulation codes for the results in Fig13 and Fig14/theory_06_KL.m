%求概率分布列P和概率分布列Q的KL散度
function KL=theory_06_KL(matrix1,matrix2)

    l1=length(matrix1); l2=length(matrix2);

    newmatrix=zeros(2,max(l1,l2));
    newmatrix(1,1:l1)=matrix1;
    newmatrix(2,1:l2)=matrix2;

    KL=0;
    for i=1:length(newmatrix(1,:))
        if (newmatrix(2,i)~=0) &&  (newmatrix(1,i)~=0)
           KL=KL+ newmatrix(1,i)*log2(newmatrix(1,i)/newmatrix(2,i));
        end
    end
end


 