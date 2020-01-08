#Batch file to retreive Server Stat inforamtion for CentOS

# ChangeLog
# v0.1 Collect Catalina.out logs, core_env.properties, setenv, TOP, PCUP, RSS, IOTOP, DF, Service info and store it into zip file in /tmp2/yhetemp [Author: Yoichi Hirotake]


rm -rf /tmp2/yhetmp/
sleep 15
varDate=`date`
echo $varDate
varCatalinaTemp=`find / -name "catalina.out" -type f`
#echo $varCatalinaTemp
varCatalinaTempTrim=${varCatalinaTemp%/*}
#echo $varCatalinaTempTrim
varCatalinaPath="$varCatalinaTempTrim/" 
#echo $varCatalinaPath
varDestination=/tmp2/yhetmp/
mkdir -p $varDestination
cp -r $varCatalinaPath $varDestination


varCoreEnvPath=`find / -name "core_env.properties" -type f`
#echo $varCoreEnvPath
cp $varCoreEnvPath $varDestination

varSetEnvPath=`find / -name "setenv.sh" -type f`
#echo $varSetEnvPath
cp $varSetEnvPath $varDestination


varTopCommandResultPath="${varDestination}TOPCommandResult.txt" 
#echo $varTopCommandResultPath
top -n 3 -b >> $varTopCommandResultPath


varPcpuResultPath="${varDestination}PcpuResult.txt"
#echo $varPcpuResultPath
ps -aux --sort -pcpu | head -50 > $varPcpuResultPath

varRssResultPath="${varDestination}RssResult.txt"
#echo $varRssResultPath
ps -aux --sort -rss | head -50 > $varRssResultPath

varIotopResultPath="${varDestination}IotopResult.txt"
#echo $varIotopResultPath
iotop -n 5 >> $varIotopResultPath

varDfResultPath="${varDestination}DfResult.txt"
#echo $varDfResultPath
df -h > $varDfResultPath

varServiceStatusResultPath="${varDestination}ServiceStatusResult.txt"
#echo $varServiceStatusResultPath
systemctl list-units -t service > $varServiceStatusResultPath

zip /tmp2/ServerStat-`date "+%Y_%m%d_%H%M_%S"`.zip -r /tmp2/yhetmp
