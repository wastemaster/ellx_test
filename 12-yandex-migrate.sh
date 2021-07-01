# channels
docker run -i --rm \
          -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
          yandex/clickhouse-client \
          --host ${HOST} \
          --secure \
          --user user1 \
          --database db1 \
          --port 9440 \
          --query "DROP TABLE if EXISTS db1.channels"

docker run -i --rm \
          -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
          yandex/clickhouse-client \
          --host ${HOST} \
          --secure \
          --user user1 \
          --database db1 \
          --port 9440 \
          --query "
CREATE TABLE db1.channels (
id UUID,
ccbji_channel_lv3_code UInt16,
ccbji_channel_lv3 FixedString(13),
conversion_master FixedString(7)
) Engine = MergeTree()
ORDER BY
id PRIMARY KEY id"

cat csv/channels.csv | docker run -i --rm \
          -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
          yandex/clickhouse-client \
          --host ${HOST} \
          --secure \
          --user user1 \
          --database db1 \
          --port 9440 \
          --query="
INSERT INTO db1.channels
(ccbji_channel_lv3_code, ccbji_channel_lv3, conversion_master, id)
FORMAT CSV"

# division_channels
docker run -i --rm \
          -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
          yandex/clickhouse-client \
          --host ${HOST} \
          --secure \
          --user user1 \
          --database db1 \
          --port 9440 \
          --query "DROP TABLE if EXISTS db1.division_channels"

docker run -i --rm \
          -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
          yandex/clickhouse-client \
          --host ${HOST} \
          --secure \
          --user user1 \
          --database db1 \
          --port 9440 \
          --query "
CREATE TABLE db1.division_channels (
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
          -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
          yandex/clickhouse-client \
          --host ${HOST} \
          --secure \
          --user user1 \
          --database db1 \
          --port 9440 \
          --query="
INSERT INTO db1.division_channels
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

  # row
  docker run -i --rm \
            -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
            yandex/clickhouse-client \
            --host ${HOST} \
            --secure \
            --user user1 \
            --database db1 \
            --port 9440 \
            --query "DROP TABLE if EXISTS db1.raw"

  docker run -i --rm \
            -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
            yandex/clickhouse-client \
            --host ${HOST} \
            --secure \
            --user user1 \
            --database db1 \
            --port 9440 \
            --query "
CREATE TABLE db1.raw (
  id UUID,
  channel String,
  region String,
  division String,
  headquarter String,
  channel_category String,
  package_segment String,
  year String,
  year_month String,
  sales_headquarters_code String,
  sales_division String,
  district_headquarters_code String,
  district_headquarters String,
  ccbji_channel_lv1_code String,
  ccbji_channel_lv1 String,
  ccbji_channel_lv2_code String,
  ccbji_channel_lv2 String,
  ccbji_channel_lv3_code String,
  ccbji_channel_lv3 FixedString(13),
  product_code String,
  product String,
  bapc String,
  nsr String,
  gp String,
  ccej_brand_code String,
  ccej_brand String,
  ccej_subbrand_code String,
  ccej_subbrand String,
  ccej_package_code String,
  ccej_package String,
  category_code String,
  category String,
  subcategory_code String,
  subcategory String,
  ddis_beverage_product_group_code String,
  ddis_beverage_product_group String,
  ddis_container_type_code String,
  ddis_container_type String,
  ddis_package_code String,
  ddis_package String,
  ddis_service_type_code String,
  ddis_service_type String,
  product_name String
) Engine = MergeTree()
ORDER BY
  id PRIMARY KEY id"

  # load data
  cat csv/raw.csv | docker run -i --rm \
            -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
            yandex/clickhouse-client \
            --host ${HOST} \
            --secure \
            --user user1 \
            --database db1 \
            --port 9440 \
            --query="
INSERT INTO db1.raw
(
  channel,
  region,
  division,
  headquarter,
  channel_category,
  package_segment,
  year,
  year_month,
  sales_headquarters_code,
  sales_division,
  district_headquarters_code,
  district_headquarters,
  ccbji_channel_lv1_code,
  ccbji_channel_lv1,
  ccbji_channel_lv2_code,
  ccbji_channel_lv2,
  ccbji_channel_lv3_code,
  ccbji_channel_lv3,
  product_code,
  product,
  bapc,
  nsr,
  gp,
  ccej_brand_code,
  ccej_brand,
  ccej_subbrand_code,
  ccej_subbrand,
  ccej_package_code,
  ccej_package,
  category_code,
  category,
  subcategory_code,
  subcategory,
  ddis_beverage_product_group_code,
  ddis_beverage_product_group,
  ddis_container_type_code,
  ddis_container_type,
  ddis_package_code,
  ddis_package,
  ddis_service_type_code,
  ddis_service_type,
  product_name,
  id) FORMAT CSV"

  # view
  # drop view
  docker run -i --rm \
            -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
            yandex/clickhouse-client \
            --host ${HOST} \
            --secure \
            --user user1 \
            --database db1 \
            --port 9440 \
            --query="DROP VIEW if EXISTS db1.a5"

  # create view
  docker run -i --rm \
            -v ${PWD}/.clickhouse-client:/root/.clickhouse-client \
            yandex/clickhouse-client \
            --host ${HOST} \
            --secure \
            --user user1 \
            --database db1 \
            --port 9440 \
            --query="
  CREATE VIEW db1.a5 AS
  SELECT
    raw.*,
    division_channels.*,
    channels.*,
    LEFT(raw.year_month, 4) as extracted_year
  FROM db1.raw
  LEFT JOIN db1.division_channels
  ON division_channels.key = concat(raw.district_headquarters, raw.ccbji_channel_lv3)
  LEFT JOIN db1.channels
  ON channels.ccbji_channel_lv3 = raw.ccbji_channel_lv3"
