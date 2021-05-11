# !/bin/bash
sudo -u root useradd -u 505 -g 505 Andrei_Astrouski 
sudo -u root groupadd -g 600 staff
sudo -u root useradd -u 600 -g 600 mongo
sudo -u root mkdir -p /apps/mongo
sudo -u root chmod 750 /apps/mongo
sudo -u root chown mongo:staff /apps/mongo
sudo -u root mkdir /apps/mongodb
sudo -u root chmod 750 /apps/mongodb
sudo -u root chown mongo:staff /apps/mongodb
sudo -u root mkdir -p /logs/mongo
sudo -u root chmod 740 /logs/mongo
sudo -u root chown mongo:staff /logs/mongo
sudo -u mongo wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.6.5.tgz -P /apps/mongo
sudo -u mongo curl https://fastdl.mongodb.org/src/mongodb-src-r3.6.5.tar.gz > /apps/mongo/mongodb-src-r3.6.5.tar.gz
sudo -u mongo tar xzvpf /apps/mongo/mongodb-linux-x86_64-3.6.5.tgz -C /tmp/
sudo -u mongo cp -a /tmp/mongodb-linux-x86_64-3.6.5 /apps/mongo
export PATH=$PATH:/apps/mongo/mongodb-linux-x86_64-3.6.5/bin
sudo -u mongo echo export PATH=$PATH:/apps/mongo/mongodb-linux-x86_64-3.6.5/bin >> ~/.bashrc
sudo -u root echo "mongo	soft	nproc	32000" >> /etc/security/limits.d/20-nproc.conf
sudo -u root echo "mongo	hard	nproc	32000" >> /etc/security/limits.d/20-nproc.conf
sudo -u root usermod -aG staff Andrei_Astrouski
sudo -u root echo $PATH > /etc/environment
sudo -u root tar xvzf /apps/mongo/mongodb-src-r3.6.5.tar.gz 
sudo -u root cp /apps/mongo/mongodb-src-r3.6.5/rpm/mongod.conf /apps/mongo/mongodb-linux-x86_64-3.6.5
sudo -u root mv /apps/mongo/mongodb-linux-x86_64-3.6.5/mongod.conf /apps/mongo/mongodb-linux-x86_64-3.6.5/bin/mongo.conf
sudo -u root 
sudo -u root sed -i "s:/var/log/mongodb/mongod.log: /logs/mongo/mongo.log:g" /apps/mongo/mongodb-linux-x86_64-3.6.5/bin/mongo.conf
sudo -u root sed -i "s:/var/lib/mongo/mongo.pid: /apps/mongodb/mongo.pid:g" /apps/mongo/mongodb-linux-x86_64-3.6.5/bin/mongo.conf
sudo -u root sed -i "s:/var/run/mongodb/mongo.pid/: /apps/mongodb/mongod.pid:g" /apps/mongo/mongodb-linux-x86_64-3.6.5/bin/mongo.conf
sudo -u root sed -i "s:SELINUX=enforcing: SELINUX=disabled:g " /etc/selinux/config
sudo -u root mkdir /etc/systemd/system
sudo -u root touch /etc/systemd/system/mongo.service
sudo -u root echo [Unit] >> /etc/systemd/system/mongo.service
sudo -u root echo description= "mongo service" >> /etc/systemd/system/mongo.service
sudo -u root echo After=network.target  >> /etc/systemd/system/mongo.service
sudo -u root echo [Service] >> /etc/systemd/system/mongo.service
sudo -u root echo User=mongo  >> /etc/systemd/system/mongo.service
sudo -u root echo ExecStart=/apps/mongo/mongodb-linux-x86_64-3.6.5/bin/mongo.conf >> /etc/systemd/system/mongo.service
sudo -u root echo [Install] >> /etc/systemd/system/mongo.service
sudo -u root echo WantedBy=multi-user.target >> etc/systemd/system/mongo.service
sudo -u root alias mongo="/apps/mongo/mongodb-linux-x86_64-3.6.5/bin/mongo.conf"
sudo -u root systemctl enable mongo.service
sudo -u systemctl enable mongo
