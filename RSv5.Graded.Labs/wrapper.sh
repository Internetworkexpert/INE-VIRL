#!/bin/bash
sudo apt-get install -y expect
chmod a+x command.sh
chmod a+x lab1.ts.sh


# commenting out auto command runs
# declare -a commands=('CFG R1 "show run"' 'CFG R2 "show version"')
# 
# for i in "${commands[@]}"
#         do
#         eval "./command.sh $i"
# done

echo Usage is './command.sh CFG R1 "show ip route"'

./lab1.ts.sh
