#!/bin/bash
#This is an automcatic installation of wap scripts
#Lamp scripts creation time is 2017年
echo -e "\033[32m 欢迎使用wap自动安装脚本!\033[0m"
echo -e "\033[32m Welcome to wap automatically install the script!
   1) Stop tomcat service.
   2) Copy the wap installation package.
   3) Remove the installer.
   4) Start tomcat service.\033[0m"
sleep 0.1
read -p "Please Input 1,2,3,4,5: "
Wlc-wap_HOME=/home/tomcat1/webtomcat/webapps/wlc-wap
tomcat1_DIR=/home/tomcat1/webtomcat/bak
##停止tomcat服务
if [[ "$1" -eq "1" ]];then
	/home/tomcat1/tomcatstop
fi

##拷贝wap包
if [[ "$1"  -eq "2" ]];then
	/root/3.expect && mv $tomcat1_DIR/wlc-wap.war $tomcat1_DIR/wlc-wap$(date +%Y-%m-%d).war
	echo -e "\033[32mThe remote installation package copy is successful, please check if it exists\033[0m"
fi
## 删除jar旧包程序，并解压新包
if [[ "$1" -eq "3" ]];then
    rm -rf $Wlc-wap_HOME/* && unzip -ouq $tomcat1_DIR/wlc-wap$(date +%Y-%m-%d).war -d $tomcat1_DIR && cp -r $tomcat1_DIR/wlc-wap$(date +%Y-%m-%d) $Wlc-wap_HOME/
	echo -e "\033[32mRemove and unpack the new package. Please check and start the service\033[0m"
fi
## 启动tomcat服务
if [[ "$1" -eq "4" ]];then
	/home/tomcat1/tomcatstart
fi
## 日志监听
