# 1. Hive是什么
- Hive在hadoop中相当于数据仓库的角色，本质是**将SQL转换为MapReduce程序**
- 可以实现通过 HiveQL（类似于 SQL 的查询语言）来进行数据汇总、查询和数据分析。
- 对我们来说，可以实现就算不了解 Java 或 MapReduce，也能够使用 Hive 来查询这些数据。避免了去写Map/Reduce，减少学习成本。

# 2. hive快速上手
以《大数据挖掘与机器学习》一书中的mobile数据为例

*PS：*本文认为读者均具备连接Linux服务器的能力并熟悉基本命令

## 1.4 运行hql文件
`hive -f 01_Import.hql`

 hive中的注释是 `--`
