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


## How to Check If The Domain Resolved Properly with The Resolver that Used at ip_dns_resolver_good_reliability


1. Get All IP From Resolver
   ```
   cat ip_dns_resolver_good_reliability | sed "s#\.#\/.#g" | tr "\n" "|"
   ```

   Copy all the output of the command without the last `|`
   
   Example the output that copied: 
   `103/.153/.154/.2|103/.26/.250/.4|1/.1/.1/.1|12/.121/.117/.201|125/.209/.116/.22|163/.172/.107/.158|164/.124/.101/.2|176/.103/.130/.130|185/.107/.80/.84|185/.228/.168/.9|185/.83/.212/.30|194/.145/.240/.6|194/.209/.157/.109|195/.235/.225/.10|200/.248/.178/.54|201/.144/.135/.211|202/.136/.162/.11|202/.46/.34/.75|203/.94/.227/.70|204/.117/.214/.10|208/.67/.222/.220|210/.48/.77/.68|31/.7/.37/.37|5/.11/.11/.5|61/.8/.0/.113|66/.199/.45/.225|66/.206/.166/.2|80/.196/.100/.209|83/.137/.41/.9|84/.200/.70/.40|8/.8/.8/.8|98/.113/.146/.9|9/.9/.9/.9`

2. Execute this command
   ```
   cat log_check_dns_resolve_public_dns_exampe.com| grep -v [change_with_the_expcted_ip_that_resolved] | egrep [pastetheoutputfrombefore]
   ``` 

   Example of the command:
   ```
   cat log_check_dns_resolve_public_dns_exampe.com| grep -v "167.99.44.44" | grep "103/.153/.154/.2|103/.26/.250/.4|1/.1/.1/.1|12/.121/.117/.201|125/.209/.116/.22|163/.172/.107/.158|164/.124/.101/.2|176/.103/.130/.130|185/.107/.80/.84|185/.228/.168/.9|185/.83/.212/.30|194/.145/.240/.6|194/.209/.157/.109|195/.235/.225/.10|200/.248/.178/.54|201/.144/.135/.211|202/.136/.162/.11|202/.46/.34/.75|203/.94/.227/.70|204/.117/.214/.10|208/.67/.222/.220|210/.48/.77/.68|31/.7/.37/.37|5/.11/.11/.5|61/.8/.0/.113|66/.199/.45/.225|66/.206/.166/.2|80/.196/.100/.209|83/.137/.41/.9|84/.200/.70/.40|8/.8/.8/.8|98/.113/.146/.9|9/.9/.9/.9"
   ```

   If there is no result then your domain resolved properly. If you executed the script with cron, then your domain probably resolved properly all the time when your cron executed.

   And change example.com with your domain that will be checked.
