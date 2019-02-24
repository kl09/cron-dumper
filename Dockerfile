FROM mysql:5.7

COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab

COPY mysql_backup.sh /
RUN chmod a+x /mysql_backup.sh

COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

RUN touch /var/log/cron.log

RUN apt-get update
RUN apt-get -y install cron

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD cron && tail -f /var/log/cron.log