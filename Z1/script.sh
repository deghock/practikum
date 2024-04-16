#!/bin/bash
#PBS -N out-tesla
#PBS -l nodes=tesla01

export PATH=.:/bin:/sbin:$PATH

echo имя узла - $(hostname) 
echo
echo версия OC - $(cat /etc/system-release)
echo
echo версия ядра и разрядность - $(uname -mr)
echo
echo окружение:
echo $(echo $PATH)
echo
echo http_proxy и https_proxy:
echo $(env | grep http)
echo
echo CPU - $(cat /proc/cpuinfo | grep "model name" | uniq | cut -c 13-)
echo
echo количество ядер - $(cat /proc/cpuinfo | grep processor | wc -l)
echo
echo оперативная память - $(cat /proc/meminfo | grep MemTotal | cut -c 10-)
echo
echo файловые системы - $(mount | grep ^/dev)
echo
echo сетевые интерфесы и ip-адреса:
echo $(ip addr show | grep "inet ")
echo
echo версия glibc - $(rpm -qa | grep glibc | head -n 1) 
echo
echo версия gcc - $(gcc --version | head -n 1)
echo

if [ -z $(rpm -qa | grep mpicc | head -n 1)]
then 
  echo mpicc не установлен
else 
  echo mpicc установлен
fi
