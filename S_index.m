function [ S_index ] = S_index( Data,label)
%S_INDEX %I_INDEX ����S index����������Ч�����ڲ�����ָ�ꡣ�����������������Լ����ڶ����������룬����������Ч����
%   DataΪ���ݣ���Ϊ���ݶ�����Ϊά�ȣ�LabelΪ���ǩ����������centroidsΪ���������������Ϊ���ݶ�����Ϊά�ȣ�
%   �ο����ף�����ۣ���ѧ��������ΰ����ɭ. ������Ч�Ե�������۷���[J]. �����������Ӧ�ã�2011,47��19����15-18.
%   By Tavion Fu��in 2016.foliages96@outlook.com
disp('Calculating Silhouette index(S)...');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
bx_all=[];
for i=1:k
    ni(i,:)=sum(label==i);%ni is column, and the row is k
end
for i=1:k;
    %caculating a��x��
    cluster_data_i=get_the_cluster(Data,label,i);
    dist_cx_cy=sum(pdist(cluster_data_i));
    ax=(1/ni(i,:))*dist_cx_cy;%һ��ֵ
    %caculating b(x)
    for j=1:k
        if i==j;
            bx_all(i,j)=inf;
        else
            cluster_data_j=get_the_cluster(Data,label,j);
            bx_all(i,j)=0.5*sum(sum(distance_matrix_matrix(cluster_data_i,cluster_data_j)))/ni(j,:);
        end
        bx=min(min(bx_all));%һ��ֵ
    end
    v(i,:)=(bx-ax)/ni(i,:)*(max(ax,bx));
end
S_index=sum(v)/k;
end


