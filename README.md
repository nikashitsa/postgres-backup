nikashitsa/postgres-backup
======================
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg) [![](https://img.shields.io/docker/stars/nikashitsa/postgres-backup.svg)](https://hub.docker.com/r/nikashitsa/postgres-backup 'DockerHub') [![](https://img.shields.io/docker/pulls/nikashitsa/postgres-backup.svg)](https://hub.docker.com/r/nikashitsa/postgres-backup 'DockerHub')

Provides postgres backup to [S3](https://aws.amazon.com/s3/) under cron (based on Alpine Linux).

### Install

Please have a look at docker-compose.example.yml

```
...
    environment:
      REMOTE_URL: 's3://s3.eu-central-1.amazonaws.com/bucket-name/backups'
      POSTGRES_DUMP_PARAMS: '-c --if-exists -Fc -d mydatabase'
      POSTGRES_RESTORE_PARAMS: '-c --if-exists -d mydatabase'
      AWS_ACCESS_KEY_ID: 'PUT YOUR VALUE HERE'
      AWS_SECRET_ACCESS_KEY: 'PUT YOUR VALUE HERE'
...
```

1. You need to change `REMOTE_URL` with your value
2. Change `mydatabase` in `POSTGRES_DUMP_PARAMS` to your database name
3. Change `mydatabase` in `POSTGRES_RESTORE_PARAMS` to your database name
4. Set your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` values

### Start
```
docker-compose up -d
```

### Manual Exec

Additional scripts are provided to make it easier to manually invoke backups.
```
docker exec -it postgres_backup backup
docker exec -it postgres_backup status
docker exec -it postgres_backup restore
```

You can restore backup to specified time. More info [here](http://duplicity.nongnu.org/duplicity.1.html#sect8).
```
docker exec -it postgres_backup restore -t 1D
```
