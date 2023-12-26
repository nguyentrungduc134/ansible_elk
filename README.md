# Ansible Vagrant profile for ELK (Elasticsearch, Logstash, Kibana)

This solution install elk on virtualbox using vagrant and windows wsl
vagrant up logs
vagrant up web

#Use python interperter as below, running test as root:
ansible-playbook -e 'ansible_python_interpreter = /usr/bin/python3.6' -b -i provisioning/elk/inventory provisioning/elk/main.yml -uroot

#remove this from vhost configration file (using default ) /etc/nginx/conf.d/kibana.conf
 /etc/nginx/proxy_params

 #some file module section not create directory: mannually fix
 
 #disble plugins-codecs-multiline
 https://www.elastic.co/guide/en/logstash/current/plugins-codecs-multiline.html

### Setting up your hosts file

You need to modify your host machine's hosts file (Mac/Linux: `/etc/hosts`; Windows: `%systemroot%\system32\drivers\etc\hosts`), adding the lines below:

    192.168.56.90  logs.test
    192.168.56.91  web.test

(Where `logs.test`/`web.test` is the hostname you have configured in the `Vagrantfile`).

After that is configured, you could visit http://logs.test/ in a browser, and you'll see the Kibana dashboard, and you can visit http://web.test/, and you'll see Nginx's default index page.

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://docs.rackspace.com/support/how-to/modify-your-hosts-file/) from Rackspace.


