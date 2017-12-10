# docker-kerberos-apache
minimal docker config for running a kerberized apache

## prerequisites
create a SPN for your container on your host - I assume that your host is already kerberized

### get ticket
```
kinit <domain-admin>
```

### redirect kerberos keytab-file and create SPN
```
export KRB5_KTNAME=FILE:./conf/HTTP.keytab
net ads keytab CREATE
net ads keytab ADD HTTP
unset KRB5_KTNAME
```

### copy rkb5.conf
```
cp /etc/krb5.conf ./conf
```
