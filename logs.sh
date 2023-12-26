ssh-keygen -R 192.168.56.90
sshpass -p 123456 ssh-copy-id -o StrictHostKeyChecking=no root@192.168.56.90
ansible-playbook -b -i provisioning/elk/inventory provisioning/elk/main.yml -uroot
