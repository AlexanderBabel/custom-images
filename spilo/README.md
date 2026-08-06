# spilo with vchord + TimescaleDB community edition

This is a custom spilo image that includes the vchord Postgres extension. It can be used for instance with the photo app [immich](https://github.com/immich-app/immich).

An example PostgreSQL configuration that would work with immich can be found in this [discussion](https://github.com/immich-app/immich/discussions/20634).

It is also built with `TIMESCALEDB_APACHE_ONLY=false`, so TimescaleDB ships as the community edition (`timescaledb-2-postgresql-*`, plus `timescaledb-toolkit-*`) instead of upstream's Apache-2 build. Compression, continuous aggregates and retention policies exist only in the community edition — the Apache-2 build in stock spilo has none of them.
