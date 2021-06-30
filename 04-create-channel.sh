# drop database
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
             yandex/clickhouse-client \
             --host clickhouse-server \
             --query "DROP DATABASE IF EXISTS ellx_test"

# create database
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
             yandex/clickhouse-client \
             --host clickhouse-server \
             --query "CREATE DATABASE ellx_test"



# drop channel table
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
           yandex/clickhouse-client \
           --host clickhouse-server \
           --query "DROP TABLE if EXISTS ellx_test.channels"

# create channel table
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
CREATE TABLE ellx_test.channels (
  id UUID,
  ccbji_channel_lv3_code UInt16,
  ccbji_channel_lv3 FixedString(13),
  conversion_master FixedString(7)
) Engine = MergeTree()
ORDER BY
  id PRIMARY KEY id"

# load data
cat csv/channels.csv | docker run -i --rm \
   --link clickhouse_ellx:clickhouse-server \
   yandex/clickhouse-client \
  --host clickhouse-server \
  --query="
INSERT INTO ellx_test.channels
(ccbji_channel_lv3_code, ccbji_channel_lv3, conversion_master, id)
FORMAT CSV"
