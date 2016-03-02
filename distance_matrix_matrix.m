function [ dist_mex_mex ] = distance_matrix_matrix( data1,data2 )
%DISTANCE_MATRIX_MATRIX 求矩阵data1和data2中个行向量距离
%   得到矩阵，其中元素（i，j）为data1中第i行和data2中第j行的距离。
%   输出矩阵为m2*m1阶矩阵。
%   By Tavion Fu，in 2016.foliages96@outlook.com
m1=size(data1,1);
m2=size(data2,1);
n=size(data1,2);
n2=size(data2,2);
if n==n2;
else error('data1 and data2 in different dimentional space in distance_matrix_matrix');
end
for i=1:m2
    dist_mex_mex(i,:)=distance_matrix_row(data1,data2(i,:));
end
end


