-- STEP 3. 创建中间表，提取用户id、APP类别、使用天数、使用时长数据并对应加入APP类别数据（没有类别的APP条目被过滤掉）
USE mobile;
DROP view IF EXISTS pro1;
CREATE VIEW pro1 AS SElECT a.uid as uid, b.cate as class, a.dayend as day, sum(a.duration) as duration FROM mobile a LEFT JOIN app b ON a.app=b.appid GROUP BY a.uid, b.cate,a.dayend;

--STEP 4. 计算用户使用的有效天数数据（实现图10.1数据）
USE mobile;
DROP VIEW IF EXISTS pro2;
CREATE VIEW pro2 AS SElECT uid as uid, count(distinct(day)) as day FROM pro1 GROUP BY uid;

--STEP 5. 计算用户日均有效使用时长的均值，标准差，最大最小值（实现表10.2数据）
DROP view IF EXISTS pro3;
CREATE VIEW pro3 AS SElECT a.uid,a.class,log(sum(a.duration)/avg(b.day)+1) as active_duration FROM pro1 a INNER JOIN pro2 b ON a.uid=b.uid GROUP BY a.uid,a.class;

DROP view IF EXISTS pro4;
CREATE VIEW pro4 AS SElECT a.uid,b.cate as class FROM pro2 a CROSS JOIN (SELECT DISTINCT cate FROM app) b;

DROP view IF EXISTS pro5;
CREATE VIEW pro5 AS SElECT a.uid,a.class,IF(ISNULL(active_duration),0,active_duration) as active_duration FROM pro4 a LEFT JOIN pro3 b ON a.uid=b.uid AND a.class=b.class;

DROP view IF EXISTS pro6;
CREATE VIEW pro6 AS SElECT class, avg(active_duration) as avg_active_duration, STD(active_duration) as std_active_duration,min(active_duration) as min_active_duration, max(active_duration) as max_active_duration FROM pro5 GROUP BY class ORDER BY class;
