function [ I_index] = I_index( Data,label,centroids,p )
%I_INDEX ����I index����������Ч�����ڲ�����ָ�ꡣ��������֮��������ֵ������������ȣ�ʹ�����и����������ľ���֮�����������ڽ��ܶȡ�
%   pΪ������Ϊһ��������DataΪ���ݣ���Ϊ���ݶ�����Ϊά�ȣ�LabelΪ���ǩ����������centroidsΪ���������������Ϊ���ݶ�����Ϊά�ȣ�
%   �ο����ף�����ۣ���ѧ��������ΰ����ɭ. ������Ч�Ե�������۷���[J]. �����������Ӧ�ã�2011,47��19����15-18.
%   By Tavion Fu��in 2016.foliages96@outlook.com
disp('Calculating I index(I)...');
m=size(Data,1);
n=size(Data,2);
k=length(unique(label));
dist2_x_ci=zeros(k,1);%������,�����ڴ档
for i=1:k
    ni(i,:)=sum(label==i);%ni is column, and the row is number of every cluster data objects
end
if ~size(centroids,1)==k;
    error('number of centroids is not number of Label in I_index');
end
if ~size(centroids,2)==n;
    error('dimention of centroids and Data error in I_index');
end
%�������ĵľ�������ֵ��
max_dist_centroids=max(pdist(centroids));
%max_num=size(max_dist_centroids)
%����㵽Data���ľ����
Data_centroids=mean(Data);
dist_Dx_c=sum(distance_matrix_row(Data,Data_centroids));%��������m�С�
%dist_Dx_c_num=size(dist_Dx_c)
%���ڸ��㵽�����ľ���͡�
for i=1:k;
    cluster_data=get_the_cluster(Data,label,i);
    dist2_x_ci(i,1)=sum(distance_matrix_row(cluster_data,centroids(i,:)));
end
dist_cx_ci=sum(dist2_x_ci);
%num_dist_cx_ci=size(dist_cx_ci)
%����I_index
I_index=((dist_Dx_c*max_dist_centroids)/(k*dist_cx_ci))^p;
disp('Caculating I index(I) completed');
end

