#! /bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Demo of Nader & Mohamed V2</h1>" | sudo tee /var/www/html/index.html
