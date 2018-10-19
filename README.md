# Gertzenstein.local

So we had this school-task to set up an openldap server and import all users from a really broken windows server 2003 with ad on it.
I wrote this script to get knowledge about ldap and to import those users.

## What does this script?
It takes an ldif export from what ever, puts every row in variables and writes an new clean ldif.

## I have the same task from school, what do i need to do?
I gonna walk you throu:
1. Create your env. I did it with an debian 9 vm
2. install slapd (openldap)
3. install phpldapadmin if you need to (we had to)
4. get an ldif from the windows server
	1. open cmd on the windows server
	2. type: ```ldifde -f export.ldf -s GERTZENSTEIN -d "dc=gertzenstein,dc=local" -p subtree
5. get the file to the linux server (i prefer winscp or via samba)
6. clone this repo
7. reconfigure your slapd: (```dpkg-reconfigure slapd```) and make sure you have the following options:
	1. Organization Name: gertzenstein.local
	2. Database backend to use: HDB
8. Edit the ppolicy/import.sh to add you administrator password.
9. cd into the ppolicy folder and execute import.sh
10. use dos2unix to convert the ldf file from windows (due to new characters that are somewhat tricky)
	1. save a copy of your exportfile
	2. ```dos2unix ${exportfile}``` 
11. execute the ldif_parser 
	1. ```./ldif_parser {convertet ldif file} {output file}```
12. read the last few lines from the script and alter the entries that show here (doubled entries,entries with unicode,entries with other characters)
13. import the outputfile with ldapadd
	1. ```ldapadd -x -D "cn=admin,dc=gertzenstein,dc=local" -w PASSWORD -H ldap:// -f ${outputfile of ldif_parser}```
14. profit.
15. You may now also have to install a third party app that logins via ldap. For that i would suggest nextcloud.

## I have the same task from school, can you help me?
Yes, open an issue please


