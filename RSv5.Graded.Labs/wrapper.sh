#!/bin/bash
sudo apt-get install -y expect

COMMAND[0]="CFG R1 \"show run\""
COMMAND[1]="CFG R2 \"show version\""

for i in "${COMMAND[@]}"
do
  sh command.sh $i
done
