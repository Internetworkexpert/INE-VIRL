#!/bin/bash
sudo apt-get install -y expect
chmod a+x command.sh

declare -a commands=('CFG R1 "show run"' 'CFG R2 "show version"')

for i in "${commands[@]}"
        do
        eval "./command.sh $i"
done

PS1="command> "
echo Usage is './command.sh CFG R1 "show ip route"'
