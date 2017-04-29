# Hive入门
王梦天-2017/4/29
> 本文认为读者均具备连接Linux服务器的能力并熟悉基本命令

## 1. Hive是什么
- Hive在hadoop中相当于数据仓库的角色，本质是**将SQL转换为MapReduce程序**
- 可以实现通过 HQL（类似于 SQL 的查询语言）来进行数据汇总、查询和数据分析。
- 对我们来说，可以实现就算不了解 Java 或 MapReduce，也能够使用 Hive 来查询这些数据。避免了去写Map/Reduce，减少学习成本。

## 2. hive快速上手
以《大数据挖掘与机器学习》一书中的mobile数据（手机APP使用数据）为例,平台为学院的阿里云服务器

### 2.1 通过hive获取手机APP使用数据
> 借鉴自董峰池师兄的[自行车项目快速入门](https://github.com/FengchiCrazy/bicycle_project/blob/master/quick_start.md)

#### 2.1.1 查询数据并导出
通过一个例子来讲述一下Hive获取手机APP使用数据的过程，对于HQL语言，可以暂时理解为SQL，后文会具体介绍其区别。

| 步骤 | 语句 | 解释 |
| :----: | ---- | ---- |
| 1 | 在Linux命令行中输入`hive` | 进入Hive界面，在Hive环境下输入的是HQL语句（类似SQL），以`;`作为语句的结尾标志，意味着每一条语句必须用`;`结尾，也可以利用这一特性进行多行输入 |
| 2 | `show databases;` | 查看服务器的数据库 | 
| 3 | `use mobile;` | `use <databasename>` 选择使用bicycle数据库,必须选定了database之后才能对table进行操作 |
| 4 | `show tables;` | 查看选中数据库中所有表 |
| 5 | `desc mobile;` | `desc <tablename>` 查看tablename中变量详细信息 |
| 6 | `select * from mobile limit 10;` | 查询语句，可以用`limit`自行定义行数。这一步可以简单查看数据结构以便编写SQL语句 |
| 7 | `exit;` | 退出Hive，进入Linux命令行，进行文件导出操作 |
| 8 | 在**Linux命令行**中输入`hive -e "use mobile; select * from mobile limit 10;" > result.csv` | 导出查询结果到文件 |

最后一句命令比较复杂，它由以下几部分构成
- `hive` 表明这一段语句是由hive执行的
- `-e` hive命令的选项，表示执行后面这段引号中的HQL语句，若不指定此选项则hive不知道要执行后面这段语句
- `"use mobile; select * from mobile limit 10;"` 用引号括起来的HQL代码，因为前文指定了选项`-e`所以会执行这段代码
- `> result.csv` 导出到文件，`>`箭头表示输出到后面这个文件中，若文件不存在将会创建，存在则会覆盖

#### 执行文件中的查询语句
那么问题来了，这里HQL语句比较短，可以直接写在`hive -e`命令后面。那么如果我想做一个复杂一点的查询，不仅仅有`SELECT * FROM`，还要有`CASE WHEN`、`LEFT JOIN`、`WHERE`、`GROUP BY`和`ORDER BY`怎么办？

我们当然可以在本地写好复制到命令行中，但更为理想的解决方案是写一个`.hql`的脚本文件，然后上传到服务器，让hive读取它并执行。

这时候就要用到刚才说到的选项了，使用选项`-f`，就可以执行脚本文件中的语句了。

例：在Linux命令行中输入`hive -f xxx.hql > xxx.csv`，即可执行文件`xxx.hql`中的查询并输出到`xxx.csv`中。

### 2.2 数据库创建和数据导入
由于我已经创建好数据和
原始数据以文本文件的形式存储在目录`/home/mobile/mobile_data/`中，有day20~day30一共11天的数据。

### 2.3 使用hql进行描述性分析和



`hive -f 01_Import.hql`

 hive中的注释是 `--`
