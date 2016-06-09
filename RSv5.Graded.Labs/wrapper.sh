#!/bin/bash
sudo apt-get install -y expect

declare -a commands=('CFG R1 "show run"' 'CFG R2 "show version"')

for ((i=0; i < ${#commands[@]}; i++))
do
  sh command.sh ${commands[$i]}
done
