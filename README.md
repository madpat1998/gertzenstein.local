# Gertzenstein.local

So we had this school-task to set up an openldap server and import all users from a really broken windows server 2003with ad on it.
I wrote this script to get knowledge about ldap and to import those users.

## What does this script?
It takes an ldif export from what ever, puts every row in variables and writes an new clean ldif.

## I have the same task from school, what do i need to do?
I gonna walk you throu:
1. Create your env. I did it with an debian 9 vm
2. install slapd (openldap)
3. install phpldapadmin if you need to
4. get an ldif from the windows server ("I later declare how")
5. get the file to the linux server
6. clone this repo
7. reconfigure your slapd: (dpkg-reconfigure slapd) and make sure you have the following options:
7.1 Organization Name: gertzenstein.local
7.2 Database backend to use: HDB
8. Edit the ppolicy/import.sh to add you administrator password.
9. execute it
10. execute the ldif_parser {original ldif from windows} {output file} 
11. import the outputfile with ldapadd
12. profit.


## I have the same task from school, can you help me?
Yes, open an issue please


