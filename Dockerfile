FROM ubuntu:jammy

RUN apt-get update && apt-get install -y && apt-get -y install rsync s3fs

WORKDIR /root

ADD src_passwd .
ADD dst_passwd .
ADD sync.sh .
ADD exclude_files.txt .

RUN chmod 600 src_passwd
RUN chmod 600 dst_passwd
RUN chmod +x sync.sh

RUN mkdir src
RUN mkdir dst
