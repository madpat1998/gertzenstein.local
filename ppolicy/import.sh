#!/bin/bash
password=Poke1234
ldapadd -Y EXTERNAL -H ldapi:///  -f /etc/ldap/schema/ppolicy.ldif
ldapadd -D cn=admin,dc=gertzenstein,dc=local -w $password -f policies.ldif
ldapadd -Y EXTERNAL -H ldapi:///  -f ppmodule.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f ppolicyoverlay.ldif
ldapadd -D cn=admin,dc=gertzenstein,dc=local -w $password -f passwordpolicy.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -f memberof_config.ldif
ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f refint1.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -f refint2.ldif



