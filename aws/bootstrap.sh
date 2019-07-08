#!/bin/bash
sudo yum install -y git
git clone https://github.com/y0zg/simple-node-js-react-npm-app.git /opt/react
cd /opt/react
sudo chown ec2-user:ec2-user -R /opt/react  
touch test_$(date +%F)
sudo amazon-linux-extras install -y epel
sudo yum install -y npm nodejs
su - ec2-user -c "cd /opt/react && npm install"
su - ec2-user -c "cd /opt/react && nohup npm start &"
