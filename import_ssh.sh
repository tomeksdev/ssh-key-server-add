#!/bin/bash
set -x # enable bash debug mode
if [ -s keys.txt ]; then # if file exists and not empty
    for ip in `cat servers.txt`; do # for each line from the file
        ssh "$ip" 'rm ~/.ssh/authorized_keys'
        # add EOL to the end of the file (i.e., after the last line)
        # and echo it into ssh, where it is added to the authorized_keys
        sed -e '$s/$/\n/' -s keys.txt | ssh "$ip" 'cat >> ~/.ssh/authorized_keys'
    done
else
    echo "Add ssh keys to servers(servers.txt) from file keys.txt!"
fi