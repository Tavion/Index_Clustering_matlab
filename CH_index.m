function [ CH_index ] = CH_index( Data,label,centroids )
%CH_INDEX
%����Calinski-Harabaszָ�꣬��������Ч�����ڲ�����ָ�ꡣ�������и����������ľ���ƽ�������������ڽ��ܶȣ��ø������ĵ������ݼ����ĵ�ľ���ƽ�������������ݼ��ķ���ȡ�
%   DataΪ���ݣ���Ϊ���ݶ�����Ϊά�ȣ�LabelΪ���ǩ����������centroidsΪ���������������Ϊ���ݶ�����Ϊά�ȣ�
%   �ο����ף�����ۣ���ѧ��������ΰ����ɭ. ������Ч�Ե�������۷���[J]. �����������Ӧ�ã�2011,47��19����15-18.
%   By Tavion Fu��in 2016.foliages96@outlook.com

disp('Calculating Calinski-Harabasz index(CH)... ');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
dist2_x_ci=zeros(k,1);%������
for i=1:k
    ni(i,:)=sum(label==i);%ni is column, and the row is k
end
if ~size(centroids,1)==k;
    error('number of centroids is not number of Label in CH_index');
end
if ~size(centroids,2)==n;
    error('dimention of centroids and Data error in CH_index');
end

%�������ݼ����ĵ�
Data_centroids=mean(Data);
%disp('caculating numerator of the CH ');

dist2_ci_c=distance_matrix_row(centroids,Data_centroids).^2;
numerator=sum(dist2_ci_c.*ni);
%���ڸ��㵽�����ľ���͡�
for i=1:k;
    cluster_data=get_the_cluster(Data,label,i);
    dist2_x_ci(i,1)=sum(distance_matrix_row(cluster_data,centroids(i,:)).^2);
end
denorminator=sum(dist2_x_ci);
CH_index=((m-k)*numerator)/((k-1)*denorminator);
disp('Caculating Calinski-Harabasz index(CH) completed');
end

