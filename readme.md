# Storage Migration
Map source bucket to `/root/src` and destination to `/root/dst`, use rsync to migrate all files.


## Build image
`$ docker build -t local/storage-migration .`

## Run
`$ docker run --privileged local/storage-migration`

## Times

```
08:37 | sending incremental file list
08:47 | upload started
08:57 | file096.bin
09:07 | file197.bin
09:17 | file311.bin
09:34 | file532.bin
10:00 | file834.bin
10:14 | end
```
---
```
sent 16,565,290 bytes  received 18,963 bytes  2,833.22 bytes/sec
total size is 16,508,279  speedup is 1.00
```