nginx_install.sh is for installing nginx
date_config․sh allows you to create a web page in which the date and time will be displayed, in order to update it every 30 seconds, you must set crontab -e with the specified content: " * * * * * /home/ubuntu/cron.sh / * * * * * sleep 30; /home/ubuntu/cron.sh"
