# 注意crontab 与date共用时需要对%进行escape
# 此外，crontab默认提供的PATH只有/bin /usr/bin

40 * * * * /home/hary/bin/backup.pl `/bin/date +\%Y\%m\%d`
