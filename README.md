# ansible-powerdns

## requirements

* Vagrant
* Ansible

## setup

Add below lines to $HOME/.ssh/config of local machine.

    Host 10.200.19.*
        User vagrant
        IdentityFile ~/.vagrant.d/insecure_private_key
        UserKnownHostsFile /dev/null
        StrictHostKeyChecking no

Clone this repository.

    $ git clone https://github.com/akagisho/ansible-powerdns.git
    $ cd ansible-powerdns

Add vagrant box.

    $ vagrant box add ubuntu-server-12.04-amd64 \
          http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box

Start VMs.

    $ vagrant up

Check VMs' connection.

    $ ansible -i stage/inventory all -m ping
    10.200.19.10 | success >> {
        "changed": false,
        "ping": "pong"
    }
    
    10.200.19.11 | success >> {
        "changed": false,
        "ping": "pong"
    }
    
    10.200.19.12 | success >> {
        "changed": false,
        "ping": "pong"
    }

## execute

Execute ansible playbook.

    $ ansible-playbook -i stage/inventory site.yml

Check installation.

    $ for i in 10.200.19.10 10.200.19.11 10.200.19.12; do dig @$i example.com. soa +short; done
    ns1.example.com. admin.example.com. 2014052907 10800 7200 604800 10800
    ns1.example.com. admin.example.com. 2014052907 10800 7200 604800 10800
    ns1.example.com. admin.example.com. 2014052907 10800 7200 604800 10800

## use

Access PowerDNS on Rails interface with admin@example.com/secret.

* [http://10.200.19.10/](http://10.200.19.10/)

## references

* [PowerDNS + BIND で DNS を構築する](http://blog.akagi.jp/archives/4205.html) - あかぎメモ
