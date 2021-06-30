# dump tables
docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
SELECT * from ellx_test.channels" > tsv/channels.tsv

docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
SELECT * from ellx_test.division_channels" > tsv/division_channels.tsv

docker run -i --rm --link clickhouse_ellx:clickhouse-server \
            yandex/clickhouse-client \
            --host clickhouse-server \
            --query "
SELECT * from ellx_test.raw" > tsv/raw.tsv
