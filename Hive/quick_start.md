# Hive入门
王梦天-2017/4/29
> 本文认为读者均具备连接Linux服务器的能力并熟悉基本命令

## 1. Hive是什么
- Hive在hadoop中相当于数据仓库的角色，本质是**将SQL转换为MapReduce程序**
- 可以实现通过 HiveQL（类似于 SQL 的查询语言）来进行数据汇总、查询和数据分析。
- 对我们来说，可以实现就算不了解 Java 或 MapReduce，也能够使用 Hive 来查询这些数据。避免了去写Map/Reduce，减少学习成本。

## 2. hive快速上手
以《大数据挖掘与机器学习》一书中的mobile数据（手机APP使用数据）为例

平台为阿里云服务器

### 2.1 通过hive获取手机APP使用数据
> 借鉴自董峰池师兄的[自行车项目快速入门](https://github.com/FengchiCrazy/bicycle_project/blob/master/quick_start.md#32-通过hive获取自行车数据)


### 2.2 数据导入
原始数据以文本文件的形式存储在目录`/home/mobile/mobile_data/`中，有day20~day30一共11天的数据。



`hive -f 01_Import.hql`

 hive中的注释是 `--`
