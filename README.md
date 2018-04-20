# Arch.

```
----------------------------------------------
|                   HTTP Client              |
----------------------------------------------
                      |
                    -----
                    |vip|
                    -----
                /           \
            /                   \
        /                           \
-------------------            -------------------
| RESTful API -|  |            | RESTful API -|  |
|              |  |            |              |  |
| [ Active ]   |  | -> sync -> | [ Standby ]  |  |
|              |  |            |              |  |
|-----         |  |            |-----         |  |
| DB | <-------|  |            | DB | <-------|  |
-------------------            -------------------
```

vip : 192.168.33.100

DB : MariaDB v10.2

Turn off selinux

Turn off firewall

---

# Possible point of failure on the active node

1. power off <- handled by vrrp
2. nic down <- detected by tracking script (then trigger keepalived process down)
3. keepalived process down <- handled by vrrp
4. api process down <- detected by tracking script (then trigger keepalived process down)
5. db process down <- detected by tracking script (then trigger keepalived process down)

---

# Passed test case

1. active node :: power on - > every service on - > master state - > get vip
2. standy node :: power on - > every service on - > backup state
3. active node :: power off - - fail over - -> standby node
    1. power on back - > no preempt
4. active node :: nic down - - fail over - -> standby node
    1. nic on back - > no preempt
5. active node :: keepalived process down - - fail over - -> standby node 
    1. keepalived process on back - > no preempt

---

# Mode

* ap : active-standby
  * ap unit : disabled
  * svc unit : (i.e. keepalived + httpd + mysqld) : disabled
* m : maintenance
  * ap unit : masked
  * svc unit : masked
* s : standalone
  * ap unit : enabled
  * svc unit : disabled


```
(ap,ap) - - auto - - > (m,s)
    ^                   v
    |                   |
    ------ manually -----
```

---

# Specific configuration for the active node

1. keepalived :: notification script :: master
    1. turn off db replication
    2. turn on db write permission
2. keepalived :: notification script :: backup
3. keepalived :: notification script :: fault
    1. enter m node

# Specific configuration for the standby node

1. keepalived :: notification script :: master
    1. turn off db replication
    2. turn on db write permission
    3. enter s node
2. keepalived :: notification script :: backup
    1. turn on db replication
    2. turn off db write permission
3. keepalived :: notification script :: fault

---

# Something you may need

Launch a local mysql server instance for development

```
docker run --name mysqld -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d mysql:5.7.21
```

Populate db schema (via SQLAlchemy)

```
cd data/falcon_app/
bash init_model.sh
```

Insert a record (via SQLAlchemy)

```
cd data/falcon_app/
python add_record.sh
```

---

# Lesson learned

Workaround for keepalived failed to attach vip to nic after reboot

```
ExecStart=/bin/at now + 3 minutes -f /usr/local/bin/start-ap.sh
```

To test nic down, use `ifconfig down` rather than `ifdown`

To use `nopreempt`, both of nodes need specify it

Use unicast rather than multicast

---

# To refactor

## Parameterization

codename
* AS-IS ap
* TO-BE ?

vip
* AS-IS 192.168.33.100
* TO-BE ?

host1 ip
* AS-IS 192.168.33.101
* TO-BE ?

host2 ip
* AS-IS 192.168.33.102
* TO-BE ?

host1 nic
* AS-IS enp0s8
* TO-BE ?

host2 nic
* AS-IS enp0s8
* TO-BE ?

mysql password
* AS-IS (empty)
* TO-BE ?

## Runtime home

mode file
* AS-IS /opt/ap-mode
* TO-BE ?

manage script home
* AS-IS /usr/local/bin
* TO-BE ?

keepalived script home
* AS-IS /usr/local/bin
* TO-BE ?
