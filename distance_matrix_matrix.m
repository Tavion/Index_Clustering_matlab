function [ dist_mex_mex ] = distance_matrix_matrix( data1,data2 )
%DISTANCE_MATRIX_MATRIX �����data1��data2�и�����������
%   �õ���������Ԫ�أ�i��j��Ϊdata1�е�i�к�data2�е�j�еľ��롣
%   �������Ϊm2*m1�׾���
%   By Tavion Fu��in 2016.foliages96@outlook.com
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


