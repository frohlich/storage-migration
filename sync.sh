#!/bin/bash
set -e

mount_aws() {
    local BUCKET_NAME=$1
    local PASSWD_PATH=$2
    local MOUNT_POINT=$3

    /usr/bin/s3fs ${BUCKET_NAME} ${MOUNT_POINT} \
        -o passwd_file=${PASSWD_PATH}
}

mount_gcp() {
    local BUCKET_NAME=$1
    local PASSWD_PATH=$2
    local MOUNT_POINT=$3

    /usr/bin/s3fs ${BUCKET_NAME} ${MOUNT_POINT} \
        -o nomultipart \
        -o passwd_file=${PASSWD_PATH} \
        -o sigv2 \
        -o url=https://storage.googleapis.com
}

# Mount SRC
mount_aws "ff-sites" "src_passwd" "./src"

# Mount DST
mount_gcp "ff-deploy" "dst_passwd" "./dst"

rsync --progress -av --exclude-from='./exclude_files.txt' ./src ./dst