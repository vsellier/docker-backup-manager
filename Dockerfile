FROM debian:10

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y backup-manager mariadb-client ssh rsync bzip2

ENV LOGGER_LEVEL warning
ENV BACKUP_TYPE ""
ENV ARCHIVE_TTL 5
ENV TARGET /var/backups
ENV ARCHIVE_PREFIX "bm"
ENV DATABASES "mysql"
ENV DB_ADMIN_LOGIN "root"
ENV DB_ADMIN_PASS "changeme"
ENV DB_HOST "db"
ENV MYSQL_EXTRA_OPTIONS ""

# UPLOAD
ENV UPLOAD_METHOD "none"
ENV UPLOAD_HOSTS ""
ENV UPLOAD_DESTINATION "/var/archives/uploads"
ENV UPLOAD_SSH_USER "bmngr"
ENV UPLOAD_SSH_KEY ""
ENV UPLOAD_RSYNC_DESTINATION ""
ENV UPLOAD_RSYNC_BLACKLIST "lost+found"

COPY backup-manager.conf /etc/backup-manager.conf

ENTRYPOINT /usr/sbin/backup-manager
