# docker-kerberos-apache
minimal docker config for running a kerberized apache

## prerequisites
create a SPN for your container on your host - I assume that your host is already kerberized

### get ticket
```
sudo kinit <domain-admin>
```

### redirect kerberos keytab-file and create SPN
```
sudo export KRB5_KTNAME=FILE:./conf/HTTP.keytab
sudo net ads keytab CREATE
sudo net ads keytab ADD HTTP
sudo unset KRB5_KTNAME
```

### copy krb5.conf
```
cp /etc/krb5.conf ./conf
```
