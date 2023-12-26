ssh-keygen -R 192.168.56.91
sshpass -p 123456 ssh-copy-id -o StrictHostKeyChecking=no root@192.168.56.91
ansible-playbook -b -i provisioning/web/inventory provisioning/web/main.yml -uroot
