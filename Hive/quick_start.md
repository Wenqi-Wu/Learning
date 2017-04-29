# Hive入门
王梦天-2017/4/29
> 本文认为读者均具备连接Linux服务器的能力并熟悉基本命令

## 1. Hive是什么
- Hive在hadoop中相当于数据仓库的角色，本质是**将SQL转换为MapReduce程序**
- 可以实现通过 HiveQL（类似于 SQL 的查询语言）来进行数据汇总、查询和数据分析。
- 对我们来说，可以实现就算不了解 Java 或 MapReduce，也能够使用 Hive 来查询这些数据。避免了去写Map/Reduce，减少学习成本。

## 2. hive快速上手
以《大数据挖掘与机器学习》一书中的mobile数据（手机APP使用数据）为例,平台为学院的阿里云服务器

### 2.1 通过hive获取手机APP使用数据
> 借鉴自董峰池师兄的[自行车项目快速入门](https://github.com/FengchiCrazy/bicycle_project/blob/master/quick_start.md)

通过一个例子来讲述一下Hive获取手机APP使用数据的过程。

| 序号 | 语句 | 解释 |
| :----: | ---- | ---- |
| 1 | 在Linux命令行中输入`hive` | 进入Hive界面，在Hive环境下输入的是SQL语句，以`;`作为语句的结尾标志，意味着每一条语句必须用`;`结尾，也可以利用这一特性进行多行输入 |
| 2 | `show databases;` | 查看服务器的数据库 | 
| 3 | `use mobile;` | `use <databasename>` 选择使用bicycle数据库,必须选定了database之后才能对table进行操作 |
| 4 | `show tables;` | 查看选中数据库中所有表 |
| 5 | `desc mobile;` | `desc <tablename>` 查看tablename中变量详细信息 |
| 6 | `select * from mobile limit 10;` | 查询语句，可以自行定义行数。这一步可以理解为测试，找到自己需要的数据集，为后面导出文件做准备 |
| 7 | `exit;` | 退出Hive，进入Linux命令行，进行文件导出操作 |
| 8 | 在Linux命令行中输入`hive -e "use mobile; select * from mobile limit 10;" > result.csv` | 导出查询结果到文件 |


### 2.2 数据导入
原始数据以文本文件的形式存储在目录`/home/mobile/mobile_data/`中，有day20~day30一共11天的数据。



`hive -f 01_Import.hql`

 hive中的注释是 `--`
