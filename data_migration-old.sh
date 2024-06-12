server_ip_new = 172.21.0.30
user = six
password = Six4Me

sudo systemctl stop slapd
sudo systemctl stop postfix 
sudo systemctl stop ntpsec 
sudo systemctl stop bind9 
sudo systemctl stop munin-node 
sudo systemctl stop isc-dhcp-server

echo 'Transfer OpenLDAP configuration and data:'

sudo slapcat -v -l /home/six/ldap_backup.ldif
scp /home/six/ldap_backup.ldif $user@$server_ip_new:/home/$user/ldap_backup.ldif
sudo rsync -avz  /etc/ldap/ $user@$server_ip_new:/six/ldap/

exho 'Transfer BIND configuration and zone files: '

sudo rsync -avz  /etc/bind/ $user@$server_ip_new:/six/bind/

echo 'Transfer DHCP server configuration: '

sudo rsync -avz  /etc/dhcp/ $user@$server_ip_new:/six/dhcp/

echo 'Transfer NTPsec configuration: '

sudo rsync -avz  /etc/ntpsec/ $user@$server_ip_new:/six/ntpsec/

echo 'Transfer Postfix configuration: '

sudo rsync -avz  /etc/postfix/ $user@$server_ip_new:/six/postfix/

echo 'Transfer Munin configuration: '

sudo rsync -avz  /etc/munin/ $user@$server_ip_new:/six/munin/