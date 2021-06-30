# drop table
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
           yandex/clickhouse-client \
           --host clickhouse-server \
           --query "DROP TABLE if EXISTS ellx_test.division_channels"

# create table
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
CREATE TABLE ellx_test.division_channels (
  id UUID,
  district_headquarters_code UInt16,
  district_headquarters String,
  ccbji_channel_lv3_code UInt16,
  ccbji_channel_lv3 FixedString(13),
  key String,
  aggregate_region FixedString(20),
  aggregate_division FixedString(20),
  headquarter FixedString(20)
) Engine = MergeTree()
ORDER BY
  id PRIMARY KEY id"

# load data
cat csv/division_channels.csv | docker run -i --rm \
   --link clickhouse_ellx:clickhouse-server \
   yandex/clickhouse-client \
   --host clickhouse-server \
  --query="
INSERT INTO ellx_test.division_channels
(
  district_headquarters_code,
  district_headquarters,
  ccbji_channel_lv3_code,
  ccbji_channel_lv3,
  key,
  aggregate_region,
  aggregate_division,
  headquarter,
  id) FORMAT CSV"
