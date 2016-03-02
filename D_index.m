function [ D ] = D_index( Data,label )
%D_INDEX 计算Dunn指标（D index），衡量聚类效果的内部评价指标。用类与类之间的个点最小值衡量分离度。用类中最大类的直径作为类内密度。

%   Data为数据，行为数据对象，列为维度；Label为类标签，列向量；centroids为类中心坐标矩阵，行为数据对象，列为维度；
%   参考文献：刘燕驰，高学东，国宏伟，武森. 聚类有效性的组合评价方法[J]. 计算机工程与应用，2011,47（19）：15-18.
%   By Tavion Fu，in 2016.foliages96@outlook.com

disp('Calculating Dunn index(D)...');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
numerator_i=zeros(k,k);
c_max_dist=zeros(k,1);
%求最大直径
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

