SET GLOBAL gtid_slave_pos = "";

CHANGE MASTER TO master_use_gtid = slave_pos,
    MASTER_HOST='192.168.33.101',
    MASTER_USER='replication',
    MASTER_PASSWORD='my-password',
    MASTER_PORT=3306,
    MASTER_CONNECT_RETRY=10;

START SLAVE;
