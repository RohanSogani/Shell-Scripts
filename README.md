This repo contains some of the shell scripts that automate a few things

1. createIpConfig.sh - creates ifconfig.txt file of Docker containers in sequence\
   To execute the script
   ```console
   foo@bar:~$ chmod +x createIpConfig.sh
   foo@bar:~$ ./createIpConfig.sh
   ```
   For e.g. if the docker containers are in the order s2 (172.20.0.2), s3 (172.20.0.5), s4 (172.20.0.3), s1 (172.20.0.6), c1 (172.20.0.4), the ifconfig.txt will have IPs in the order s1..s4 and then c1.\
   Output would be\
   172.20.0.6\
   172.20.0.2\
   172.20.0.5\
   172.20.0.3\
   172.20.0.4\


