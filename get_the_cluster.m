function [ cluster_data ] = get_the_cluster( data,gnd,num )
%GET_THE_CLUSTER 对已分类的数据获得类标号为num的所有数据
%num为欲获取的类标签。
%   By Tavion Fu，in 2016，foliages96@outlook.com

%disp('get the cluster number=');disp(num);
m=size(data,1);
n=size(data,2);
nClass=length(unique(gnd));
if ismember(num,gnd)==1;
else disp('the target of cluster is out of the label list');
end
cluster0=diag((gnd==num))*data;
for i=m:-1:1;
    if  ~any(cluster0(i,:));
    cluster0(i,:)=[];
    end
end
cluster_data=cluster0;
end

