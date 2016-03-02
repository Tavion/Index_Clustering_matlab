function [ D ] =distance_matrix_row( A,V )
%DISTANCE 矩阵A中各行与行向量V的欧式距离
%   输出一个列向量，列长度为矩阵A的行数。
%   By Tavion Fu，in 2016.foliages96@outlook.com
m=size(A,1);
n=size(A,2);
D=[];
for i=1:m
    D(i)=sum(((A(i,:)-V).^2));
end
D=D.^0.5;
D=D';
end

