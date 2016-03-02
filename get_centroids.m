function [ centroids ] = get_centroids( Data,label )
%GET_CENTROIDS ��Ծ��������ݣ���ø������ݵ����ġ�
%   ��������˵�������ո�ά�Ⱦ�ֵ��á����centroids�б�ʾ���ĵ����ݶ�����ʱ����ά��ֵ��
%   By Tavion Fu��In 2016��foliages96@outlook.com
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
 
