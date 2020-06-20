#!/bin/bash
#This scrip is to have an overview of your web server in one simple tools
#This script has been tailor in instance CentOS 8, some commands or path will not work and need to be configured
clear
echo " "
echo "### Welcome to Server-Control this script collect the main commands to analyze the service and log file of your web server. ###"
echo " "
#choice variable collect all the option name of the commands" 
choice="Apache-Status MySql-Status Invalid-Access-Log Valid-Access-Log Journalctl-Httpd Http-Error DB-Log-Error PHP-Log-Error HTTP-Error-404"

select option in $choice;
do
case "$option" in
#Apache service status
        Apache-Status)
        echo "# Service Apache Status #"
        echo " "
        systemctl status httpd
        ;;
#MySQL service status
        MySql-Status)
        echo "# Service MySql Status #"
        echo " "
        systemctl status mysql
        ;;
#Invalid access log
        Invalid-Access-Log)
        echo " "
        echo "# Log of Invalid Users Access #"
        COUNTUSER=$(journalctl -q | grep "Failed password for invalid user" | cut -d" "  -f13 | uniq | wc -l)
        echo " "
        echo " $COUNTUSER Users Attempted To Access The Server."
        echo " "
        read -p "Please insert number of the latest logs needed: " NUMBER
        echo " "
        journalctl -q | grep "Failed password for invalid user" | tail -n$NUMBER
        ;;
#WSucessfully access to the server
       Valid-Access-Log)
        echo "# Successfully Access #"
        echo " "
        journalctl -q | grep "Accepted password for"
        ;;
#HTTPD error from Journalctl
        Journalctl-Httpd)
        echo "# HTTP Error From Jornalctl #"
        ERRORHTTPD=$(journalctl -u httpd | wc -l | uniq)
        echo " "
        echo "There are $ERRORHTTPD Apache error from Jornalctl"
        echo " "
        journalctl -u httpd
        ;;
#Error HTTP
        Http-Error)
        echo "# Error From Apache Log File #"
        echo " "
        ERRORAPACHELOG=$(cat /var/log/httpd/error_log | wc -l | uniq)
        echo "The log file contains $ERRORAPACHELOG in the log file"
        echo " "
        cat /var/log/httpd/error_log
        ;;
#DB Log Error
        DB-Log-Error)
        echo "# Error From MySql Log File #"
        echo " "
        ERRORMYSQL=$(cat /var/log/mariadb/mariadb.log | wc -l | uniq)
        echo "The log file contains $ERRORMYSQL alert/error"
        echo " "
        cat /var/log/mariadb/mariadb.log
        ;;
#PHP Log Error
        PHP-Log-Error)
        echo "Error From PHP Log File"
        echo " "
        ERRORPHP=$(cat /var/log/php-fpm/error.log | wc -l | uniq)
        echo "The log file contains $ERRORPHP alert/error"
        echo " "
        cat /var/log/php-fpm/error.log
        ;;
#Error 404
        HTTP-Error-404)
        echo "Error 404 From Http Request in Log File"
        echo " "
        ERRORHTTP=$(cat /var/log/httpd/www.adrianogarruba.log | grep --color=always ' 404' | uniq | wc -l)
        echo "The log file contains $ERRORHTTP unique error 404"
        read -p "Please insert number of latest logs needed: " NUMBERHTTP
        echo " "
        cat /var/log/httpd/www.adrianogarruba.log | grep --color=always ' 404 ' | uniq | tail -n$NUMBERHTTP
        ;;
#Invalid command
        *)
        echo "Invalid option has been selected, please try again"
        ;;
esac
done
done