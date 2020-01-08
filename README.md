# CentOS Server Stat
- The batch file to retrieve server status of CentOS machine

# What does this bath file do?
This batch file collects following infomraiton and store them into a zip file.
- Catalina.out logs 
- core_env.properties
- setenv.sh
- TOP
- PCUP
- RSS
- IOTOP
- DF 
- Service info

# Instruction
1. Download Cent_ServerStat.sh into your CentOS machine
2. Oepn a terminal. Change the account to root e.g. run command <B>su</B>
3. In the terminal move to the directory where you downloaded and run 
   <B>chmod u+x ./Cent_ServerStat.sh</B>
4. run <B>./Cent_serverStat.sh</B>
5. The serverstat will be generated into Serverstat-<Date/Time>.zip in direcotry /tmp2/yhetmp

# Disclaimer
Please use it on your own risk. 

# License
This project is provided "AS IS", without any warranty, under the MIT License - see the LICENSE file for details
