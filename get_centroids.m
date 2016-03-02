function [ centroids ] = get_centroids( Data,label )
%GET_CENTROIDS 针对聚类后的数据，获得各类数据的中心。
%   本函数所说中心依照各维度均值获得。输出centroids行表示中心的数据对象，列时中心维度值。
%   By Tavion Fu，In 2016，foliages96@outlook.com
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
centroids=zeros(k,n);
for i=1:k;
    
cluster_data=get_the_cluster(Data,label,i);
if size(cluster_data,1)==1;
    centroids_i=cluster_data;
else
centroids_i=mean(cluster_data);
end
centroids(i,:)=centroids_i;
end
end
 
