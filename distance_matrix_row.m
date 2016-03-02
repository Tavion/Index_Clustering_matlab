function [ D ] =distance_matrix_row( A,V )
%DISTANCE ����A�и�����������V��ŷʽ����
%   ���һ�����������г���Ϊ����A��������
%   By Tavion Fu��in 2016.foliages96@outlook.com
m=size(A,1);
n=size(A,2);
D=[];
for i=1:m
    D(i)=sum(((A(i,:)-V).^2));
end
D=D.^0.5;
D=D';
end

