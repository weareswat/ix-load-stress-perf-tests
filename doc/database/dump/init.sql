CREATE DATABASE IF NOT EXISTS ix_dev;
use ix_dev;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '' WITH GRANT OPTION;
FLUSH PRIVILEGES;
source /docker-entrypoint-initdb.d/sqldev/ix_dev.sql;
