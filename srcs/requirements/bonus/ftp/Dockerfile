FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    vsftpd 

COPY tools/init-ftp.sh .
COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x init-ftp.sh

EXPOSE 21
EXPOSE 21100-21110

ENTRYPOINT [ "/init-ftp.sh" ]
CMD [ "vsftpd" ]