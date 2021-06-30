# drop table
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
           yandex/clickhouse-client \
           --host clickhouse-server \
           --query "DROP TABLE if EXISTS ellx_test.raw"

# create table
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
CREATE TABLE ellx_test.raw (
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
  ccbji_channel_lv3 String,
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
   --link clickhouse_ellx:clickhouse-server \
   yandex/clickhouse-client \
   --host clickhouse-server \
  --query="
INSERT INTO ellx_test.raw
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
