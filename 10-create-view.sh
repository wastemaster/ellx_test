# drop view
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
           yandex/clickhouse-client \
           --host clickhouse-server \
           --query "DROP VIEW if EXISTS ellx_test.a5"

# create view
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
CREATE VIEW ellx_test.a5 AS
SELECT
  raw.*,
  division_channels.*,
  channels.*,
  LEFT(raw.year_month, 4) as extracted_year
FROM ellx_test.raw
LEFT JOIN ellx_test.division_channels
ON division_channels.key = concat(raw.district_headquarters, raw.ccbji_channel_lv3)
LEFT JOIN ellx_test.channels
ON channels.ccbji_channel_lv3 = raw.ccbji_channel_lv3"
