# Index_Clustering_matlab
利用Matlab计算聚类效果
本文参考文献：刘燕驰，高学东，国宏伟，武森.聚类有效性组合评价方法.计算机工程与应用.2001，47（19）：15-17

目前主要涉及四个内部评价指标（CH，Dunn，I，S），针对数据没有原始标签时的评价。
默认矩阵中行为数据对象，列表示数据对象的维度。

========
## 使用方式
将函数下载到本地，将函数在matlab中添加到matlab的路径中。
几个基本函数：
### distance_matrix_matrix.m
该函数用于计算两个矩阵所有数据对象的距离（欧式距离）。这里主要用于计算分别在两个类中的数据对象的距离。
### distance_matrix_row.m
该函数用于计算一个矩阵中的每一行到一个行向量的距离（欧式距离）。这里主要用于计算一个类中的数据对象到类中心的距离。
### get_the_cluster
用于从一个数据中（已有类标签），获得指定类的所有数据对象。
### get_the_centroids
若没有类中心时，计算该类数据各维度的平均值，作为类中心。
### D_index
计算Dunn指标
### CH_index
计算CH指标
### I_index
计算I指标，p为用户指定参数。一般为正整数。
### S_index
计算S指标
### 综合各指标WSVF
对上面四个指标（标准化后），求加权平均数。若权重相同，WSVF即为上面四个指标的算术平均数。（由于比较简单，没有单独写成函数）
