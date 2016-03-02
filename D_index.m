function [ D ] = D_index( Data,label )
%D_INDEX ����Dunnָ�꣨D index������������Ч�����ڲ�����ָ�ꡣ��������֮��ĸ�����Сֵ��������ȡ�������������ֱ����Ϊ�����ܶȡ�

%   DataΪ���ݣ���Ϊ���ݶ�����Ϊά�ȣ�LabelΪ���ǩ����������centroidsΪ���������������Ϊ���ݶ�����Ϊά�ȣ�
%   �ο����ף�����ۣ���ѧ��������ΰ����ɭ. ������Ч�Ե�������۷���[J]. �����������Ӧ�ã�2011,47��19����15-18.
%   By Tavion Fu��in 2016.foliages96@outlook.com

disp('Calculating Dunn index(D)...');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
numerator_i=zeros(k,k);
c_max_dist=zeros(k,1);
%�����ֱ��
for i=1:k
    cluster_data_i=get_the_cluster(Data,label,i);
    if size(cluster_data_i,1)==1; 
       disp('this cluster have only 1 row');
    else
    c_max_dist(i,:)=max(pdist(cluster_data_i));
    end
    for j=1:k
        if i==j;
           numerator_i(i,j)=inf;
        else
            cluster_data_j=get_the_cluster(Data,label,j);
            numerator_i(i,j)=min(min(distance_matrix_matrix(cluster_data_i,cluster_data_j)));
        end
        
    end
end
denominator=max(c_max_dist);
numerator=min(min(numerator_i));
D=numerator/denominator;
disp('Caculating Dunn index(D) completed');
end

