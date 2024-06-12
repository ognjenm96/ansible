server_ip_new=172.16.2.142
user=six
password=Six4Me

sudo slapcat -v -l /home/six/ldap_backup.ldif
scp /home/six/ldap_backup.ldif $user@$server_ip_new:/home/$user/ldap_backup.ldif
read -s password
sudo rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" /etc/ldap/ $user@$server_ip_new:/home/$user/


read -s password
sudo rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" /etc/bind/ $user@$server_ip_new:/home/$user/

read -s password
sudo rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" /etc/dhcp/ $user@$server_ip_new:/home/$user/

echo 'Transfer NTPsec configuration: '
read -s password
sudo rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" /etc/ntpsec/ $user@$server_ip_new:/home/$user/

echo 'Transfer Postfix configuration: '
read -s password
sudo rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" /etc/postfix/ $user@$server_ip_new:/home/$user/

echo 'Transfer Munin configuration: '
read -s password
sudo rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" /etc/munin/ $user@$server_ip_new:/home/$user/