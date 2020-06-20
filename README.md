### Server-control

#### Exential Server log and service control

The purpose of this script is to access faster to the service status of Apache and MySQL and look the main logs files.
This script has been developed and tested on instance CentOS 8.

**Author:** Adriano Garruba [website](https://adrianogarruba.com/) </br>
**Date:** 20/06/2020 </br>
**Release** 1.0 </br>

### How to use it

1. Script is located in the file called: **server-control.sh**
 - Before proceding it is suggested to configure it as per next chapter "Configuration and Functionalities" 
2. It should run in your Linux instance.
3. Just follow the questions that the script required.

### Configuration and Functionalities

This script has been tested on instance CentOS 8, some commands should be configured as per the log path and log file name that in some Linux version can be different as well as the service commands.

**Commands:**

Due to the different Linux environments and service used (example Nginx instead of Apache) these commands needs to be verified. 

- systemctl status httpd 
- systemctl status mysql

**Journalctl**

- Below logs have been filter out from the **Journalctl**

  - Invalid-Access-Log
  - Valid-Access-Log
  - Journalctl-Httpd 

**Log Path**

In different Linux enviroments the path or the log files can be different.

- /var/log/httpd/error_log
- /var/log/mariadb/mariadb.log
- /var/log/php-fpm/error.log
- /var/log/httpd/www.adrianogarruba.log (It is mine and in your case I guess should be different)

### Consideration

- The use of this code and any issue occurred will be at your responsibility.
- This script has been created for my personal use and educational purpose, I will highly appreciate any kind of suggestions.

<br>

**Sample Menu**

<img src="https://i.ibb.co/b56fBNz/mainmenu.png" alt="mainmenu" border="0">

**Sample Invalid Access Log Functionality**

<img src="https://i.ibb.co/318cCLp/Invalidusers.jpg" alt="Invalidusers" border="0">
