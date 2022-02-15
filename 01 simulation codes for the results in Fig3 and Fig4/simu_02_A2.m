%�����ڵ㴫��뾶r����֪ n1���ڵ���Բ��o,r)��������ȷֲ�����n1���ڵ����չ��������,N+1 * N+1�ǵ���ά��

function s_A2_simu=simu_02_A2(ri,ro,r,n1,N)

    %����n1��AN1�ڵ������,XΪ������꣬YΪ��������    
    [X,Y]=simu_01_nodes_XY_generate(ri,ro,n1);    
    
   
    %��������(o,4*r,4*r)�����ɾ��ֵ���N�ȷ�,���� (N+1)*(N+1)ά,����PX PY�ֱ��ǵ������������
    %N=500; 
    PX=-(ro+r): 2*(r+ro)/N :(ro+r) ;   
    PY=-(ro+r): 2*(r+ro)/N :(ro+r) ; PY=PY';
    l_x=length(PX); l_y=length(PY) ;
    PX_array=repmat(PX, l_y ,1);
    PY_array=repmat(PY, 1 ,l_x);
    
    flag_array_sum=zeros(N+1,N+1);
    %���ڵ�i��AN1�ڵ㣬����������е�������룬����С��r���򱻸��ǣ�����Ϊ1��
    %��������AN1�ڵ㣬�����б��������ͣ����д���1�ı�ǣ���Ӧ�ĵ㣬������A2��
    for i=1:n1
        flag_array=zeros(N+1,N+1);
        x=X(i);y=Y(i);
        dis_array=sqrt(power(PX_array-x,2)+power(PY_array-y,2));
        flag_array(dis_array<r)=1;
        flag_array_sum=flag_array_sum+flag_array;
    end
    %�����ڵ���1�ı����1
    flag_array_sum(flag_array_sum>=1)=1;

    %��Բ��O���ǵĵ�
    flag_array=zeros(N+1,N+1);
    dis_array=sqrt(power(PX_array-0,2)+power(PY_array-0,2));
    flag_array(dis_array<ro)=1;

    %��A2���޳�A1���ǵĵ�
    A2_P_flag=flag_array_sum-flag_array;
    %��С��0�Ĳ�����0
    A2_P_flag(A2_P_flag<0)=0;
    %�ܹ���A2_N���㱻����
    A2_N=sum(A2_P_flag(:));
    %A2�������
    s_A2_simu= 2*(r+ro)*2*(r+ro)*( A2_N/((N+1)*(N+1)) ) ;
     
end
