CREATE USER 'replication'@'%' IDENTIFIED BY 'my-password';
GRANT REPLICATION SLAVE ON *.* TO 'replication'@'%';
