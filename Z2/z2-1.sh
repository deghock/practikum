#!/bin/bash

cd $HOME/Z/Z2

for node in node-2 node-9 node-13 node-25 node-26 node-27 tesla01 tesla02
do
  qsub -q smm -l nodes=$node -N $node simple-task.sh &> /dev/null
done

sleep 6

for node in node-2 node-9 node-13 node-25 node-26 node-27 tesla01 tesla02 
do
  if [ -f $node.e* ] && [ -z $(cat $node.e*) ]; then
    echo "узел $node доступен"
  else
    echo "узел $node не доступен !!!!!!"
  fi
done

rm node* tesla*
