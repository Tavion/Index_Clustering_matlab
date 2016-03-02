function [ S_index ] = S_index( Data,label)
%S_INDEX %I_INDEX 计算S index，衡量聚类效果的内部评价指标。用类间对象两两距离以及类内对象两两距离，来衡量聚类效果。
%   Data为数据，行为数据对象，列为维度；Label为类标签，列向量；centroids为类中心坐标矩阵，行为数据对象，列为维度；
%   参考文献：刘燕驰，高学东，国宏伟，武森. 聚类有效性的组合评价方法[J]. 计算机工程与应用，2011,47（19）：15-18.
%   By Tavion Fu，in 2016.foliages96@outlook.com
disp('Calculating Silhouette index(S)...');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
bx_all=[];
for i=1:k
    ni(i,:)=sum(label==i);%ni is column, and the row is k
end
for i=1:k;
    %caculating a（x）
    cluster_data_i=get_the_cluster(Data,label,i);
    dist_cx_cy=sum(pdist(cluster_data_i));
    ax=(1/ni(i,:))*dist_cx_cy;%一个值
    %caculating b(x)
    for j=1:k
        if i==j;
            bx_all(i,j)=inf;
        else
            cluster_data_j=get_the_cluster(Data,label,j);
            bx_all(i,j)=0.5*sum(sum(distance_matrix_matrix(cluster_data_i,cluster_data_j)))/ni(j,:);
        end
        bx=min(min(bx_all));%一个值
    end
    v(i,:)=(bx-ax)/ni(i,:)*(max(ax,bx));
end
S_index=sum(v)/k;
end


