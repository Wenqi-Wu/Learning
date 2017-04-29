-- STEP 0. 建立mobile数据库
DROP DATABASE IF EXISTS mobile CASCADE;
CREATE DATABASE mobile;

-- STEP 1. 创建储存数据表结构并将APP使用数据导入表中
USE mobile;  -- 使用mobile数据库
DROP TABLE IF EXISTS mobile;  -- 在建立新mobile表格之前删除已有的同名表格 
CREATE TABLE IF NOT EXISTS mobile(
uid   string   comment 'device uniq id',
app   string   comment 'app id',
class  string   comment 'system or user',
daybegin      int comment 'day begin',        
timebegin     string comment 'time begin',  
dayend       int comment 'day end',  
timeend      string comment 'time end',
duration  int  comment 'duration',
send     int  comment 'byte send',
receive   int  comment 'byte resceive')
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS  TEXTFILE;

-- 将数据从存储路径加载到表格中
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day20.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day21.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day22.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day23.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day24.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day25.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day26.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day27.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day28.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day29.txt' INTO TABLE mobile;
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/day30.txt' INTO TABLE mobile;


-- STEP 2. 建立APP类别数据表并将类别数据导入数据库
USE mobile;
DROP TABLE IF EXISTS app;
CREATE TABLE IF NOT EXISTS app(
appid   string  comment 'app uniq id',
cate    string  comment 'app category'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
STORED AS  TEXTFILE;
-- 将数据从存储路径加载到表格中
LOAD DATA LOCAL INPATH '/home/mobile/mobile_data/app_class.csv' INTO TABLE app;
