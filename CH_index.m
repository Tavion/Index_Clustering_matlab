function [ CH_index ] = CH_index( Data,label,centroids )
%CH_INDEX
%计算Calinski-Harabasz指标，衡量聚类效果的内部评价指标。计算列中个点与类中心距离平方和来度量类内紧密度，用各类中心点与数据集中心点的距离平方和来度量数据集的分离度。
%   Data为数据，行为数据对象，列为维度；Label为类标签，列向量；centroids为类中心坐标矩阵，行为数据对象，列为维度；
%   参考文献：刘燕驰，高学东，国宏伟，武森. 聚类有效性的组合评价方法[J]. 计算机工程与应用，2011,47（19）：15-18.
%   By Tavion Fu，in 2016.foliages96@outlook.com

disp('Calculating Calinski-Harabasz index(CH)... ');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
dist2_x_ci=zeros(k,1);%列向量
for i=1:k
    ni(i,:)=sum(label==i);%ni is column, and the row is k
end
if ~size(centroids,1)==k;
    error('number of centroids is not number of Label in CH_index');
end
if ~size(centroids,2)==n;
    error('dimention of centroids and Data error in CH_index');
end

%计算数据集中心点
Data_centroids=mean(Data);
%disp('caculating numerator of the CH ');

dist2_ci_c=distance_matrix_row(centroids,Data_centroids).^2;
numerator=sum(dist2_ci_c.*ni);
%类内个点到类中心距离和。
for i=1:k;
    cluster_data=get_the_cluster(Data,label,i);
    dist2_x_ci(i,1)=sum(distance_matrix_row(cluster_data,centroids(i,:)).^2);
end
denorminator=sum(dist2_x_ci);
CH_index=((m-k)*numerator)/((k-1)*denorminator);
disp('Caculating Calinski-Harabasz index(CH) completed');
end

