# ssh-key-server-add
Script that adds multiple SSH keys to multiple servers.

[![GitHub release](https://img.shields.io/badge/release-v1.1.0-succes)](https://github.com/tomeksdev/ssh-key-server-add/releases/tag/v1.1.0)

## Instructions
To download this script, click [THIS LINK](https://github.com/tomeksdev/ssh-key-server-add/releases/download/v1.1.0/Import_SSH_Keys.tar.gz) or follow the commands below.

To download it from the server, if you did not download it from the browser, you must enter the following command.

``` 
wget https://github.com/tomeksdev/ssh-key-server-add/releases/download/v1.1.0/Import_SSH_Keys.tar.gz
```
OR

```
git clone https://github.com/tomeksdev/ssh-key-server-add.git
```

If you downloaded from a browser or with the ``wget`` command, you need to unpack the downloaded file with the following command. If you are working with git, you can skip this step.

```
tar -xvf Import_SSH_Keys.tar.gz
```

Once the file is unzipped or cloned with Git, we only need to do two things to make the script work. First, we need to add an executable right to the ``import_ssh.sh`` file, which we can then run.

```
chmod +x import_ssh.sh
```

Secondly, we need to fill or modify the ``servers.txt`` and ``keys.txt`` configuration files:

- servers.txt
> Add multiple servers with root@ip_address. Each server in a new line.

- keys.txt
> Add or change keys if necessary. Also each ssh key in a new line.

And last but not least run the script:

```
sh import_ssh.sh
```
OR
```
./import_ssh.sh
```

## Vesrions

#### version v1.1.0
[![GitHub release](https://img.shields.io/badge/release-v1.1.0-success)](https://github.com/tomeksdev/ssh-key-server-add/releases/tag/v1.1.0)
- The script now checks on each server whether the file authorized_keys exists
- It now checks if the key from the keys.txt file exists in the authorized_keys file, and skips it in this case
- It checks if the file servers.txt exists or is empty
- Now the script can be executed without deleting all ssh keys from the servers
- Create nicer echo on the console

#### Version v1.0.0
[![GitHub release](https://img.shields.io/badge/release-v1.0.0-9cf)](https://github.com/tomeksdev/ssh-key-server-add/releases/tag/v1.0.0)
- Add all keys from keys.txt file to all servers reading servers.txt files
- Old ssh keys must be deleted on each server to run the script again
- If the keys.txt file does not exist or is empty, the script will not run
