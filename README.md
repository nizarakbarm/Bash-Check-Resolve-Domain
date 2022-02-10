# Bash-Check-Resolve-Domain
A repository of bash script that can be used for checking domain resolving. You can run it using cron too

## Requirement
```
curl
geoiplookup (you can search at your os repository which package that provide geoiplookup)
```
## How to Use
1. Fill your domain at listdomain file
   Example:
   ```
   example.com
   example2.com
   ```
2. Change permission of file checkdnsrsolve.sh to 700 with `chmod 700 checkdnsrsolve.sh`
3. Run it using ./checkdnsrsolve.sh

If you want to run it at cronjob, you can add it at your cronjob by using `crontab -e`, then fill it like this:
```
* * * * * /path/checkdnsrsolve.sh
```
Note: 
path must be changed by directory path of your file
the time of cronjob can be changed according to the needs. If you need to run it once 30 minutes, you must change it to `*/30 * * * *`

The result can be checked at log_check_dns_resolve_public_dns_[domainname]. Note: domainname part is the domain name
