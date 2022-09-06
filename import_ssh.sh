#!/bin/bash
FILE=.ssh/authorized_keys
if [ -s keys.txt ]; then # if file exists and not empty
    if [ -s servers.txt ]; then # if file exists and not empty
        for ip in `cat servers.txt`; do # for each line from the file
            if ssh -q "$ip" [[ -f "$FILE" ]]; then # if exist than chel other parameters
                cat keys.txt |
                while IFS= read key; do
                    if ssh -q $ip "grep -qxF '${key}' ${FILE}" < /dev/null; # if key exists in file
                    then
                        # print only that exist
                        echo "Key exist!"
                    else
                        # print that key is imported and execute ECHO command
                        echo "Key Imported!"
                        ssh -q $ip "echo '${key}' >> '${FILE}'" < /dev/null
                    fi
                done
            else
                # if file doesent exist, with this we copy whole keys.txt file
                # add EOL to the end of the file (i.e., after the last line)
                # and echo it into ssh, where it is added to the authorized_keys
                sed -e '$s/$/\n/' -s keys.txt | ssh -q "$ip" 'cat >> ~/.ssh/authorized_keys'
                echo "Keys added succesfully!"
            fi
        done
    else
        echo "File servers.txt is empty or doesent exist!"
    fi
else
    echo "File keys.txt is empty or doesent exist!"
fi