function [ I_index] = I_index( Data,label,centroids,p )
%I_INDEX 计算I index，衡量聚类效果的内部评价指标。用类中心之间距离最大值来衡量类间分离度，使用类中各店与类中心距离之和来衡量类内紧密度。
%   p为参数，为一个常数。Data为数据，行为数据对象，列为维度；Label为类标签，列向量；centroids为类中心坐标矩阵，行为数据对象，列为维度；
%   参考文献：刘燕驰，高学东，国宏伟，武森. 聚类有效性的组合评价方法[J]. 计算机工程与应用，2011,47（19）：15-18.
%   By Tavion Fu，in 2016.foliages96@outlook.com
disp('Calculating I index(I)...');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
dist2_x_ci=zeros(k,1);%列向量,分配内存。
for i=1:k
    ni(i,:)=sum(label==i);%ni is column, and the row is number of every cluster data objects
end
if ~size(centroids,1)==k;
    error('number of centroids is not number of Label in I_index');
end
if ~size(centroids,2)==n;
    error('dimention of centroids and Data error in I_index');
end
%求类中心的距离的最大值。
max_dist_centroids=max(pdist(centroids));
%max_num=size(max_dist_centroids)
%求个点到Data中心距离和
Data_centroids=mean(Data);
dist_Dx_c=sum(distance_matrix_row(Data,Data_centroids));%列向量，m行。
%dist_Dx_c_num=size(dist_Dx_c)
%类内个点到类中心距离和。
for i=1:k;
    cluster_data=get_the_cluster(Data,label,i);
    dist2_x_ci(i,1)=sum(distance_matrix_row(cluster_data,centroids(i,:)));
end
dist_cx_ci=sum(dist2_x_ci);
%num_dist_cx_ci=size(dist_cx_ci)
%计算I_index
I_index=((dist_Dx_c*max_dist_centroids)/(k*dist_cx_ci))^p;
disp('Caculating I index(I) completed');
end

